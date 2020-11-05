import 'package:flutter_test/flutter_test.dart';

import 'package:flutool_core/flutool_core.dart';

void main() {
  test('adds one to input values', () {
    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
    expect(() => calculator.addOne(null), throwsNoSuchMethodError);
  });

  test('String is blank', () {
    expect(StringUtil.isBlank(''), true);
    expect(StringUtil.isBlank(' '), true);
    expect(StringUtil.isBlank('         '), true);
    expect(StringUtil.isBlank(null), true);
    expect(StringUtil.isBlank('1'), false);
    expect(StringUtil.isBlank(' 1 '), false);
  });
}
