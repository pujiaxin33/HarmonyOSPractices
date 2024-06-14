import http from '@ohos.net.http';

export class ApiClient {

  static startRequest(urlPath: string, method: http.RequestMethod) {
    let httpRequest = http.createHttp();
    let url= 'https://xianmobilelab.gitlab.io/moments-data' + urlPath
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