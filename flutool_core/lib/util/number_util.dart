/// 数字工具类
class NumberUtil {
  /// Check [obj] is a number(int, double) or not.
  /// 校验入参[obj]是否为数字(int, double).
  static bool isNum(obj) {
    return obj is int || obj is double;
  }

  /// Check [number] is between [start]~[end].
  /// 校验数字[number] 是否在[start]~[end]范围内.
  static bool isBetween(number, start, end) {
    /*
    前置校验, 校验是否不为null
     */
    if (number == null) throw ArgumentError.notNull("number");
    if (start == null) throw ArgumentError.notNull("start");
    if (end == null) throw ArgumentError.notNull("end");

    /*
    前置校验, 校验传入的是否均为数字.
     */
    if (!isNum(number))
      throw ArgumentError.value(number, "number", "$number is not a number");
    if (!isNum(start))
      throw ArgumentError.value(start, "start", "$start is not a number");
    if (!isNum(end))
      throw ArgumentError.value(end, "end", "$end is not a number");

    /*
    比较start和end, 得出最大最小值
     */
    var min, max;
    if (start < end) {
      min = start;
      max = end;
    } else if (start > end) {
      min = end;
      max = start;
    } else {
      // 若start==end, 直接判断传入数字是否等于start
      return number == start;
    }

    return number >= min && number <= max;
  }
}
