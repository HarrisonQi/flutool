import 'package:flutter/services.dart';

/// Clipboard util
/// 剪贴板工具类
class ClipboardUtil {
  /// Set [content] into clipboard.
  /// 将文本复制到剪贴板
  static Future set(String content) async {
    await Clipboard.setData(ClipboardData(text: content));
  }

  /// Get content from clipboard.
  /// 从剪贴板中获取文本
  static Future<String> get() async {
    var data = await Clipboard.getData(Clipboard.kTextPlain);
    return data.text;
  }
}
