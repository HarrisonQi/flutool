import 'dart:math';

/// 随机工具类
class RandomUtil {
  /// Generate a random integer in range [start] ~ [end]. Result may include start and end integer.
  /// There is no maximum and minimum order for input parameters.
  /// 生成一个随机数, 范围为 [start] ~ [end] . 结果包含start和end. 入参没有最大最小值顺序.
  static int randomInt(int start, int end) {
    // 前置校验, 若传入null, 直接返回异常
    if (start == null) {
      throw ArgumentError.notNull("start");
    } else if (end == null) {
      throw ArgumentError.notNull("end");
    }

    // 若起始数字等于结尾数字, 直接返回
    if (start == end) {
      return start;
    }

    // 定义最小数字以及末尾数字
    int min, max;
    if (start < end) {
      min = start;
      max = end;
    } else {
      min = end;
      max = start;
    }

    return min + Random().nextInt(max + 1 - min);
  }

  /// Get a random element from [list].
  /// 返回集合 [list] 中的某个随机元素.
  static dynamic randomEle(List list) {
    /*
    前置校验, 校验是否为null或空集合
     */
    if (list == null) {
      throw ArgumentError.notNull("list");
    }
    if (list.isEmpty) {
      throw ArgumentError("list cannot be empty");
    }

    // 若集合只有一个元素, 直接返回该元素
    if(list.length==1){
      return list[0];
    }

    // 根据集合长度范围生成随机下标
    int randomIndex = randomInt(0, list.length - 1);
    return list[randomIndex];
  }
}
