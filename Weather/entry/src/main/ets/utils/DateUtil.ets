
export class DateUtil {
  static convertToHoursAndMinutes(dateString: string): string {
    let date = new Date(dateString);
    let months = date.getMonth();
    let days = date.getDay();
    let hours = date.getHours();
    let minutes = date.getMinutes();
    let timeString = `${months.toString().padStart(2, '0')}:${days.toString().padStart(2, '0')}\n${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}`;
    return timeString
  }
}