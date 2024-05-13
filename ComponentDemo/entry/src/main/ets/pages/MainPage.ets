import { JobTargetModel } from '../models/JobTargetModel'
import { MainViewModel } from '../viewModel/MainViewModel'
import { JobTargetItem } from '../views/JobTargetItem'
import { SubtargetItem } from '../views/SubtargetItem'

@Entry
@Component
struct MainPage {
  @State viewModel: MainViewModel = new MainViewModel()

  aboutToAppear() {
    this.viewModel.loadData()
  }

  build() {
    List() {
      ListItemGroup({ header: this.SectionHeader('工作目标')}) {
        ListItem() {
          JobTargetItem()
        }
      }
      ListItemGroup({ space: 5, header: this.SectionHeader('子目标')}) {
        ForEach(this.viewModel.subtargetItems, (item: JobTargetModel, index?: number) => {
          ListItem() {
            SubtargetItem({title: item.title, progress: item.progress, updateDate: item.updateDate })
          }
        }, item => JSON.stringify(item))
      }
    }
    .height('100%')
    .padding(15)
    .backgroundColor($r('app.color.page_bg_color'))
  }

  @Builder private SectionHeader(text: string) {
    Text(text)
      .fontSize(30)
      .fontWeight(FontWeight.Bold)
      .margin({ top: 10, bottom: 10 })
  }
}