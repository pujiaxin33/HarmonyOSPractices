import http from '@ohos.net.http';

export class ApiClient {

  static async startRequest(urlPath: string, method: http.RequestMethod) {
    let httpRequest = http.createHttp();
    let url= 'https://api.openweathermap.org/data/2.5' + urlPath
    console.log(`url is ${url}`)
    console.log(urlPath)
    let promise = httpRequest.request(
      url,
      {
        method: method,
        connectTimeout: 60000,
        readTimeout: 60000,
        header: {
          'Content-Type': 'application/json'
        }
      })
    return promise
  }
}