
import prompt from '@ohos.prompt'
import { TimelineMomentModel } from '../models/TimelineMomentModel'
import { TimelineProfileModel } from '../models/TimelineProfileModel'
import { TimelineMomentEntity } from '../repositories/Entities/TimelineMomentEntity'
import { TimelineProfileEntity } from '../repositories/Entities/TimelineProfileEntity'
import { TimelineUseCase } from '../useCases/TimelineUseCase'

export class TimelineViewModel {
  profile: TimelineProfileModel
  moments: TimelineMomentModel[] = []
  isHeaderRefreshing: boolean = false
  private useCase: TimelineUseCase = new TimelineUseCase()
  private innerMoments: TimelineMomentModel[] = []
  private pageIndex: number = 0

  loadData() {
    this.requestData()
  }

  refreshData() {
    this.requestData()
  }

  loadMore() {
    let targetNumber = this.pageIndex * 5
    if (this.innerMoments.length >= targetNumber) {
      this.moments = this.innerMoments.slice(0, targetNumber)
      this.pageIndex += 1
    } else {
      this.moments = this.innerMoments
    }
  }

  private requestData() {
    this.isHeaderRefreshing = true
    setTimeout(() => {

      let profilePromise = this.useCase.requestProfile()
      let momentsPromise = this.useCase.requestMoments()

      Promise.allSettled([profilePromise, momentsPromise]).then((results) => {
        let error
        results.forEach((result) => {
          console.log(result.status)
          if (result.status == 'fulfilled') {
            console.log(typeof result.value)
            if (typeof  (result.value as TimelineProfileEntity).avatar === "string") {
              let value = result.value as TimelineProfileEntity
              this.profile = new TimelineProfileModel(value)
            } else {
              let momentValue = result.value as TimelineMomentEntity[]
              this.innerMoments = momentValue.map(item => {
                return new TimelineMomentModel(item)
              })
              this.showFirstFiveMoments()
            }
          } else {
            error = result.reason
          }
        })
        if (error) {
          this.showErrorToast(JSON.stringify(error))
        }
      })

    }, 2000)
  }

  private showErrorToast(error: string) {
    prompt.showToast({
      message: error
    })
  }

  // private requestProfile() {
  //   this.useCase.requestProfile().then(profile => {
  //     this.profile = new TimelineProfileModel(profile)
  //     console.log(profile.profileImage)
  //   }).catch(error => {
  //     console.log(error)
  //   })
  // }
  //
  // private requestMoments() {
  //   this.useCase.requestMoments().then( moments => {
  //     this.innerMoments = moments.map(item => {
  //       return new TimelineMomentModel(item)
  //     })
  //     this.showFirstFiveMoments()
  //     console.log(`viewmodel moments: ${this.moments[0].content}`)
  //   }).catch(error => {
  //     console.log(error)
  //   })
  // }

  private showFirstFiveMoments() {
    this.isHeaderRefreshing = false
    this.pageIndex = 1
    if (this.innerMoments.length >= 5) {
      this.moments = this.innerMoments.slice(0, 5)
    } else {
      this.moments = this.innerMoments
    }
  }
}