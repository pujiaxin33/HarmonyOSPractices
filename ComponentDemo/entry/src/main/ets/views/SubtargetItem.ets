
import { JobTargetModel } from '../models/JobTargetModel'
import { TextButton } from './CommonViews'
@Component
export struct SubtargetItem {
  @ObjectLink target: JobTargetModel
  index: number
  @Prop expandIndex: number
  @Prop isEditing: boolean
  onFinish: () => void
  onCancel: () => void

  build() {
    Column() {
      Row() {
        Text(this.target.title)

        Blank()

        Row() {
          Column() {
            Text(this.target.progress.toString() + '%')
            Text(this.target.updateDate)
              .fontColor(Color.Gray)
          }
          .alignItems(HorizontalAlign.End)

          if (this.isEditing) {
            Checkbox()
              .select(this.target.isSelected)
              .onChange((value) => {
                this.target.isSelected = value
              })
          }
        }
      }
      .width('100%')

      if (this.expandIndex == this.index) {
        this.OperationPanel()
      }
    }
    .backgroundColor(Color.White)
    .padding(15)
    .borderRadius(5)
  }

  @Builder OperationPanel() {
    Row() {
      TextButton('取消', null, (event?: ClickEvent) => {
        this.onCancel()
      })

      TextButton('完成', null, (event?: ClickEvent) => {
        this.onFinish()
      })
    }
    .width('100%')
    .margin({top: 10})
    .justifyContent(FlexAlign.SpaceAround)
  }
}