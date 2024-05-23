
import { DateTools } from '../common/Tools/DateTools'
import { JobTargetModel, JobTargetModelArray } from '../models/JobTargetModel'

export class MainViewModel {
  public subtargetItems: JobTargetModelArray = new JobTargetModelArray()

  loadData(): JobTargetModelArray {
    this.subtargetItems.splice(0, this.subtargetItems.length)
    this.subtargetItems.push(
      new JobTargetModel('子目标1', '33%', '更新时间：2024/03/03'),
      new JobTargetModel('子目标2', '10%', '更新时间：2024/03/03'),
      new JobTargetModel('子目标3', '10%', '更新时间：2024/03/03'),
    )
    return this.subtargetItems
  }

  refreshData() {
    this.loadData()
  }

  addNewTarget(text: string) {
    let newModel = new JobTargetModel(text, '0%', '更新时间：' + DateTools.formatDate(new Date()))
    this.subtargetItems.push(newModel)
    console.log('new text' + text)
  }
}