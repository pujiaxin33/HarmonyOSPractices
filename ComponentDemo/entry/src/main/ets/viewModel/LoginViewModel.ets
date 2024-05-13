import router from '@ohos.router';

@Observed
export class LoginViewModel {
  public isLoginButtonEnabled: boolean = false
  private accountText?: string = null
  private passwordText?: string = null

  updateAccount(text: string) {
    this.accountText = text
    this.updateLoginButtonStatus()
  }

  updatePassword(text: string) {
    this.passwordText = text
    this.updateLoginButtonStatus()
  }

  login() {
    if (this.accountText && this.passwordText) {
      router.pushUrl({ url: 'pages/MainPage' })
    } else {
      AlertDialog.show({
        title: "错误提示",
        message: "请输入用户名和密码"
      })
    }
  }

  private updateLoginButtonStatus() {
    if (this.accountText && this.passwordText) {
      this.isLoginButtonEnabled = true
    } else {
      this.isLoginButtonEnabled = false
    }
  }

}