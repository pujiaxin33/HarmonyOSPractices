
import { TimelineViewModel } from '../viewModels/TimelineViewModel'
import { TimelineHeader } from '../views/TimelineHeader'
import common from '@ohos.app.ability.common';
import { TimelineMomentCard } from '../views/TimelineMomentCard';

@Preview
@Component
export  struct TimelinePage {
  @State viewModel: TimelineViewModel = new TimelineViewModel()

  aboutToAppear() {
    this.viewModel.loadData()
  }

  build() {
    List() {
      if (this.viewModel.profile) {
        ListItemGroup() {
          ListItem() {
            TimelineHeader({model: this.viewModel.profile})
          }
        }
      }
      if (this.viewModel.moments.length > 0) {
        ListItemGroup() {
          ForEach(this.viewModel.moments, (item) => {
              ListItem() {
                TimelineMomentCard({model: item})
              }
          })
        }
      }
    }
    .backgroundColor(Color.White)
    .width('100%')
    .height('100%')
  }
}