import { JobTargetModel, JobTargetModelArray } from '../models/JobTargetModel'
import { MainViewModel } from '../viewModel/MainViewModel'
import InputValueDialog from '../views/InputValueDialog'
import { JobTargetSectionItem } from '../views/JobTargetItem'
import { SubtargetItem } from '../views/SubtargetItem'

@Entry
@Component
struct MainPage {
  @State subtargetItems: JobTargetModelArray = null
  @State viewModel: MainViewModel = new MainViewModel()
  @State isRefreshing: boolean = false
  @State selectedIndex: number = -1

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
            JobTargetSectionItem({completedPercent: this.viewModel.completedPercent})
          }
        }
        ListItemGroup({ space: 5, header: this.ListSectionHeader($r('app.string.main_page_section_title_subtarget'))}) {
          ForEach(this.subtargetItems, (item: JobTargetModel, index?: number) => {
            ListItem() {
              SubtargetItem({
                target: item,
                index: index,
                selectedIndex: this.selectedIndex,
                onCancel: () => {
                 this.selectedIndex = -1
                },
                onFinish: () => {
                  this.selectedIndex = -1
                  this.viewModel.finishItem(item)
                }
              })
            }
            .onClick(() => {
              console.log('clicked index' + index.toString())
              if (this.selectedIndex == index) {
                this.selectedIndex = null
                console.log('clicked index with null')
              } else {
                this.selectedIndex = index
                console.log('clicked index with index')
              }
            })
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