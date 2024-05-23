import { JobTargetModel, JobTargetModelArray } from '../models/JobTargetModel'
import { MainViewModel } from '../viewModel/MainViewModel'
import InputValueDialog from '../views/InputValueDialog'
import { JobTargetItem } from '../views/JobTargetItem'
import { SubtargetItem } from '../views/SubtargetItem'

@Entry
@Component
struct MainPage {
  @State subtargetItems: JobTargetModelArray = null
  @State viewModel: MainViewModel = new MainViewModel()
  @State isRefreshing: boolean = false
  customDialogController: CustomDialogController = new CustomDialogController({
    builder: InputValueDialog({title: "添加子目标", onConfirm: (inputText: string) => {
      this.viewModel.addNewTarget(inputText)
    }}),
    alignment: DialogAlignment.Center,
    customStyle: true
  });

  aboutToAppear() {
    this.subtargetItems = this.viewModel.loadData()
  }

  build() {
    Column() {
      this.ListView()

      Column() {
        Button('添加子目标')
          .onClick(() => {
            this.customDialogController.open()
          })
      }
      .height('8%')
      .padding({ top: 10, bottom: 10 })
    }
  }
  @Builder private ListView() {
    Refresh({ refreshing: $$this.isRefreshing}) {
      List() {
        ListItemGroup({ header: this.ListSectionHeader($r('app.string.main_page_section_title_target'))}) {
          ListItem() {
            JobTargetItem()
          }
        }
        ListItemGroup({ space: 5, header: this.ListSectionHeader($r('app.string.main_page_section_title_subtarget'))}) {
          ForEach(this.subtargetItems, (item: JobTargetModel, index?: number) => {
            ListItem() {
              SubtargetItem({title: item.title, progress: item.progress, updateDate: item.updateDate })
            }
          }, item => JSON.stringify(item))
        }
      }
      .height('92%')
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

  @Builder private ListSectionHeader(text: string | Resource) {
    Text(text)
      .fontSize(30)
      .fontWeight(FontWeight.Bold)
      .margin({ top: 10, bottom: 10 })
  }

}