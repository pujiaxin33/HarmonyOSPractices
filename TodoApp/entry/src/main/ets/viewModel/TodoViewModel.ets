
import { MockTodoItems, TodoItemModel } from '../model/TodoItemModel';

@Observed
export class TodoViewModel {
  public items: Array<TodoItemModel> = []
  public info: string = ""
  private isItemsLoaded: boolean = false

  loadData() {
    if (this.isItemsLoaded) {
      return
    }
    this.isItemsLoaded = true
    this.items = MockTodoItems
  }

  deleteItem(model: TodoItemModel) {
    this.items = this.items.filter(item => item !== model)
  }

  addNewItem(newItemTitle: string) {
    let item = new TodoItemModel(newItemTitle, false)
    this.items = this.items.concat([item])
  }

}
