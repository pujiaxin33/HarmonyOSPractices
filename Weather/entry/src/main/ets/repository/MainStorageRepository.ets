
import { WeatherLocalStorage } from '../dao/WeatherLocalStorage'
import { CityWeather } from '../models/CityWeather'
import { FutureWeather } from '../models/FutureWeather'
export class MainStorageRepository {
  private localStorage = new WeatherLocalStorage()

  saveCityWeather(data: CityWeather) {
    this.localStorage.saveCityWeather(data)
  }

  async getCityWeather() {
    return this.localStorage.getCityWeather()
  }

  saveFutureWeather(data: FutureWeather) {
    this.localStorage.saveFutureWeather(data)
  }

  async getFutureWeather() {
    return this.localStorage.getFutureWeather()
  }

}