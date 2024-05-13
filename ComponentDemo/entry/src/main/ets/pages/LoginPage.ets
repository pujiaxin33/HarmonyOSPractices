
import { LoginViewModel } from '../viewModel/LoginViewModel'
@Entry
@Component
struct Index {
  @State viewModel: LoginViewModel = new LoginViewModel()
  @State private accountText: string = ''
  @State private passwordText: string = ''

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
      TextInput({text: this.accountText, placeholder: $r('app.string.login_page_placeholder_account')})
        .type(InputType.Normal)
        .onChange((value) => {
          this.viewModel.updateAccount(value)
        })

      TextInput({text: this.passwordText, placeholder: $r('app.string.login_page_placeholder_password')})
        .type(InputType.Password)
        .onChange((value) => {
          this.viewModel.updatePassword(value)
        })
    }
    .margin({ top: 30, left: 15, right: 15})
  }

  @Builder VerifyCodeAndForgotPasswordButtons() {
    Row() {
      Button($r('app.string.login_page_button_login_with_verify_code'))
        .fontColor($r('app.color.text_button_font_color'))
        .backgroundColor(Color.Transparent)

      Blank()
      Button($r('app.string.login_page_button_forgot_password'))
        .fontColor($r('app.color.text_button_font_color'))
        .backgroundColor(Color.Transparent)
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
          this.viewModel.login()
        })

      Button($r('app.string.login_page_button_register'))
        .fontColor($r('app.color.text_button_font_color'))
        .backgroundColor(Color.Transparent)
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
        Button('微信')
          .fontSize(15)
          .type(ButtonType.Circle)
          .padding(0)

        Button('QQ')
          .fontSize(15)
          .type(ButtonType.Circle)
          .padding(0)

        Button('微博')
          .fontSize(15)
          .type(ButtonType.Circle)
          .padding(0)
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .margin({ left: 15, right: 15, bottom: 15})
  }
}