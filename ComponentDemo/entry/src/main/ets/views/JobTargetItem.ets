
@Component
export struct JobTargetItem {
  build() {
    Column({ space: 5}) {
      Row({ space: 10 }) {
        Image($r('app.media.job_target_icon'))
          .width(100)
          .height(100)

        Column({ space: 10 }) {
          Text('第一季度运营目标')
            .fontWeight(FontWeight.Bold)

          Text('实现用户量与用户活跃度提升')
            .fontColor(Color.Gray)
            .fontSize(10)
        }
      }

      Row() {
        Column() {
          Text('整体进度')

          Text('更新时间')
            .fontColor(Color.Gray)
            .fontSize(10)

          Text('03/26/2024')
        }
        .alignItems(HorizontalAlign.Start)

        Blank()
        // Progress({ value: 10, type: ProgressType.Ring })
        //   .width(50)
        //   .overlay('10%', { align: Alignment.Center })

        Stack() {
          Progress({ value: 10, type: ProgressType.Ring })
            .width(50)

          Text('10%')
        }
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
}