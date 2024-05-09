
import common from '@ohos.app.ability.common'
import { TodoItemModel } from '../model/TodoItemModel'
import { TodoViewModel } from '../viewModel/TodoViewModel'
import { TodoItemView } from '../views/TodoItemView'
let viewModel = new TodoViewModel()

@Entry
@Component
struct TodoListPage {
  @State items: TodoItemModel[] = []
  @State newItemTitle: string = ''
  @State headerTitle: string = ''

  aboutToAppear() {
    this.updateHeaderTitle()
    this.items = viewModel.getItems()
  }

  build() {
    List({ space: 10}) {
      ListItemGroup( {header: this.itemHead(this.headerTitle), footer: this.itemFooter(), space: 10}) {
        ForEach(this.items, (item: TodoItemModel, index?: number) => {
          ListItem() {
            TodoItemView({
              title: item.title,
              isCompleted: item.isCompleted,
              deleteButtonDidClicked: () => {
                viewModel.deleteItem(item)
                this.items = viewModel.getItems()
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
      }).width('70%')
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
    viewModel.addNewItem(this.newItemTitle)
    this.items = viewModel.getItems()
    this.newItemTitle = ''
    focusControl.requestFocus("addButton")
  }

  private updateHeaderTitle() {
    let context = getContext(this) as common.UIAbilityContext
    context.resourceManager.getStringValue($r('app.string.todoPage_header_title'), (error, value) => {
      if (value) {
        this.headerTitle = value
      }
    })
  }
}