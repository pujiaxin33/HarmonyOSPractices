import { TimelineMomentModel } from '../models/TimelineMomentModel';
@CustomDialog
export default struct InputCommentDialog {
  public title: string | Resource;
  onConfirm: (string) => void
  private inputText: string;
  private controller?: CustomDialogController;

  build() {
    Column({space: 15}) {
      Text(this.title)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      TextInput({ placeholder: "友善发言，温暖你我TA！" })
        .onChange((value) => {
          this.inputText = value
        })

      Row() {
        Button("Cancel")
          .onClick(() => {
            this.controller.close()
          })

        Button("Confirm")
          .onClick(() => {
            this.onConfirm(this.inputText)
            this.controller.close()
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceAround)
    }
    .backgroundColor(Color.White)
    .borderRadius(10)
    .padding(15)
    .margin(15)
  }
}