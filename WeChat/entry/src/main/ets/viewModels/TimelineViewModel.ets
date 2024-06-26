
import prompt from '@ohos.prompt'
import router from '@ohos.router'
import { TimelineMomentCommentModel, TimelineMomentModel } from '../models/TimelineMomentModel'
import { TimelineProfileModel } from '../models/TimelineProfileModel'
import { TimelineMomentCommentEntity, TimelineMomentEntity, TimelineMomentSenderEntity } from '../repositories/Entities/TimelineMomentEntity'
import { TimelineProfileEntity } from '../repositories/Entities/TimelineProfileEntity'
import { TimelineUseCase } from '../useCases/TimelineUseCase'

export class TimelineViewModel {
  profile: TimelineProfileModel
  moments: TimelineMomentModel[] = []
  isHeaderRefreshing: boolean = false
  isFooterLoading: boolean = false
  editingMoment?: TimelineMomentModel
  private useCase: TimelineUseCase = new TimelineUseCase()
  private innerMoments: TimelineMomentModel[] = []
  private pageIndex: number = 1
  private hasMore: boolean = true

  loadData() {
    this.requestData()
  }

  refreshData() {
    this.requestData()
  }

  loadMore() {
    if (this.isFooterLoading || !this.hasMore) {
      return
    }
    this.isFooterLoading = true
    setTimeout(() => {

      this.pageIndex += 1
      let targetNumber = this.pageIndex * 5
      if (this.innerMoments.length >= targetNumber) {
        this.moments = this.innerMoments.slice(0, targetNumber)
      } else {
        this.moments = this.innerMoments
        this.hasMore = false
      }
      this.isFooterLoading = false

    }, 2000)
  }

  pushToPhotoPage(url: string) {
    router.pushUrl({url: 'pages/PhotoPage', params: { "url": url }}).then(() => {
      console.log("susscess router")
    }).catch((error) => {
      console.log("error router")
    })
  }

  updateEditingMoment(model: TimelineMomentModel) {
    this.editingMoment = model
  }

  addCommentToEditingMoment(comment: string) {
    let senderEntity: TimelineMomentSenderEntity = {
      username: "鑫鑫",
      nick: "暴走的鑫鑫",
      avatar: "https://xianmobilelab.gitlab.io/moments-data/images/user/avatar.png"
    }
    let commentEntity: TimelineMomentCommentEntity = {
      content: comment,
      sender: senderEntity
    }
    let newComment = new TimelineMomentCommentModel(commentEntity)
    this.editingMoment.comments = this.editingMoment.comments.concat(newComment)
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
    this.isFooterLoading = false
    this.hasMore = true
    this.pageIndex = 1
    if (this.innerMoments.length >= 5) {
      this.moments = this.innerMoments.slice(0, 5)
    } else {
      this.moments = this.innerMoments
    }
  }
}