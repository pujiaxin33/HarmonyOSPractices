
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