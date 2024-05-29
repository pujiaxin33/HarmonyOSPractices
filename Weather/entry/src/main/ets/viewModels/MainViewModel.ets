
import { CityWeather } from '../models/CityWeather'
import { CityWeatherCardModel } from '../models/CityWeatherCardModel'
import { FutureWeather } from '../models/FutureWeather'
import { FutureWeatherItemModel } from '../models/FutureWeatherItemModel'
import { MainUseCase } from '../useCase/MainUseCase'
import { DateUtil } from '../utils/DateUtil'
import { IconUtil } from '../utils/IconUtil'
import { TemperatureUtil } from '../utils/TemperatureUtil'
import prompt from '@ohos.prompt';

export class MainViewModel {
  cityWeatherCardModel: CityWeatherCardModel
  futureWeatherItems: FutureWeatherItemModel[]
  isLoading: boolean = false
  private useCase: MainUseCase = new MainUseCase()
  private isCityWeatherLoaded: boolean = false
  private isFutureWeatherLoaded: boolean = false

  loadData() {
    this.isLoading = true
    this.requestCityWeather()
    this.requestFutureWeather()
  }

  private requestCityWeather() {
    // For local debug
    /*
    this.cityWeatherCardModel = new CityWeatherCardModel(
      TemperatureUtil.convertToTemperatureString(26),
      "https://openweathermap.org/img/wn/03d@2x.png",
      "未来24小时：27°/18°",
      "多云", "体感温度：26°"
    )
    this.isLoading = false
    */

    this.useCase.requestCityWeather().then((model) => {
      this.isCityWeatherLoaded = true
      this.hideLoadingIfNeeded()
      console.log(JSON.stringify(model))
      this.cityWeatherCardModel = this.convertToCityWeatherCardModel(model)
    }).catch((error) => {
      this.isCityWeatherLoaded = true
      this.hideLoadingIfNeeded()
      this.showErrorToast(JSON.stringify(error))
      console.log(error)
    })
  }

  private requestFutureWeather() {
    // For local debug
    /*
    let items: FutureWeatherItemModel[] = []
    for (let index = 0; index < 15; index++) {
      let model = new FutureWeatherItemModel(TemperatureUtil.convertToTemperatureString(index), "https://openweathermap.org/img/wn/03d@2x.png", "17:00")
      items.push(model)
    }
    this.futureWeatherItems = items
    this.isLoading = false
    */

    this.useCase.requestFutureWeather().then((model) => {
      this.futureWeatherItems = this.convertToFutureWeatherItemModels(model)
      this.isFutureWeatherLoaded = true
      this.hideLoadingIfNeeded()
    }).catch( error => {
      this.isFutureWeatherLoaded = true
      this.hideLoadingIfNeeded()
      this.showErrorToast(JSON.stringify(error))
      console.log(error)
    })
  }

  private convertToCityWeatherCardModel(cityWeather: CityWeather) {
    return new CityWeatherCardModel(
      TemperatureUtil.convertToTemperatureString(cityWeather.main.temp),
      IconUtil.convertToIconUrl(cityWeather.weather[0].id),
      `未来24小时：${TemperatureUtil.convertToTemperatureString(cityWeather.main.temp_max)}/${TemperatureUtil.convertToTemperatureString(cityWeather.main.temp_min)}`,
      cityWeather.weather[0].description,
      `体感温度：${TemperatureUtil.convertToTemperatureString(cityWeather.main.feels_like)}`
    )
  }

  private convertToFutureWeatherItemModels(weather: FutureWeather) {
    let items: FutureWeatherItemModel[] = []
    for (let index = 0; index < weather.list.length; index++) {
      let data = weather.list[index]
      let model = new FutureWeatherItemModel(
        TemperatureUtil.convertToTemperatureString(data.main.temp),
        IconUtil.convertToIconUrl(data.weather[0].id),
        DateUtil.convertToHoursAndMinutes(data.dt_txt)
      )
      items.push(model)
    }
    return items
  }

  private hideLoadingIfNeeded() {
    if (this.isCityWeatherLoaded && this.isFutureWeatherLoaded) {
      this.isLoading = false
    }
  }

  private showErrorToast(error: string) {
    prompt.showToast({
      message: error
    })
  }
}