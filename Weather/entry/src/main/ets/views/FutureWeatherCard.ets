
import { FutureWeatherItemModel } from '../models/FutureWeatherItemModel'
import { FutureWeatherItemView } from './FutureWeatherItemView'
@Component
export struct FutureWeatherCard {
  items: FutureWeatherItemModel[]

  build() {
    Column({ space: 5 }) {
      Text($r('app.string.3hours_forecast_title'))
      .fontColor(Color.White)

      List( { space: 10 }) {
        ForEach(this.items, (item) => {
          ListItem() {
            FutureWeatherItemView({ model: item })
          }
        }, item => JSON.stringify(item))
      }
      .width('100%')
      .height(130)
      .padding({ top: 10, left: 10, bottom: 10, right: 0 })
      .backgroundColor('#161D27')
      .borderRadius(5)
      .listDirection(Axis.Horizontal)
    }
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .padding(10)
  }
}