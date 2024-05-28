
@Preview
@Component
export struct CityWeatherCard {
  temperature: number
  icon: string
  temperatureRange: string

  build() {
    Row() {
      this.WeatherMainInfo()
      this.WeatherSubInfo()
    }
  }

  @Builder WeatherMainInfo() {
    Column() {
      Row() {
        Text(`${this.temperature}°`)
          .fontSize()

        Image(this.icon)
          .alt($r('app.media.icon_weather_default'))
          .size({ width: 30, height: 30 })
      }

      Text(this.temperatureRange)

    }
  }

  @Builder WeatherSubInfo() {
    Column() {

    }
  }
}