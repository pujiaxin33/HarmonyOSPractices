
@Component
export struct SubtargetItem {
  title: string
  progress: string
  updateDate: string

  build() {
    Row() {
      Text(this.title)

      Blank()

      Column() {
        Text(this.progress)
        Text(this.updateDate)
          .fontColor(Color.Gray)
      }
      .alignItems(HorizontalAlign.End)
    }
    .width('100%')
    .backgroundColor(Color.White)
    .padding(15)
    .borderRadius(5)
  }
}