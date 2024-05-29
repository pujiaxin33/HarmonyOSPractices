import { MainViewModel } from '../viewModels/MainViewModel'
import { CityWeatherCard } from '../views/CityWeatherCard'
import { FutureWeatherCard } from '../views/FutureWeatherCard'
@Entry
@Component
struct Index {
  @State viewModel: MainViewModel = new MainViewModel()

  aboutToAppear() {
    this.viewModel.loadData()
  }

  build() {
    Column() {
      if (this.viewModel.isLoading) {
        this.LoadingComponent()
      }

      if (this.viewModel.cityWeatherCardModel) {
        CityWeatherCard({ model: this.viewModel.cityWeatherCardModel })
      }
      
      if (this.viewModel.futureWeatherItems) {
        FutureWeatherCard({ items: this.viewModel.futureWeatherItems })
      }

      Button('Refresh')
        .margin(15)
        .onClick(event => {
          this.viewModel.loadData()
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#3F4853')
  }

  @Builder LoadingComponent() {
    Row() {
      Column() {
        LoadingProgress()
          .width(100)
          .height(100)
        Text('Loading...')
          .fontColor(Color.White)
      }
    }
    .width('100%')
    .height('100%')
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }

}