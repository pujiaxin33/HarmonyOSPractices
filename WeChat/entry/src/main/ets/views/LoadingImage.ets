
@Component
export struct LoadingImage {
  url: string
  @State isLoading: boolean = true

  build() {
    Stack() {
      if (this.isLoading) {
        LoadingProgress()
      }

      Image(this.url)
        .onComplete(() => {
          this.isLoading = false
        })
        .onError(() => {
          this.isLoading = false
        })
        .onFinish(() => {
          this.isLoading = false
        })
        .backgroundColor(Color.Pink)
    }
  }
}