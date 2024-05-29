import { MainRepository } from '../repository/MainRepository'
import { MainStorageRepository } from '../repository/MainStorageRepository'

export class MainUseCase {
  private repository: MainRepository
  private storageRepository: MainStorageRepository

  constructor() {
    this.repository = new MainRepository()
    this.storageRepository = new MainStorageRepository()
  }

  async getLocalCityWeather() {
    return this.storageRepository.getCityWeather()
  }

  async requestCityWeather() {
    return this.repository.requestCityWeather().then(model => {
      this.storageRepository.saveCityWeather(model)
      return model
    })
  }

  async getLocalFutureWeather() {
    return this.storageRepository.getFutureWeather()
  }

  async requestFutureWeather() {
    return this.repository.requestFutureWeather().then(model => {
      this.storageRepository.saveFutureWeather(model)
      return model
    })
  }
}