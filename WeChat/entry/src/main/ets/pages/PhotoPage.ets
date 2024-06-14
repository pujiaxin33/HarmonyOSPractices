
import router from '@ohos.router'
import { LoadingImage } from '../views/LoadingImage'
@Entry
@Component
struct PhotoPage {
  @State url: string = ""

  aboutToAppear() {
     this.url =  router.getParams()["url"]
  }

  build() {
    Column() {

      Column() {
        LoadingImage({url: this.url})
          .width('100%')
          .height(400)
      }
      .width('100%')
      .height('90%')
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)

      Row() {
        Button("Back")
          .onClick( () => {
            router.back()
          })
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
  }
}