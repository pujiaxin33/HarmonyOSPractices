
@Component
export struct JobTargetItem {
  build() {
    Column({ space: 5}) {
      this.header()

      Row() {
        this.infoPanel()
        Blank()
        this.progress()
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)
    }
    .width('100%')
    .padding(10)
    .backgroundColor(Color.White)
    .borderRadius(5)
    .alignItems(HorizontalAlign.Start)
  }

  @Builder header() {
    Row({ space: 10 }) {
      Image($r('app.media.job_target_icon'))
        .width(100)
        .height(100)

      Column({ space: 10 }) {
        Text($r('app.string.main_page_target_title'))
          .fontWeight(FontWeight.Bold)

        Text($r('app.string.main_page_target_subtitle'))
          .fontColor(Color.Gray)
          .fontSize(10)
      }
    }
  }

  @Builder infoPanel() {
    Column() {
      Text($r('app.string.main_page_target_whole_progress'))

      Text($r('app.string.main_page_target_update_date'))
        .fontColor(Color.Gray)
        .fontSize(10)

      Text('03/26/2024')
    }
    .alignItems(HorizontalAlign.Start)
  }

  @Builder progress() {
    Stack() {
      Progress({ value: 10, type: ProgressType.Ring })
        .width(50)

      Text('10%')
    }
  }
}