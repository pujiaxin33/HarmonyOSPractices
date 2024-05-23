
@Observed
export class JobTargetModel {
  title: string
  progress: string
  updateDate: string

  constructor(title: string, progress: string, updateDate: string) {
    this.title = title
    this.progress = progress
    this.updateDate = updateDate
  }
}
@Observed
export  class JobTargetModelArray extends Array<JobTargetModel> {
}