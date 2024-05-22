
import inputMethod from '@ohos.inputMethod'
import { LoginViewModel } from '../viewModel/LoginViewModel'
import { ChannelButton, TextButton } from '../views/CommonViews'
@Entry
@Component
struct Index {
  @State viewModel: LoginViewModel = new LoginViewModel()

  build() {
    Column() {
      this.TitleHeader()
      this.InputForm()
      this.VerifyCodeAndForgotPasswordButtons()
      this.LoginAndRegisterButtons()
      Blank()
      this.LoginWithOthersWay()
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.page_bg_color'))
    .enabled(this.viewModel.isLogging ? false : true)
  }

  @Builder TitleHeader() {
    Column({ space: 5 }) {
      Image($r('app.media.icon'))
        .width(75)
        .height(75)

      Text($r('app.string.login_page_title'))
        .fontSize(30)
        .fontWeight(FontWeight.Bold)

      Text($r('app.string.login_page_subtitle'))
        .fontSize(15)
        .fontColor(Color.Gray)
    }
    .margin({ top: 150 })
  }

  @Builder InputForm() {
    Column({ space: 5}) {
      TextInput({text: this.viewModel.accountText, placeholder: $r('app.string.login_page_placeholder_account')})
        .type(InputType.Normal)
        .onChange((value) => {
          this.viewModel.updateAccount(value)
        })

      TextInput({text: this.viewModel.passwordText, placeholder: $r('app.string.login_page_placeholder_password')})
        .type(InputType.Password)
        .onChange((value) => {
          this.viewModel.updatePassword(value)
        })
    }
    .margin({ top: 30, left: 15, right: 15})
  }

  @Builder VerifyCodeAndForgotPasswordButtons() {
    Row() {
      TextButton($r('app.string.login_page_button_login_with_verify_code'))

      Blank()
      TextButton($r('app.string.login_page_button_forgot_password'))
    }
    .margin({ top: 15, left: 15, right: 15 })
    .width('100%')
  }

  @Builder LoginAndRegisterButtons() {
    Column() {
      Button($r('app.string.login_page_button_login'))
        .width('100%')
        .enabled(this.viewModel.isLoginButtonEnabled)
        .onClick(() => {
          inputMethod.getController().stopInputSession()
          this.viewModel.login()
        })

      TextButton($r('app.string.login_page_button_register'))

      if (this.viewModel.isLogging) {
        LoadingProgress()
          .color($r('app.color.app_tint_color'))
          .width(50)
          .height(50)
      }
    }
    .margin({ top: 50 })
    .padding({ left: 15, right: 15})
    .width('100%')
  }

  @Builder LoginWithOthersWay() {
    Column({space: 5}) {
      Text($r('app.string.login_page_tips_login_with_others_way'))
        .fontColor(Color.Gray)

      Row() {
        ChannelButton($r('app.string.login_page_channel_wechat'))

        ChannelButton($r('app.string.login_page_channel_qq'))

        ChannelButton($r('app.string.login_page_channel_weibo'))
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .margin({ left: 15, right: 15, bottom: 15})
  }
}