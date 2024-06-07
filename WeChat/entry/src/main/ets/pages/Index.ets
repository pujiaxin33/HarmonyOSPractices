import { TimelinePage } from './TimelinePage'
@Entry
@Component
struct Index {
  @State currentIndex: number = 0
  @State fontColor: string = '#182431'
  @State selectedFontColor: string = '#007DFF'

  build() {
    Tabs() {
      TabContent() {
        Column() {
          Text("微信")
            .width('100%')
            .height('100%')
            .textAlign(TextAlign.Center)
        }
        .backgroundColor(Color.White)
        .width('100%')
        .height('100%')
      }.tabBar(this.TabBarItem(0, "微信", $r('app.media.tabbar_wechat')))

      TabContent() {
        Column() {
          Text("通讯录")
            .width('100%')
            .height('100%')
            .textAlign(TextAlign.Center)
        }
        .backgroundColor(Color.White)
        .width('100%')
        .height('100%')
      }.tabBar(this.TabBarItem(1, "通讯录", $r('app.media.tabbar_contact')))

      TabContent() {
        TimelinePage()
      }.tabBar(this.TabBarItem(2, "朋友圈", $r('app.media.tabbar_timeline')))

      TabContent() {
        Column() {
          Text("我")
            .width('100%')
            .height('100%')
            .textAlign(TextAlign.Center)
        }
        .backgroundColor(Color.White)
        .width('100%')
        .height('100%')
      }.tabBar(this.TabBarItem(3, "我", $r('app.media.tabbar_mine')))
    }
    .barHeight(65)
    .backgroundColor(Color.Gray)
    .barPosition(BarPosition.End)
    .onChange(index => {
      this.currentIndex = index
    })

  }

  @Builder
  private TabBarItem(index: number, title: string, icon: Resource) {
    Column() {
      Image(icon)
        .size({width: 30, height: 30})
        .fillColor(this.currentIndex == index ? this.selectedFontColor : this.fontColor)

      Text(title)
        .fontColor(this.currentIndex == index ? this.selectedFontColor : this.fontColor)
    }
  }
}