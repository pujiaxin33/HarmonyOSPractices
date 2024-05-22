import { JobTargetModel } from '../models/JobTargetModel'
import { MainViewModel } from '../viewModel/MainViewModel'
import { JobTargetItem } from '../views/JobTargetItem'
import { SubtargetItem } from '../views/SubtargetItem'

@Entry
@Component
struct MainPage {
  @State viewModel: MainViewModel = new MainViewModel()
  @State isRefreshing: boolean = false

  aboutToAppear() {
    this.viewModel.loadData()
  }

  build() {
    Refresh({ refreshing: $$this.isRefreshing}) {
      List() {
        ListItemGroup({ header: this.SectionHeader($r('app.string.main_page_section_title_target'))}) {
          ListItem() {
            JobTargetItem()
          }
        }
        ListItemGroup({ space: 5, header: this.SectionHeader($r('app.string.main_page_section_title_subtarget'))}) {
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
    .onRefreshing(() => {
        setTimeout( () => {
          this.viewModel.loadData()
          this.isRefreshing = false
        }, 1000)
    })
  }

  @Builder private SectionHeader(text: string | Resource) {
    Text(text)
      .fontSize(30)
      .fontWeight(FontWeight.Bold)
      .margin({ top: 10, bottom: 10 })
  }

}