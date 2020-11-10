import 'package:flutool_core/util/number_util.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutool_core/flutool_core.dart';

void main() {
  numberUtilTest();
}

void numberUtilTest() {
  isNumTest();
  isBetweenTest();
}

/// 测试函数[NumberUtil.isNum]
void isNumTest() {
  test("Is number test", () {
    expect(NumberUtil.isNum(null), false);
    expect(NumberUtil.isNum('a'), false);
    expect(NumberUtil.isNum('1'), false);
    expect(NumberUtil.isNum(1), true);
    expect(NumberUtil.isNum(1.0), true);
  });
}

/// 测试函数[NumberUtil.isBetween]
void isBetweenTest() {
  test("Is number between test", () {
    expect(NumberUtil.isBetween(5, 1, 10), true);
    expect(NumberUtil.isBetween(5, 10, 1), true);
    expect(NumberUtil.isBetween(0, -10, 10), true);
    expect(NumberUtil.isBetween(0, 10, -10), true);
    expect(NumberUtil.isBetween(11, 1, 10), false);
    expect(NumberUtil.isBetween(0, 1, 10), false);
    expect(NumberUtil.isBetween(-1, 1, 10), false);

    expect(NumberUtil.isBetween(5, 1.1, 10), true);
    expect(NumberUtil.isBetween(5, 1, 10.5), true);
    expect(NumberUtil.isBetween(5.5, 5.4, 5.6), true);
    expect(NumberUtil.isBetween(5, 4.9, 5.1), true);
    expect(NumberUtil.isBetween(4.9, 4.9, 4.9), true);
    expect(NumberUtil.isBetween(5, 4.9, 4.9), false);

    expect(() => NumberUtil.isBetween(5, null, 5.1), throwsArgumentError);
    expect(() => NumberUtil.isBetween(5, 4.9, null), throwsArgumentError);
    expect(() => NumberUtil.isBetween(null, 4.9, 5.1), throwsArgumentError);

    expect(() => NumberUtil.isBetween('a', 4.9, 5.1), throwsArgumentError);
    expect(() => NumberUtil.isBetween(5, 'b', 5.1), throwsArgumentError);
    expect(() => NumberUtil.isBetween(5, 4.9, 'c'), throwsArgumentError);

    expect(5.isBetween(4, 5), true);
    expect(3.5.isBetween(2.9, 3.6), true);
    expect(3.isBetween(4, 5), false);
  });
}
