import 'package:flutool_core/util/str_util.dart';


extension StringExtension on String {
  /// 字符串是否为空
  bool get isBlank => StrUtil.isBlank(this);

  /// 字符串是否为整型
  bool get isInt => StrUtil.isInt(this);
}
