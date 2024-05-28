
import { FutureWeatherItemModel } from '../models/FutureWeatherItemModel'
@Preview
@Component
export struct FutureWeatherItemView {
  model: FutureWeatherItemModel

  build() {
    Column({ space: 15 }) {
      Text(this.model.temperature)
        .fontColor(Color.White)

      Image(this.model.icon)
        .alt($r('app.media.icon_weather_default'))
        .size({ width: 25, height: 25 })

      Text(this.model.date)
        .fontColor(Color.Gray)
    }
  }
}