

export class DateTools {
  static formatDate(date: Date): string {
    const year = date.getFullYear();
    const month = (date.getMonth() + 1).toString().padStart(2, '0'); // 月份是从0开始的，所以需要+1
    const day = date.getDate().toString().padStart(2, '0');
    return `${year}/${month}/${day}`;
  }
}