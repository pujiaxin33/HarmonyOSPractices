
import { MockTodoItems, TodoItemModel } from '../model/TodoItemModel';
export class TodoViewModel {
  private items: Array<TodoItemModel> = []
  private isItemsLoaded: boolean = false

  getItems(): TodoItemModel[] {
    if (!this.isItemsLoaded) {
      this.isItemsLoaded = true
      this.items = MockTodoItems
    }
    return this.items
  }

  deleteItem(model: TodoItemModel) {
    this.items = this.items.filter(item => item !== model)
  }

  addNewItem(newItemTitle: string) {
    let item = new TodoItemModel(newItemTitle, false)
    this.items.push(item)
  }
}
