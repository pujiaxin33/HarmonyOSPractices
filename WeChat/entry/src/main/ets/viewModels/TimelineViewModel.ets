
import prompt from '@ohos.prompt'
import { TimelineMomentModel } from '../models/TimelineMomentModel'
import { TimelineProfileModel } from '../models/TimelineProfileModel'
import { TimelineProfileEntity } from '../repositories/Entities/TimelineProfileEntity'
import { TimelineUseCase } from '../useCases/TimelineUseCase'

export class TimelineViewModel {
  profile: TimelineProfileModel
  moments: TimelineMomentModel[] = []
  private useCase: TimelineUseCase = new TimelineUseCase()

  loadData() {
    // this.requestData()
    this.requestProfile()
    this.requestMoments()
  }

  private requestData() {
    let profilePromise = this.useCase.requestProfile()
    let momentsPromise = this.useCase.requestMoments()

    Promise.allSettled([profilePromise, momentsPromise]).then((results) => {
      let error
      results.forEach((result) => {
        console.log(result.status)
        if (result.status == 'fulfilled') {
          console.log(typeof result.value)
          if (result.value instanceof TimelineProfileEntity) {
            console.log("TimelineProfileEntity")
            this.profile = new TimelineProfileModel(result.value)
          } else {
            console.log("array data")
            this.moments = result.value.map(item => {
              return new TimelineMomentModel(item)
            })
          }
        } else {
          error = result.reason
        }
      })
      if (error) {
        this.showErrorToast(JSON.stringify(error))
      }
    })
  }

  private showErrorToast(error: string) {
    prompt.showToast({
      message: error
    })
  }

  private requestProfile() {
    this.useCase.requestProfile().then(profile => {
      this.profile = new TimelineProfileModel(profile)
      console.log(profile.profileImage)
    }).catch(error => {
      console.log(error)
    })
  }

  private requestMoments() {
    this.useCase.requestMoments().then( moments => {
      this.moments = moments.map(item => {
        return new TimelineMomentModel(item)
      })
      console.log(`viewmodel moments: ${this.moments[0].content}`)
    }).catch(error => {
      console.log(error)
    })
  }
}