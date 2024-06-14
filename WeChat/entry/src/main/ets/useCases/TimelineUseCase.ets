
import { TimelineRepository } from '../repositories/TimelineRepository'
export class TimelineUseCase {
  private repository: TimelineRepository

  constructor() {
    this.repository = new TimelineRepository()
  }

  requestProfile() {
    return this.repository.requestProfile()
  }

  requestMoments() {
    return this.repository.requestMoments()
  }
}