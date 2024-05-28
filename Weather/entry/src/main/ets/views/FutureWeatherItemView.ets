
@Preview
@Component
export struct FutureWeatherItemView {
  temperature: number = 25
  icon: string = "https://openweathermap.org/img/wn/03d@2x.png"
  date: string = "17:00"

  build() {
    Column({ space: 15 }) {
      Text(`${this.temperature}°`)
        .fontColor(Color.White)

      Image(this.icon)
        .alt($r('app.media.icon_weather_default'))
        .size({ width: 25, height: 25 })

      Text(this.date)
        .fontColor(Color.Gray)
    }
    .backgroundColor(Color.Black)
  }
}