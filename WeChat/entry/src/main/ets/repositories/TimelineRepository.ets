import http from '@ohos.net.http';
import { ApiClient } from '../common/network/ApiClient';
import { MockApiClient } from '../common/network/MockApiClient';
import { TimelineMomentEntity } from './Entities/TimelineMomentEntity';
import { TimelineProfileEntity } from './Entities/TimelineProfileEntity';

export class TimelineRepository {
  requestProfile() {
    let urlPath = '/user.json'
    // 模拟器实在跑步起来，就mock数据了
    return MockApiClient.startRequest(urlPath, http.RequestMethod.GET).then((response) => {
      let model: TimelineProfileEntity = JSON.parse(response.result.toString())
      return model
    })
  }

  requestMoments() {
    let urlPath = '/tweets.json'
    // 模拟器实在跑步起来，就mock数据了
    return MockApiClient.startRequest(urlPath, http.RequestMethod.GET).then((response) => {
      let models: Array<TimelineMomentEntity> = JSON.parse(response.result.toString())
      return models.filter(item => {
        return (item.content && item.content.length > 0 && item.sender && item.sender.avatar && item.sender.avatar.length > 0)
      })
    })
  }
}