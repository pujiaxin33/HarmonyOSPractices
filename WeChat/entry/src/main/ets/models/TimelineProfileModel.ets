
import { TimelineProfileEntity } from '../repositories/Entities/TimelineProfileEntity'

@Observed
export class TimelineProfileModel {
  profileImage: string
  avatar: string
  nick: string
  username: string

  constructor(entity: TimelineProfileEntity) {
    this.profileImage = entity.profileImage
    this.avatar = entity.avatar
    this.nick = entity.nick
    this.username = entity.username
  }
}