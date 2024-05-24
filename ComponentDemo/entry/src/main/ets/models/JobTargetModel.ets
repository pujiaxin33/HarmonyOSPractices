
@Observed
export class JobTargetModel {
  title: string
  progress: number
  updateDate: string

  constructor(title: string, progress: number, updateDate: string) {
    this.title = title
    this.progress = progress
    this.updateDate = updateDate
  }

  get isCompleted(): boolean {
    return this.progress >= 100
  }

  toString(): string {
    return `title: ${this.title}, progress: ${this.progress}, updateDate:${this.updateDate}`;
  }
}
@Observed
export class JobTargetModelArray extends Array<JobTargetModel> {
}