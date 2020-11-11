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

  /// Generate random integers of [count] (base on [randomInt]).
  /// 生成一组数量为[count]的随机数(基于[randomInt]). 可指定 [allowDuplicate] 值是否允许出现重复数字, 默认允许.
  static List<int> randomIntList(int start, int end, int count,
      {bool allowDuplicate = true}) {
    if (count < 0) {
      throw ArgumentError.value(count, "count");
    }

    if (count == 0) {
      return [];
    }

    List<int> resList = [];
    if (allowDuplicate) {
      // 允许重复
      for (int i = 0; i < count; i++) {
        resList.add(randomInt(start, end));
      }
    } else {
      // 不允许重复

      // 校验count是否小于区间
      if ((start - end).abs() < count) {
        throw ArgumentError(
            "count cannot bigger than ${(start - end).abs()} when allowDuplicate==false");
      }

      // 利用Set不可重复特性
      Set<int> resSet = Set();
      do {
        resSet.add(randomInt(start, end));
      } while (resSet.length != count);

      resList = resSet.toList();
    }
    return resList;
  }

  /// Get a random element from [list].
  /// 返回集合 [list] 中的某个随机元素.
  static dynamic randomEle(List list) {
    /*
    前置校验, 校验是否为null或空集合
     */
    if (list == null) throw ArgumentError.notNull("list");

    if (list.isEmpty) throw ArgumentError("list cannot be empty");

    // 若集合只有一个元素, 直接返回该元素
    if (list.length == 1) return list[0];

    // 根据集合长度范围生成随机下标
    int randomIndex = randomInt(0, list.length - 1);
    return list[randomIndex];
  }

  /// Get [count] of elements from [list].
  /// 返回集合 [list] 中的 [count] 个随机元素.
  static List randomEleList(List list, int count) {
    // 校验list是否为null
    if (list == null) throw ArgumentError.notNull("list");

    // 校验count是否为null
    if (count == null) throw ArgumentError.notNull("count");

    // 校验list是否为空
    if (list.isEmpty) throw ArgumentError("list cannot be empty");

    // 校验list长度是否小于count
    if (list.length < count)
      throw ArgumentError("length of list cannot smaller than count");

    // 如果传入数量和集合长度一致, 直接返回集合
    if (list.length == count) return list;

    // 如果传入数量为0, 直接返回空集
    if (count == 0) {
      return [];
    }

    // 创建结果集合
    List resList = [];

    /*
    利用Set不可重复特性, 循环添加随机下标直至随机下标数等于目标数量
     */
    Set<int> randomIndex = Set();

    do {
      randomIndex.add(randomInt(0, list.length - 1));
    } while (randomIndex.length != count);

    // 遍历随机下标, 进行添加
    for (int index in randomIndex) {
      resList.add(list[index]);
    }

    return resList;
  }
}
