
import { TimelineViewModel } from '../viewModels/TimelineViewModel'
import { TimelineHeader } from '../views/TimelineHeader'
import common from '@ohos.app.ability.common';
import { TimelineMomentCard } from '../views/TimelineMomentCard';

@Entry
@Component
export  struct TimelinePage {
  @State viewModel: TimelineViewModel = new TimelineViewModel()

  aboutToAppear() {
    this.viewModel.loadData()
  }

  build() {
    Refresh({refreshing: this.viewModel.isHeaderRefreshing }) {
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
                TimelineMomentCard({model: item, photoCallback: (url) => {
                  this.viewModel.pushToPhotoPage(url)
                }})
              }
            })
          }
        }
        if (this.viewModel.isFooterLoading) {
          ListItem() {
            Column() {
              LoadingProgress()
                .width(50)
                .height(50)
            }
            .width('100%')
            .alignItems(HorizontalAlign.Center)
          }
        }
      }
      .width('100%')
      .height('100%')
      .onReachEnd(() => {
        this.viewModel.loadMore()
      })
    }
    .backgroundColor(Color.White)
    .width('100%')
    .height('100%')
    .onRefreshing(() => {
      this.viewModel.refreshData()
    })
  }
}