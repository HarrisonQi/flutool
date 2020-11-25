import 'package:flutool_core/util/color_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutool_core/flutool_core.dart';

void main() {
  colorUtilTest();
}

void colorUtilTest() {
  fromHexTest();
}

void fromHexTest() {
  test("test fromHex", () {
    expect(ColorUtil.fromHex("0xFFC71585"), Color(0xFFC71585));
    expect(ColorUtil.fromHex("0x20C71585"), Color(0x20C71585));
    expect(ColorUtil.fromHex("0xC71585"), Color(0xFFC71585));

    expect(ColorUtil.fromHex("FF00FF7F"), Color(0xFF00FF7F));
    expect(ColorUtil.fromHex("2000FF7F"), Color(0x2000FF7F));
    expect(ColorUtil.fromHex("00FF7F"), Color(0xFF00FF7F));

    expect(ColorUtil.fromHex("#FFFFD700"), Color(0xFFFFD700));
    expect(ColorUtil.fromHex("#FFD700"), Color(0xFFFFD700));

    expect(() => ColorUtil.fromHex("00FF7Z"), throwsArgumentError);
    expect(() => ColorUtil.fromHex("#ZFD700"), throwsArgumentError);
    expect(() => ColorUtil.fromHex("#ZFD7001"), throwsArgumentError);
    expect(() => ColorUtil.fromHex("0xC7158"), throwsArgumentError);
    expect(() => ColorUtil.fromHex("0xC715851"), throwsArgumentError);
    expect(() => ColorUtil.fromHex("00FFC71585"), throwsArgumentError);

    expect("#FFD700".toColor, Color(0xFFFFD700));
    expect("#FFD700".toColor == Color(0xFFFFD701), false);
  });
}
