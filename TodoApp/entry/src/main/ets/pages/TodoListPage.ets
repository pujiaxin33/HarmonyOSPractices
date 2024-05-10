
import common from '@ohos.app.ability.common'
import { Constants } from '../common/Constants'
import { TodoItemModel } from '../model/TodoItemModel'
import { TodoViewModel } from '../viewModel/TodoViewModel'
import { TodoItemView } from '../views/TodoItemView'

@Entry
@Component
struct TodoListPage {
  @State viewModel: TodoViewModel = new TodoViewModel()
  @State newItemTitle: string = ''

  aboutToAppear() {
    this.viewModel.loadData()
  }

  build() {
    List({ space: 10}) {
      ListItemGroup( {header: this.itemHead(Constants.TodoHeaderTitle), footer: this.itemFooter(), space: 10}) {
        ForEach(this.viewModel.items, (item: TodoItemModel, index?: number) => {
          ListItem() {
            TodoItemView({
              title: item.title,
              isCompleted: item.isCompleted,
              deleteButtonDidClicked: () => {
                this.viewModel.deleteItem(item)
              },
              isCompletedChanged: (value) => {
                item.isCompleted = value
              }
            })
          }
        }, (item) => JSON.stringify(item))
      }
    }
    .sticky(StickyStyle.Header)
    .backgroundColor('#4dbab4b2')
    .padding({ left: 15, right: 15})
    .width('100%')
    .height('100%')
  }

  @Builder itemHead(text: string) {
    Row() {
      Text(text)
        .fontSize(35)
        .fontWeight(FontWeight.Bold)
        .margin(15)
    }
  }

  @Builder itemFooter() {
    Row({ space: 5}) {
      TextInput({ text: this.newItemTitle, placeholder: "添加待办事项"})
      .onChange((text: string) => {
        this.newItemTitle = text
      })
        .layoutWeight(1)
        .onSubmit((enterKey: EnterKeyType) => {
          focusControl.requestFocus("addButton")
          if (enterKey == EnterKeyType.Done) {
            this.addNewItem()
          }
        })

      Button("添加", {type: ButtonType.Capsule})
        .key("addButton")
        .onClick(() => {
          this.addNewItem()
        })
    }
    .margin({top: 10})
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
  }

  private addNewItem() {
    if (this.newItemTitle.length == 0) {
      AlertDialog.show({
        title: null,
        message: $r('app.string.todoPage_tips_input_is_empty')
      })
      return
    }
    this.viewModel.addNewItem(this.newItemTitle)
    this.newItemTitle = ''
    focusControl.requestFocus("addButton")
  }

}