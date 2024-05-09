@Preview
@Component
export struct TodoItemView {
  title: string = "早睡早起"
  deleteButtonDidClicked: () => void
  isCompletedChanged: (boolean) => void
  @State isCompleted: boolean = false

  build() {
    Row() {
      Row({space: 15}) {
        Checkbox()
          .select(this.isCompleted)
          .enabled(false)

        Text(this.title)
          .fontColor( this.isCompleted ? Color.Gray : Color.Black)
          .decoration({ type: this.isCompleted ? TextDecorationType.LineThrough : TextDecorationType.None })
          .fontSize(20)
      }

      Button('删除', {type: ButtonType.Normal, stateEffect: true})
        .backgroundColor(Color.Transparent)
        .fontColor(Color.Red)
        .onClick(() => {
          this.deleteButtonDidClicked()
        })
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
    .width('100%')
    .backgroundColor(Color.White)
    .borderRadius(10)
    .padding(15)
    .onClick(() => {
      this.isCompleted = !this.isCompleted
      this.isCompletedChanged(this.isCompleted)
    })
  }
}