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
  @State expandIndex: number = -1

  customDialogController: CustomDialogController = new CustomDialogController({
    builder: InputValueDialog({title: $r('app.string.main_page_add_target'), onConfirm: (inputText: string) => {
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
        if (this.viewModel.isEditing) {
          Button($r('app.string.common_delete'))
            .fontColor(Color.Red)
            .backgroundColor(Color.Transparent)
            .onClick(() => {
                this.viewModel.deleteSelectedItems()
            })
        } else {
          Button($r('app.string.main_page_add_target'))
            .fontColor($r('app.color.text_button_font_color'))
            .backgroundColor(Color.Transparent)
            .onClick(() => {
              this.customDialogController.open()
            })
        }
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
        ListItemGroup({ space: 5, header: this.SubtargetListSectionHeader($r('app.string.main_page_section_title_subtarget'))}) {
          ForEach(this.subtargetItems, (item: JobTargetModel, index?: number) => {
            ListItem() {
              SubtargetItem({
                target: item,
                index: index,
                expandIndex: this.expandIndex,
                isEditing: this.viewModel.isEditing,
                onCancel: () => {
                 this.expandIndex = -1
                },
                onFinish: () => {
                  this.expandIndex = -1
                  this.viewModel.finishItem(item)
                }
              })
            }
            .onClick(() => {
              console.log('clicked index' + index.toString())
              if (this.expandIndex == index) {
                this.expandIndex = null
                console.log('clicked index with null')
              } else {
                this.expandIndex = index
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

  @Builder private SubtargetListSectionHeader(text: string | Resource) {
    Row() {
      Text(text)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)

      Blank()

      if (this.viewModel.isEditing) {
        Row() {
          Button($r('app.string.common_cancel'))
            .fontColor($r('app.color.text_button_font_color'))
            .backgroundColor(Color.Transparent)
            .onClick(() => {
                this.viewModel.cancelEdit()
            })

          Button($r('app.string.common_select_all'))
            .fontColor($r('app.color.text_button_font_color'))
            .backgroundColor(Color.Transparent)
            .onClick(() => {
                this.viewModel.selectAllItems()
            })
        }
      } else {
        Button($r('app.string.common_edit'))
          .fontColor($r('app.color.text_button_font_color'))
          .backgroundColor(Color.Transparent)
          .onClick(() => {
            this.viewModel.startEdit()
          })
      }
    }
    .width('100%')
    .margin({ top: 10, bottom: 10 })
  }

}