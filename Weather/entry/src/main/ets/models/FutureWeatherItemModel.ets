

export class FutureWeatherItemModel {
  temperature: string
  icon: string
  date: string
  uuid: string

  constructor(temperature: string,
              icon: string,
              date: string) {
    this.temperature = temperature
    this.icon = icon
    this.date = date
    this.uuid = this.generateRandomString(16)
  }

  private  generateRandomString(length: number): string {
    let result = '';
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    for (let i = 0; i < length; i++) {
      result += characters.charAt(Math.floor(Math.random() * characters.length));
    }
    return result;
  }
}