
export class TodoItemModel {
  title: string
  isCompleted: boolean

  constructor(title: string, isCompleted: boolean) {
    this.title = title
    this.isCompleted = isCompleted
  }
}

export const MockTodoItems: TodoItemModel[] = [
  new TodoItemModel("早起晨练", false),
  new TodoItemModel("准备早餐", false),
  new TodoItemModel("学习ArkTS", false),
  new TodoItemModel("看剧放松", false),
]