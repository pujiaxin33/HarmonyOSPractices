
import hilog from '@ohos.hilog'
import { DateTools } from '../common/Tools/DateTools'
import { JobTargetModel, JobTargetModelArray } from '../models/JobTargetModel'

export class MainViewModel {
  public subtargetItems: JobTargetModelArray = new JobTargetModelArray()
  public completedPercent: number = 0

  loadData(): JobTargetModelArray {
    this.subtargetItems.splice(0, this.subtargetItems.length)
    this.subtargetItems.push(
      new JobTargetModel('子目标1', 33, '更新时间：2024/03/03'),
      new JobTargetModel('子目标2', 10, '更新时间：2024/03/03'),
      new JobTargetModel('子目标3', 10, '更新时间：2024/03/03'),
    )
    return this.subtargetItems
  }

  refreshData() {
    this.loadData()
  }

  addNewTarget(text: string) {
    let newModel = new JobTargetModel(text, 0, '更新时间：' + DateTools.formatDate(new Date()))
    this.subtargetItems.push(newModel)
    console.log('new text' + text)
  }

  finishItem(item: JobTargetModel) {
    item.progress = 100
    this.updateCompletedTargetCount()
    console.log('finishItem' + item.toString())
  }

  private updateCompletedTargetCount() {
    let completedTargetsCount = this.subtargetItems.filter(item => item.isCompleted).length
    this.completedPercent = Math.floor(100*completedTargetsCount/this.subtargetItems.length)
    hilog.info(0x0000, 'testTag', '%{public}s', `completed percent:${this.completedPercent}`);
  }
}