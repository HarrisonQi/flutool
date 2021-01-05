/// Date and time util
/// 日期时间工具类
class DateTimeUtil {
  /// Get the begin of a day
  /// 获取某日期的起始时间
  static DateTime beginOfDay(DateTime dateTime) =>
      DateTime(dateTime.year, dateTime.month, dateTime.day);

  /// Get the end of a day
  /// 获取某日期的结束时间
  static DateTime endOfDay(DateTime dateTime) => DateTime(
      dateTime.year, dateTime.month, dateTime.day, 23, 59, 59, 999, 999);

  /// Get the same time yesterday
  /// 获取昨天的同一时间
  static DateTime yesterday(DateTime dateTime) =>
      dateTime.add(Duration(days: -1));

  /// Get the same time tomorrow
  /// 获取明天的同一时间
  static DateTime tomorrow(DateTime dateTime) =>
      dateTime.add(Duration(days: 1));

  /// Get the same `date of week` and time of previous week (For example, today is Wednesday, you can get last Wednesday through this function)
  /// 获取上周的同一天的同一时间 (比如今天是周三, 可通过此函数获取上周三)
  static DateTime lastWeek(DateTime dateTime) =>
      dateTime.add(Duration(days: -7));
}
