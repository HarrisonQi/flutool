import 'package:flutter_test/flutter_test.dart';

import 'package:flutool_core/flutool_core.dart';

void main() {
  strUtilTest();
}

void strUtilTest() {
  toDateTime();

  removeSuffix();

  removePrefix();

  strHasEmpty();

  strIsInt();

  strHasBlank();

  strIsBlank();
}

/// 测试 [StrUtil.toDateTime]
void toDateTime() {
  test('String to DateTime', () {
    expect(StrUtil.toDateTime('2020-05-21'), DateTime(2020, 5, 21));
    expect(StrUtil.toDateTime('2020-05-21 01:03'), DateTime(2020, 5, 21, 1, 3));
    expect(StrUtil.toDateTime('2020-05-21 01:03:40'),
        DateTime(2020, 5, 21, 1, 3, 40));
    expect(StrUtil.toDateTime('2020-13-21 01:03:40'),
        DateTime(2021, 1, 21, 1, 3, 40));
    expect(() => StrUtil.toDateTime('abc'), throwsFormatException);
    expect(() => StrUtil.toDateTime(''), throwsFormatException);

    expect('2020-05-21'.toDateTime, DateTime(2020, 5, 21));
    expect('2020-05-21 01:03'.toDateTime, DateTime(2020, 5, 21, 1, 3));
    expect('2020-05-21 01:03:40'.toDateTime, DateTime(2020, 5, 21, 1, 3, 40));
    expect('2020-13-21 01:03:40'.toDateTime, DateTime(2021, 1, 21, 1, 3, 40));
    expect(() => 'abc'.toDateTime, throwsFormatException);
    expect(() => ''.toDateTime, throwsFormatException);
  });
}

/// 测试[StrUtil.removeSuffix]
void removeSuffix() {
  test('Remove string suffix', () {
    expect(StrUtil.removeSuffix('HelloWorld!', '!'), 'HelloWorld');
    expect(StrUtil.removeSuffix('HelloWorld', 'World'), 'Hello');
    expect(StrUtil.removeSuffix('HelloHello', 'Hello'), 'Hello');
    expect(StrUtil.removeSuffix('HelloHelloHello', 'Hello'), 'HelloHello');
    expect(StrUtil.removeSuffix('HelloWorld', 'HelloWorld'), '');
    expect(StrUtil.removeSuffix('HelloWorld', ''), 'HelloWorld');
    expect(StrUtil.removeSuffix('HelloWorld', 'abc'), 'HelloWorld');
    expect(StrUtil.removeSuffix(' ', ' '), '');
    expect(StrUtil.removeSuffix(' ', '  '), ' ');
    expect(StrUtil.removeSuffix('    ', ' '), '   ');
    expect(() => StrUtil.removeSuffix('    ', null), throwsNoSuchMethodError);
    expect(() => StrUtil.removeSuffix(null, ' '), throwsNoSuchMethodError);

    expect('HelloWorld!'.removeSuffix('!'), 'HelloWorld');
    expect('HelloWorld'.removeSuffix('World'), 'Hello');
    expect('HelloHello'.removeSuffix('Hello'), 'Hello');
    expect('HelloHelloHello'.removeSuffix('Hello'), 'HelloHello');
    expect('HelloWorld'.removeSuffix('HelloWorld'), '');
    expect('HelloWorld'.removeSuffix(''), 'HelloWorld');
    expect('HelloWorld'.removeSuffix('abc'), 'HelloWorld');
    expect(' '.removeSuffix(' '), '');
    expect(' '.removeSuffix('  '), ' ');
    expect('    '.removeSuffix(' '), '   ');
    expect(() => '    '.removeSuffix(null), throwsNoSuchMethodError);
    expect(() => null.removeSuffix(' '), throwsNoSuchMethodError);
  });
}

/// 测试[StrUtil.removePrefix]
void removePrefix() {
  test('Remove string prefix', () {
    expect(StrUtil.removePrefix('HelloWorld', 'Hello'), 'World');
    expect(StrUtil.removePrefix('HelloHello', 'Hello'), 'Hello');
    expect(StrUtil.removePrefix('HelloWorld', 'HelloWorld'), '');
    expect(StrUtil.removePrefix('HelloWorld', ''), 'HelloWorld');
    expect(StrUtil.removePrefix('HelloWorld', 'abc'), 'HelloWorld');
    expect(StrUtil.removePrefix(' ', ' '), '');
    expect(StrUtil.removePrefix(' ', '  '), ' ');
    expect(StrUtil.removePrefix('    ', ' '), '   ');
    expect(() => StrUtil.removePrefix('    ', null), throwsNoSuchMethodError);
    expect(() => StrUtil.removePrefix(null, ' '), throwsNoSuchMethodError);

    expect('HelloWorld'.removePrefix('Hello'), 'World');
    expect('HelloHello'.removePrefix('Hello'), 'Hello');
    expect('HelloWorld'.removePrefix('HelloWorld'), '');
    expect('HelloWorld'.removePrefix(''), 'HelloWorld');
    expect('HelloWorld'.removePrefix('abc'), 'HelloWorld');
    expect(' '.removePrefix(' '), '');
    expect(' '.removePrefix('  '), ' ');
    expect('    '.removePrefix(' '), '   ');
    expect(() => '    '.removePrefix(null), throwsNoSuchMethodError);
    expect(() => null.removePrefix(' '), throwsNoSuchMethodError);
  });
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
