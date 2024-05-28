
import { CityWeatherCardModel } from '../models/CityWeatherCardModel'
@Preview
@Component
export struct CityWeatherCard {
  model: CityWeatherCardModel

  build() {
    Stack() {
      Image($r('app.media.weather_header_background'))
      .objectFit(ImageFit.Cover)

      Row() {
        this.WeatherMainInfo()

        Blank()

        this.WeatherSubInfo()
      }
      .width('100%')
      .height('100%')
      .padding({left: 15, right: 15, top: 20})
      .alignItems(VerticalAlign.Top)
    }
    .width('100%')
    .height(200)

  }

  @Builder WeatherMainInfo() {
    Column() {
      Row() {
        Text(this.model.temperature)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)

        Image(this.model.icon)
          .alt($r('app.media.icon_weather_default'))
          .size({ width: 30, height: 30 })
      }

      Text(this.model.temperatureRange)
        .fontColor(Color.Gray)
    }
    .alignItems(HorizontalAlign.Start)
  }

  @Builder WeatherSubInfo() {
    Column() {
      Text(this.model.weatherShortDesc)
        .fontColor(Color.Gray)

      Text(this.model.feelLikeTemperature)
        .fontColor(Color.Gray)
    }
    .alignItems(HorizontalAlign.Center)
  }
}