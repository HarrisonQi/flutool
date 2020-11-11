import 'package:flutool_core/flutool_core.dart';

/// Example of flutool-core
void main() {
  // Check a set of string contains empty string.
  // 判断一组字符串是否包含空字符串
  List<String> stringList = ["1", "2", ""];
  bool hasEmpty = StrUtil.hasEmpty(stringList);
  print('hasEmpty:$hasEmpty');
}
