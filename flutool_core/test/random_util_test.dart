import 'package:flutool_core/util/random_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  randomUtilTest();
}

void randomUtilTest() {
  randomIntTest();
}

/// 测试[RandomUtil.randomInt]
void randomIntTest() {
  test("Test generate random integer", () {
    for (int i = 0; i < 10000; i++) {
      int rand = RandomUtil.randomInt(0, 10);
      expect(rand >= 0 && rand <= 10, true);
    }
    for (int i = 0; i < 10000; i++) {
      int rand = RandomUtil.randomInt(100, -100);
      expect(rand >= -100 && rand <= 100, true);
    }

    expect(RandomUtil.randomInt(1, 1), 1);

    expect(() => RandomUtil.randomInt(null, 1), throwsArgumentError);
    expect(() => RandomUtil.randomInt(10, null), throwsArgumentError);
    expect(() => RandomUtil.randomInt(null, null), throwsArgumentError);
  });
}
