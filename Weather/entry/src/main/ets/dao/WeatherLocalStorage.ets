
import { FutureWeather } from '../models/FutureWeather';
import fs from '@ohos.file.fs';
import common from '@ohos.app.ability.common';
import { CityWeather } from '../models/CityWeather';

export class WeatherLocalStorage {

  saveCityWeather(data: CityWeather) {
    let context = getContext(this) as common.UIAbilityContext;
    let filesDir = context.filesDir;
    let file = fs.openSync(filesDir + '/cityWeather.json', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let jsonString = JSON.stringify(data)
    fs.writeSync(file.fd, jsonString)
    fs.closeSync(file);
  }

  async getCityWeather() {
    return new Promise<CityWeather>((resolve, reject) => {

      let context = getContext(this) as common.UIAbilityContext;
      let filesDir = context.filesDir;
      let jsonString = fs.readTextSync(filesDir + '/cityWeather.json')
      let model: CityWeather = JSON.parse(jsonString)
      resolve(model)
    })
  }

  saveFutureWeather(data: FutureWeather) {
    let context = getContext(this) as common.UIAbilityContext;
    let filesDir = context.filesDir;
    let file = fs.openSync(filesDir + '/futureWeather.json', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let jsonString = JSON.stringify(data)
    fs.writeSync(file.fd, jsonString)
    fs.closeSync(file);
  }

  async getFutureWeather() {
    return new Promise<FutureWeather>((resolve, reject) => {

      let context = getContext(this) as common.UIAbilityContext;
      let filesDir = context.filesDir;
      let jsonString = fs.readTextSync(filesDir + '/futureWeather.json')
      let model: FutureWeather = JSON.parse(jsonString)
      resolve(model)
    })
  }
}

//用preferences的话string的长度过长就会被截断。用rdb关系型数据库的话，数据模型太复杂，模版代码太多不想写，所以就用文件系统管理了。
/*
export class WeatherLocalStorage {
  private context: Context = globalThis.context
  private futureWeatherKey: string = "FutureWeatherKey"

  constructor() {
  }

  saveFutureWeather(data: FutureWeather) {
    this.getPreferences().then(preferences => {
      try {
        let jsonString = JSON.stringify(data)
        preferences.put(this.futureWeatherKey, jsonString, (err) => {
          if (err) {
            console.error(`Failed to put data. Code:${err.code}, message:${err.message}`);
            return;
          }
          console.info('Succeeded in putting data.');
        })
        preferences.flush().then(() => {
          console.info('Succeeded in flush');
        }).catch(error => {
          console.info('Failed in flush');
        })
      } catch (err) {
        console.error(`Failed to put data. Code: ${err.code},message:${err.message}`);
      }
    })
  }

  async getFutureWeather() {
    return new Promise<FutureWeather>((resolve, reject) => {
      this.getPreferences().then(preferences => {
        preferences.get(this.futureWeatherKey, '').then((data: string) => {
          let model: FutureWeather = JSON.parse(data)
          resolve(model)
        }).catch(error => {
          reject(error)
        })
      })
      .catch(error => {
        reject(error)
      })
    })
  }

  private async getPreferences() {
    return new Promise<dataPreferences.Preferences>((resolve, reject) => {
      try {
        dataPreferences.getPreferences(this.context, 'mystore', (err, preferences) => {
          if (err) {
            console.error(`Failed to get preferences. Code:${err.code},message:${err.message}`);
            reject(null)
            return;
          }
          console.info('Succeeded in getting preferences.');
          resolve(preferences)
        })
      } catch (err) {
        console.error(`Failed to get preferences. Code:${err.code},message:${err.message}`);
        reject(null)
      }
    })
  }
}
*/