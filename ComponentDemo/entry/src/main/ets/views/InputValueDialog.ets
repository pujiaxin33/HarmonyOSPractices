
import { TextButton } from './CommonViews'

@CustomDialog
export default struct InputValueDialog {
  public title: string | Resource;
  onConfirm: (string) => void
  private inputText: string;
  private controller?: CustomDialogController;

  build() {
    Column({space: 15}) {
      Text(this.title)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      TextInput({ placeholder: $r('app.string.main_page_input_target_name_placeholder') })
      .onChange((value) => {
        this.inputText = value
      })

      Row() {
        TextButton($r('app.string.common_cancel'), null, (event?: ClickEvent) => {
            this.controller.close()
        })

        TextButton($r('app.string.common_confirm'), null, (event?: ClickEvent) => {
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