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
      CityWeatherCard({ model: this.viewModel.cityWeatherCardModel })

      FutureWeatherCard({ items: this.viewModel.futureWeatherItems })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#3F4853')
  }


}