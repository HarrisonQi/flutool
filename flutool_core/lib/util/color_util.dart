import 'dart:ui';

class ColorUtil {

  /// Parse [hexStr] to Color.
  /// 将16进制字符串[hexStr]转为Color
  static Color fromHex(String hexStr) {
    /*
    判断格式. 可能的格式有:
      - 仅16进制: CC00FF       带透明度: FFCC00FF
      - 以'#'开头: #CC00FF     带透明度: #FFCC00FF
      - 以'0x'开头: 0xffffff   带透明度: 0xffffffff
     */

    // 转为全大写
    hexStr = hexStr.toUpperCase();

    // 替换所有 '#' 和 '0x':
    hexStr = hexStr.replaceAll("#", "");
    hexStr = hexStr.replaceAll("0X", "");

    // 校验字符串长度(仅接受6位和8位)
    if (hexStr.length != 6 && hexStr.length != 8) {
      throw ArgumentError.value("[$hexStr] is not a radix-16 number!");
    }

    // 如果不带透明度, 则手动拼接
    if (hexStr.length == 6) {
      // 非透明前缀
      String suffix = "FF";
      hexStr = suffix + hexStr;
    }

    // 定义16进制变量
    int colorValue;

    try {
      // 尝试转换, 若报错则证明不是一个16进制数字
      colorValue = int.parse(hexStr, radix: 16);
    } on FormatException {
      throw ArgumentError.value("[$hexStr] is not a radix-16 number!");
    }

    return Color(colorValue);
  }
}
