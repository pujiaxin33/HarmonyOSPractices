
import { TextButton } from './CommonViews'

@CustomDialog
export default struct InputValueDialog {
  public title: string;
  onConfirm: (string) => void
  private inputText: string;
  private controller?: CustomDialogController;

  build() {
    Column({space: 15}) {
      Text(this.title)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      TextInput({ placeholder: '请输入子目标名称' })
      .onChange((value) => {
        this.inputText = value
      })

      Row() {
        TextButton('取消', null, (event?: ClickEvent) => {
            this.controller.close()
        })

        TextButton('确认', null, (event?: ClickEvent) => {
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