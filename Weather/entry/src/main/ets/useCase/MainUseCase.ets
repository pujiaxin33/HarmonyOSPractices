
import { MainRepository } from '../repository/MainRepository'
export class MainUseCase {
  private repository: MainRepository

  constructor() {
    this.repository = new MainRepository()
  }

  async requestCityWeather() {
      return this.repository.requestCityWeather()
  }

  async requestFutureWeather() {
    return this.repository.requestFutureWeather()
  }
}