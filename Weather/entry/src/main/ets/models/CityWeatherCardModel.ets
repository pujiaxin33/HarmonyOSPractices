
export class CityWeatherCardModel {
  temperature: string
  icon: string
  temperatureRange: string
  weatherShortDesc: string
  feelLikeTemperature: string

  constructor(temperature: string,
              icon: string,
              temperatureRange: string,
              weatherShortDesc: string,
              feelLikeTemperature: string) {
    this.temperature = temperature
    this.icon = icon
    this.temperatureRange = temperatureRange
    this.weatherShortDesc = weatherShortDesc
    this.feelLikeTemperature = feelLikeTemperature
  }
}