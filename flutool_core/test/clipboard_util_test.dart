import 'package:flutool_core/util/clipboard_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  clipboardUtilTest();
}

void clipboardUtilTest() async {
  test("Test set into clipboard", () {
    testClipboard();
  });
}

/// 测试[ClipboardUtil.set] 和 [ClipboardUtil.get]
/// 该类只有在启动app才能正确测试!
void testClipboard() async {
  String content = DateTime.now().toString();
  print('content before:$content');
  await ClipboardUtil.set(content);

  ClipboardUtil.get().then((value) => print('res:$value'));
}
