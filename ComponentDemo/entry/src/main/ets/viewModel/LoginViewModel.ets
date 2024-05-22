import router from '@ohos.router';
import { RouterPaths } from '../Constants/Constants';

export class LoginViewModel {
  public isLoginButtonEnabled: boolean = false
  public isLogging: boolean = false
  public accountText: string = ''
  public passwordText: string = ''

  updateAccount(text: string) {
    this.accountText = text
    this.updateLoginButtonStatus()
  }

  updatePassword(text: string) {
    this.passwordText = text
    this.updateLoginButtonStatus()
  }

  login() {
    this.isLogging = true
    setTimeout(() => {
      this.isLogging = false
      router.pushUrl({ url: RouterPaths.mainPage })
    }, 2000)
  }

  private updateLoginButtonStatus() {
    if (this.accountText.length > 0 && this.passwordText.length > 0) {
      this.isLoginButtonEnabled = true
    } else {
      this.isLoginButtonEnabled = false
    }
  }

}