
import { TimelineProfileModel } from '../models/TimelineProfileModel'
import { TimelineProfileEntity } from '../repositories/Entities/TimelineProfileEntity'

@Preview
@Component
export struct TimelineHeader {
  model: TimelineProfileModel = new TimelineProfileModel({
    profileImage: "https://xianmobilelab.gitlab.io/moments-data/images/user/profile-image.jpeg",
    avatar: "https://xianmobilelab.gitlab.io/moments-data/images/user/avatar.png",
    nick: "Huan Huan",
    username: "hengzeng"
  })

  build() {
    Stack({ alignContent: Alignment.BottomEnd }) {
      Image(this.model.profileImage)
        .width('100%')
        .height('100%')

      Row() {
        Text(this.model.nick)

        Image(this.model.avatar)
          .width(100)
          .height(100)
      }
      .margin({right: 15})
    }
    .height(200)
    .width('100%')
  }
}