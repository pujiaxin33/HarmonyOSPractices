
import { TimelineMomentCommentModel, TimelineMomentImageModel, TimelineMomentModel } from '../models/TimelineMomentModel'
import { LoadingImage } from './LoadingImage'
@Preview
@Component
export struct TimelineMomentCard {
  model: TimelineMomentModel

  build() {
    Column() {
      Row({space: 5}) {
        Image(this.model.sender.avatar)
          .width(50)
          .height(50)
          .borderRadius(3)

        Column({ space: 5 }) {
          this.Header()

          if (this.model.hasImages) {
            this.Photos()
          }

          if (this.model.hasComments) {
            this.Comments()
          }
        }
        .layoutWeight(1)
      }
      .alignItems(VerticalAlign.Top)
      .margin({ top: 5 })

      Divider()
        .margin({top: 20})
        .color(Color.Black)
    }
    .width('100%')
    .padding({left: 15, right: 15})
  }

  @Builder
  private Header() {
    Column() {
      Text(this.model.sender.username)
        .fontColor(Color.Blue)
        .fontWeight(FontWeight.Medium)
        .width('100%')
        .textAlign(TextAlign.Start)

      Text(this.model.content)
        .width('100%')
        .textAlign(TextAlign.Start)
    }
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  private Photos() {
    Grid() {
      ForEach(this.model.images, (item: TimelineMomentImageModel) => {
        GridItem() {
          LoadingImage({url: item.url})
            .width('100%')
            .height('100%')
        }
      })
    }
    .columnsTemplate(this.model.imagesColumnsTemplate)
    .rowsTemplate(this.model.imagesRowsTemplate)
    .columnsGap(10)
    .rowsGap(10)
    .width(this.model.photosWidth)
    .height(this.model.photosHeight)
  }
  
  @Builder
  private Comments() {
    Column({space: 2}) {
      ForEach(this.model.comments, (item: TimelineMomentCommentModel) => {
        this.Comment(item)
      }, (item: TimelineMomentCommentModel) => JSON.stringify(item))
    }
    .width('100%')
  }

  @Builder
  private Comment(model: TimelineMomentCommentModel) {
    Row() {
      Text(`${model.sender.nick}：`)
        .fontColor(Color.Blue)
        .fontSize(12)

      Text(model.content)
        .fontSize(12)
    }
    .width('100%')
    .padding(2)
    .backgroundColor(Color.Gray)
    .borderRadius(2)
  }
}