
import { JobTargetModel } from '../models/JobTargetModel'
@Observed
export class MainViewModel {
  public subtargetItems: JobTargetModel[] = []

  loadData() {
    this.subtargetItems = [
      new JobTargetModel('子目标1', '33%', '更新时间：2024/03/03'),
      new JobTargetModel('子目标2', '10%', '更新时间：2024/03/03'),
      new JobTargetModel('子目标3', '10%', '更新时间：2024/03/03'),
      new JobTargetModel('子目标4', '10%', '更新时间：2024/03/03'),
      new JobTargetModel('子目标5', '10%', '更新时间：2024/03/03'),
      new JobTargetModel('子目标6', '10%', '更新时间：2024/03/03'),
      new JobTargetModel('子目标7', '10%', '更新时间：2024/03/03'),
      new JobTargetModel('子目标8', '10%', '更新时间：2024/03/03'),
      new JobTargetModel('子目标9', '10%', '更新时间：2024/03/03'),
      new JobTargetModel('子目标10', '10%', '更新时间：2024/03/03'),
      new JobTargetModel('子目标11', '10%', '更新时间：2024/03/03'),
      new JobTargetModel('子目标12', '10%', '更新时间：2024/03/03'),
      new JobTargetModel('子目标13', '10%', '更新时间：2024/03/03')
    ]
  }
}