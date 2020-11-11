import 'package:flutool_core/util/number_util.dart';
import 'package:flutool_core/util/random_util.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutool_core/flutool_core.dart';

void main() {
  randomUtilTest();
}

void randomUtilTest() {
  randomIntListTest();

  randomEleTest();

  randomIntTest();
}

/// 测试[RandomUtil.randomIntList]
void randomIntListTest() {
  test("Test generate random integer list", () {
    for (int i = 0; i < 100; i++) {
      var randomIntList = RandomUtil.randomIntList(0, 10, 5);
      print('randomIntList:$randomIntList');
      for (var randomInt in randomIntList) {
        expect(randomInt >= 0 && randomInt <= 10, true);
      }
    }
  });
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

/// 测试[RandomUtil.randomEle]
void randomEleTest() {
  test("Test random element from list", () {
    for (int i = 0; i < 1000; i++) {
      var ele = RandomUtil.randomEle([1, 2, 3, 4, 5]);
      expect(NumberUtil.isBetween(ele, 1, 5), true);
    }

    expect(RandomUtil.randomEle([null]), null);

    expect(() => RandomUtil.randomEle(null), throwsArgumentError);
    expect(() => RandomUtil.randomEle([]), throwsArgumentError);

    for (int i = 0; i < 1000; i++) {
      var ele = [1, 2, 3, 4, 5].randomEle;
      expect(NumberUtil.isBetween(ele, 1, 5), true);
    }
    expect(() => null.randomEle, throwsArgumentError);
    expect(() => [].randomEle, throwsArgumentError);
  });
}
