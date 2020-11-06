import 'package:flutter_test/flutter_test.dart';

import 'package:flutool_core/flutool_core.dart';

void strUtilTest() {
  strHasEmpty();

  strIsInt();

  strHasBlank();

  strIsBlank();
}

/// 测试[StrUtil.hasEmpty]
void strHasEmpty() {
  test('String list contains empty', () {
    expect(StrUtil.hasEmpty(['']), true);
    expect(StrUtil.hasEmpty(['', 'a']), true);
    expect(StrUtil.hasEmpty(['', ' ']), true);
    expect(StrUtil.hasEmpty(['', '        ']), true);
    expect(StrUtil.hasEmpty(['a']), false);
    expect(StrUtil.hasEmpty(['a', 'b']), false);
    expect(StrUtil.hasEmpty(['a', ' ']), false);
    expect(StrUtil.hasEmpty(['a', 'b', ' ']), false);
    expect(StrUtil.hasEmpty(['a', 'b', ' ', '']), true);
  });
}

/// 测试[StrUtil.isInt] 以及 [String.isInt]
void strIsInt() {
  test('String is integer or not', () {
    expect(StrUtil.isInt(''), false);
    expect(StrUtil.isInt(' '), false);
    expect(StrUtil.isInt('         '), false);
    expect(StrUtil.isInt('abcdefg'), false);
    expect(StrUtil.isInt('1a2b'), false);
    expect(StrUtil.isInt(null), false);
    expect(StrUtil.isInt(' 1 '), false);
    expect(StrUtil.isInt('1'), true);
    expect(StrUtil.isInt('-100'), true);
    expect(StrUtil.isInt('0'), true);
    expect(StrUtil.isInt('9223372036854775807'), true);
    expect(StrUtil.isInt('-9223372036854775807'), true);
    expect(StrUtil.isInt('9223372036854775808'), false);
    expect(StrUtil.isInt('1119223372036854775808'), false);

    expect(''.isInt, false);
    expect(' '.isInt, false);
    expect('         '.isInt, false);
    expect('abcdefg'.isInt, false);
    expect('1a2b'.isInt, false);
    expect(null.isInt, false);
    expect(' 1 '.isInt, false);
    expect('1'.isInt, true);
    expect('-100'.isInt, true);
    expect('0'.isInt, true);
    expect('9223372036854775807'.isInt, true);
    expect('-9223372036854775807'.isInt, true);
    expect('9223372036854775808'.isInt, false);
    expect('1119223372036854775808'.isInt, false);
  });
}

/// 测试 [StrUtil.hasBlank]
void strHasBlank() {
  test('String has blank', () {
    expect(StrUtil.hasBlank([]), false);
    expect(StrUtil.hasBlank(['']), true);
    expect(StrUtil.hasBlank(['', ' ', '         ']), true);
    expect(StrUtil.hasBlank(['', ' ', 'abc']), true);
    expect(StrUtil.hasBlank(['', '123', 'abc']), true);
    expect(StrUtil.hasBlank(['', ' ', '123', 'abc']), true);
    expect(StrUtil.hasBlank(['aaaaa']), false);
    expect(StrUtil.hasBlank(['b', 't', '123', 'abc']), false);
    expect(() => StrUtil.hasBlank(null), throwsNoSuchMethodError);
  });
}

/// 测试 [StrUtil.isBlank] 以及 [String.isBlank]
void strIsBlank() {
  test('String is blank', () {
    Map<String, bool> demos = {
      '': true,
      ' ': true,
      '         ': true,
      null: true,
      '1': false,
      ' 1 ': false
    };

    demos.forEach((key, value) {
      expect(StrUtil.isBlank(key), value);
      expect(key.isBlank, value);
    });
  });
}
