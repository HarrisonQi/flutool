import 'package:flutool_core/util/clipboard_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async{
  TestWidgetsFlutterBinding.ensureInitialized();
  clipboardUtilTest();
}

/// 测试[ClipboardUtil.set] 和 [ClipboardUtil.get]
/// 该类只有在启动app才能正确测试!
void clipboardUtilTest() async {
  test("Test set into clipboard", () {
    String content = DateTime.now().toString();
    ClipboardUtil.set(content);
    ClipboardUtil.get().then((value) => print('res:$value'));
  });
}