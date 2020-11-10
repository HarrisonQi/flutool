import 'package:flutool_core/util/number_util.dart';
import 'package:flutool_core/util/random_util.dart';
import 'package:flutool_core/util/str_util.dart';

extension StringExtension on String {
  /// 字符串是否为空
  bool get isBlank => StrUtil.isBlank(this);

  /// 字符串是否为整型
  bool get isInt => StrUtil.isInt(this);

  /// 移除字符串的指定前缀 [prefix]
  String removePrefix(String prefix) => StrUtil.removePrefix(this, prefix);

  /// 移除字符串的指定后缀 [suffix]
  String removeSuffix(String suffix) => StrUtil.removeSuffix(this, suffix);

  /// 字符串转为DateTime
  DateTime get toDateTime => StrUtil.toDateTime(this);
}

extension IntegerExtension on int {

  /// 判断数字是否在[start]~[end]范围内
  bool isBetween(start, end) => NumberUtil.isBetween(this, start, end);
}

extension DoubleExtension on double {
  /// 判断数字是否在[start]~[end]范围内
  bool isBetween(start, end) => NumberUtil.isBetween(this, start, end);
}

extension ListExtension on List{
  /// 获取集合中随机一个元素
  dynamic get randomEle => RandomUtil.randomEle(this);
}