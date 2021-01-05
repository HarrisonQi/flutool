import 'package:flutool_core/util/date_time_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  dateTimeUtilTest();
}

void dateTimeUtilTest() {
  beginOfDayTest();

  endOfDayTest();

  yesterday();
}

void beginOfDayTest() {
  test("Test get begin of a day", () {
    expect(DateTimeUtil.beginOfDay(DateTime.parse("2028-10-10 09:30:30")),
        DateTime.parse("2028-10-10 00:00:00"));

    expect(DateTimeUtil.beginOfDay(DateTime.parse("2028-01-20 23:59:59")),
        DateTime.parse("2028-01-20 00:00:00"));
  });
}

void endOfDayTest() {
  test("Test get end of a day", () {
    expect(DateTimeUtil.endOfDay(DateTime.parse("2028-10-10 09:30:30")),
        DateTime.parse("2028-10-10 23:59:59.999999"));

    expect(DateTimeUtil.endOfDay(DateTime.parse("2028-10-10 00:00:00")),
        DateTime.parse("2028-10-10 23:59:59.999999"));
  });
}

void yesterday(){
  test("Test get yesterday", (){
    expect(DateTimeUtil.yesterday(DateTime.parse("2028-10-10 09:30:30")),
        DateTime.parse("2028-10-09 09:30:30"));

    expect(DateTimeUtil.yesterday(DateTime.parse("2028-03-01 22:30:30")),
        DateTime.parse("2028-02-29 22:30:30"));
  });
}