
import hilog from '@ohos.hilog'
import { DateTools } from '../common/Tools/DateTools'
import { JobTargetModel, JobTargetModelArray } from '../models/JobTargetModel'
import prompt from '@ohos.prompt';

export class MainViewModel {
  public subtargetItems: Array<JobTargetModel> = []
  public completedPercent: number = 0
  public isEditing: boolean = false

  loadData() {
    this.subtargetItems = [
      new JobTargetModel('子目标1', 33, '更新时间：2024/03/03'),
      new JobTargetModel('子目标2', 10, '更新时间：2024/03/03'),
      new JobTargetModel('子目标3', 10, '更新时间：2024/03/03')
    ]
  }

  refreshData() {
    this.loadData()
  }

  addNewTarget(text: string) {
    let newModel = new JobTargetModel(text, 0, '更新时间：' + DateTools.formatDate(new Date()))
    this.subtargetItems = this.subtargetItems.concat(newModel)
    this.updateCompletedTargetCount()
    prompt.showToast({ message: '添加成功' })
    console.log('new text' + text)
  }

  finishItem(item: JobTargetModel) {
    item.progress = 100
    this.updateCompletedTargetCount()
    console.log('finishItem' + item.toString())
  }

  startEdit() {
    this.isEditing = true
  }

  cancelEdit() {
    this.subtargetItems.forEach((item) => {
      item.isSelected = false
    })
    this.isEditing = false
  }

  selectAllItems() {
    this.subtargetItems.forEach((item) => {
      item.isSelected = true
    })
  }

  deleteSelectedItems() {
    this.subtargetItems = this.subtargetItems.filter((model) => !model.isSelected)
    if (this.subtargetItems.length == 0) {
      this.isEditing = false
    }
    this.updateCompletedTargetCount()
    prompt.showToast({ message: '删除成功' })
  }

  private updateCompletedTargetCount() {
    if (this.subtargetItems.length == 0) {
      this.completedPercent = 0
      return
    }
    let completedTargetsCount = this.subtargetItems.filter(item => item.isCompleted).length
    this.completedPercent = Math.floor(100*completedTargetsCount/this.subtargetItems.length)
    hilog.info(0x0000, 'testTag', '%{public}s', `completed percent:${this.completedPercent}`);
  }
}