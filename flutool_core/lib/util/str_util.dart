class StrUtil {
  /// Check [textList] contains empty string or not. (just like several times of [String.isEmpty])
  /// 判断 [textList] 中, 是否包含空字符([String.isEmpty]的批量处理版)
  static bool hasEmpty(List<String> textList) {
    // 通过遍历dart自带的[String.isEmpty]进行处理
    for (String text in textList) {
      if (text.isEmpty) {
        return true;
      }
    }
    return false;
  }

  /// Check [text] is blank or not. (include space, null)
  /// 判断 [text] 是否为空字符或空格(包括空格, null)
  static bool isBlank(String text) {
    // 若[text]为null, 或去空后长度为0, 则代表为blank.
    return text == null || text.trim().length == 0;
  }

  /// Check [textList] contains blank string or not. (just like several times of [isBlank])
  /// 判断 [textList] 中, 是否包含空字符或空格([isBlank]的批量处理版)
  static bool hasBlank(List<String> textList) {
    for (var text in textList) {
      if (isBlank(text)) {
        return true;
      }
    }
    return false;
  }

  /// Check [text] is integer or not.
  /// 判断 [text] 是否为一个整数
  static bool isInt(String text) {
    // 若为空字符串, 直接返回false
    if (isBlank(text)) {
      return false;
    }

    // 若包含空格, 直接返回false
    if (text.length != text.trim().length) {
      return false;
    }

    // 通过使用int的parse方法, 若成功则证明为一个整数
    try {
      int.parse(text);
    } on FormatException {
      return false;
    }
    return true;
  }

  /// Remove [prefix] of [text].
  /// 移除字符串 [text] 的前缀 [prefix]
  static String removePrefix(String text, String prefix) {
    if (text.isEmpty || prefix.isEmpty) {
      return text;
    }
    return text.replaceFirst(prefix, '');
  }

  /// Remove [suffix] of [text]
  /// 移除字符串 [text] 的后缀 [suffix]
  static String removeSuffix(String text, String suffix) {
    if (text.isEmpty || suffix.isEmpty) {
      return text;
    }
    // 获取后缀下标
    var lastIndex = text.lastIndexOf(suffix);
    if (lastIndex == -1) {
      // 当未找到后缀时, 直接返回
      return text;
    }
    return text.replaceFirst(suffix, '', lastIndex);
  }
}
