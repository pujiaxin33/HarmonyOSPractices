
import { CityWeatherCardModel } from '../models/CityWeatherCardModel'
import { FutureWeatherItemModel } from '../models/FutureWeatherItemModel'
import { TemperatureUtil } from '../utils/TemperatureUtil'
export class MainViewModel {
  cityWeatherCardModel: CityWeatherCardModel
  futureWeatherItems: FutureWeatherItemModel[]

  loadData() {
    this.requestCityWeather()
    this.requestFutureWeather()
  }

  private requestCityWeather() {
    this.cityWeatherCardModel = new CityWeatherCardModel(
      TemperatureUtil.convertToTemperatureString(26),
      "https://openweathermap.org/img/wn/03d@2x.png",
      "未来24小时：27°/18°",
      "多云", "体感温度：26°"
    )

  }

  private requestFutureWeather() {
    let items: FutureWeatherItemModel[] = []
    for (let index = 0; index < 15; index++) {
      let model = new FutureWeatherItemModel(TemperatureUtil.convertToTemperatureString(index), "https://openweathermap.org/img/wn/03d@2x.png", "17:00")
      items.push(model)
    }
    this.futureWeatherItems = items
  }
}