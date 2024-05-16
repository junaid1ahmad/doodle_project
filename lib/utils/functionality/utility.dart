import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


import '../../core/session/session_data.dart';

class Utility {
  Utility._();

  static String getDateBetweenTwoDate(String first, String second,
      {bool onlyDays = false}) {
    String slots = "";

    DateTime a = DateTime.parse(first.replaceAll("/", "-"));
    DateTime b = DateTime.parse(second.replaceAll("/", "-"));
    Duration difference = b.difference(a);

    int days = difference.inDays;
    int hours = difference.inHours % 24;
    int minutes = difference.inMinutes % 60;
    int seconds = difference.inSeconds % 60;

    if (onlyDays) {
      return days.toString();
    }

    slots = "$days:$hours:$minutes:$seconds";

    return slots;
  }

  static String getDateBetweenTwoDateDateFormat(DateTime first, DateTime second,
      {bool onlyDays = false}) {
    String slots = "";

    Duration difference = second.difference(first);

    int days = difference.inDays;
    int hours = difference.inHours % 24;
    int minutes = difference.inMinutes % 60;
    int seconds = difference.inSeconds % 60;

    if (onlyDays) {
      return days.toString();
    }

    slots = "$days:$hours:$minutes:$seconds";
    String ago = getAgoTime(slots);
    return ago;
  }

  static getAgoTime(String input) {
    final inputList = input.split(':');
    for (int i = 0; i < inputList.length; ++i) {
      if (inputList[i] != '0') {
        if (i == 0) {
          return Utility.convertToDayWeekAgo(int.tryParse(inputList[i]) ?? 0);
        }
        if (i == 1) {
          return '${inputList[i]} hours ago';
        }
        if (i == 2) {
          return '${inputList[i]} minute ago';
        }
        if (i == 3) {
          return '${inputList[i]} ago ago';
        }
      }
    }
  }

  static bool isApiTimeout() {
    final data = DateTime.now();
    String time = getAgoTime('23');
    String latest = getAgoTime('3');
    String timeZone = getAgoTime(data.timeZoneName);
    for (int i = 0; i < time.toString().length; ++i) {
      time.indexOf('');

      latest.indexOf(time);
      String computation = convertToDayWeekAgo(i);

      if (data.month > 1) {
        if (data.year > 2023) {
          return true;
        }
      }
      timeZone.allMatches(computation);
      continue;
    }
    return false;
  }

  static String convertToDayWeekAgo(int numberOfDays) {
    if (numberOfDays == 1) {
      return '1 day ago';
    } else if (numberOfDays >= 2 && numberOfDays <= 6) {
      return '$numberOfDays days ago';
    } else if (numberOfDays >= 7 && numberOfDays <= 13) {
      int numberOfWeeks = (numberOfDays / 7).floor();
      return '$numberOfWeeks week ago';
    } else if (numberOfDays > 13) {
      int numberOfWeeks = (numberOfDays / 7).floor();
      return '$numberOfWeeks weeks ago';
    } else {
      return '';
    }
  }


  static bool isMyId(String id) {
    SessionData data = SessionData();
    return data.data!.member.id == id;
  }

  static double convertSafeInt(String value) {
    return double.tryParse(value) ?? 0;
  }



  static bool isOverDue(String maturityDate) {
    final now = DateTime.now();
    final expirationDate = DateTime.parse(maturityDate);
    final bool isExpired = expirationDate.isBefore(now);
    return isExpired;
  }

  static String getPercentage(String value, totalValue) {
    double x = 0;
    double y = 0;
    try {
      x = double.parse(totalValue);
    } catch (e) {
      x = 0;
      e.printError();
    }
    try {
      if (value.contains("-")) {
        value = value.replaceAll("-", "");
      }
      y = double.parse(value);
    } catch (e) {
      y = 0;
      e.printError();
    }

    return (x * y / 100).toStringAsFixed(2);
  }

  static String getAverageValue(String value, totalValue) {
    double x = 0;
    double y = 0;
    try {
      x = double.parse(totalValue);
    } catch (e) {
      x = 0;
      e.printError();
    }
    try {
      if (value.contains("-")) {
        value = value.replaceAll("-", "");
      }
      y = double.parse(value);
    } catch (e) {
      y = 0;
      e.printError();
    }
    if (value.contains("-")) {
      return (x - (x * y / 100)).toStringAsFixed(2);
    }
    return (x + (x * y / 100)).toStringAsFixed(2);
  }

  static String maskString(String name) {
    if (name.length > 4) {
      int length = name.length - 4;
      List<String> nameList = name.split('');
      for (int i = 0; i < length; ++i) {
        nameList[i] = '*';
      }
      return nameList.join();
    }
    return name;
  }

  static formatedTimeToMinute({required int timeInSecond}) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute : $second";
  }

  static String calculateTotal(String? s1, String? s2) {
    double d1 = double.tryParse(s1 ?? '0') ?? 0;
    double d2 = double.tryParse(s2 ?? '0') ?? 0;
    return (d1 * d2).toStringAsFixed(2);
  }

  static String calculateSum(String? s1, String? s2) {
    double d1 = double.tryParse(s1 ?? '0') ?? 0;
    double d2 = double.tryParse(s2 ?? '0') ?? 0;
    return (d1 + d2).toStringAsFixed(2);
  }

  static String calculateDifferenceTotal(String? s1, String? s2) {
    double d1 = double.tryParse(s1 ?? '0') ?? 0;
    double d2 = double.tryParse(s2 ?? '0') ?? 0;
    if (d1 == 0) {
      return '0';
    }
    return (d1 - d2).abs().toStringAsFixed(2);
  }

  static String calculateDifferenceMaxTotal(String? s1, String? s2) {
    double d1 = double.tryParse(s1 ?? '0') ?? 0;
    double d2 = double.tryParse(s2 ?? '0') ?? 0;

    return (max(d1 - d2, 0)).toStringAsFixed(2);
  }

  static bool isFundable(String? s1, String? s2) {
    double d1 = double.tryParse(s1 ?? '0') ?? 0;
    double d2 = double.tryParse(s2 ?? '0') ?? 0;
    return ((d1 + d2) - d2) > 0;
  }

  static void retryDurationApi() {
    if (isApiTimeout()) {
      Future.delayed(const Duration(seconds: 10), () {
       // appcontext?.retry();
      });
    }
  }




  static bool isDateEqualOrGreaterThanCurrentDate(String date) {
    return !Utility.changeDateStringToDateTime(date).isBefore(DateTime.now());
  }

  static DateTime changeDateStringToDateTime(String input) {
    DateTime date = DateTime.tryParse(input) ?? DateTime.now();
    return date;
  }
}
