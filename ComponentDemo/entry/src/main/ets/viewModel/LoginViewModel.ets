import router from '@ohos.router';
import { RouterPaths } from '../Constants/Constants';

@Observed
export class LoginViewModel {
  public isLoginButtonEnabled: boolean = false
  public isLogging: boolean = false
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
      this.isLogging = true
      setTimeout(() => {
        this.isLogging = false
        router.pushUrl({ url: RouterPaths.mainPage })
      }, 2000)
    } else {
      AlertDialog.show({
        title: $r('app.string.login_page_alert_input_error_title'),
        message: $r('app.string.login_page_alert_input_error_message')
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