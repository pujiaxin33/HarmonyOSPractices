import http from '@ohos.net.http';
import { CityWeather } from '../models/CityWeather';
import { FutureWeather } from '../models/FutureWeather';
import { ApiClient } from '../network/ApiClient';

export class MainRepository {
  async requestCityWeather() {
    let urlPath = '/weather?units=metric&lang=zh_cn&appid=7ce48fbdedcc72653e589f93b4da7ee4&q=Chengdu,CN'
    return ApiClient.startRequest(urlPath, http.RequestMethod.GET).then((response) => {
      let model: CityWeather = JSON.parse(response.result.toString())
      return model
    })
  }

  async requestFutureWeather() {
    let urlPath = '/forecast?appid=7ce48fbdedcc72653e589f93b4da7ee4&units=metric&lang=zh_cn&q=Chengdu,CN'
    return ApiClient.startRequest(urlPath, http.RequestMethod.GET).then((response) => {
      let model: FutureWeather = JSON.parse(response.result.toString())
      return model
    })
  }
}