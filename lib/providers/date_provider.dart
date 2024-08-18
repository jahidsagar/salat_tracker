import 'package:flutter/foundation.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

class DateProvider extends ChangeNotifier{
  String? _dayName;
  String? _gregorianDate;
  String? _hijriDate;
  DateTime? _date;

  final Map<String, String> hijriMonthsInEnglish = {
    'Muharram': 'Muharram',
    'Safar': 'Safar',
    'Rabi' 'Al-Awwal': 'Rabi\' al-Awwal',
    'Rabi' 'Al-Thani': 'Rabi\' al-Thani',
    'Jumada' 'Al-Awwal': 'Jumada al-Awwal',
    'Jumada' 'Al-Thani': 'Jumada al-Thani',
    'Rajab': 'Rajab',
    'Sha\'ban': 'Sha\'ban',
    'Ramadan': 'Ramadan',
    'Shawwal': 'Shawwal',
    'Dhu' 'Al-Qi\'dah': 'Dhu\'l-Qi\'dah',
    'Dhu' 'Al-Hijjah': 'Dhu\'l-Hijjah',
  };

  void getTodayHijriDate(){
    DateTime now = DateTime.now();
    _date = now;
    _dayName = DateFormat('EEEE').format(now);

    // Get Gregorian date in the desired format
    _gregorianDate = DateFormat('MMMM d, yyyy').format(now);

    // Get Hijri date
    HijriCalendar.setLocal("en");
    HijriCalendar _todayHijri = HijriCalendar.now();
    String hijriMonthInArabic = _todayHijri.longMonthName;
    String hijriMonthInEnglish = hijriMonthsInEnglish[hijriMonthInArabic] ?? hijriMonthInArabic;
    _hijriDate = '$hijriMonthInEnglish ${_todayHijri.hDay}, ${_todayHijri.hYear}';
    // notifyListeners();
  }

  void getCustomHijriDate(DateTime date){
    _date = date;
    _dayName = DateFormat('EEEE').format(date);

    // Get Gregorian date in the desired format
    _gregorianDate = DateFormat('MMMM d, yyyy').format(date);

    // Get Hijri date
    HijriCalendar.setLocal("en");
    HijriCalendar _customHijri = HijriCalendar.fromDate(date);
    String hijriMonthInArabic = _customHijri.longMonthName;
    String hijriMonthInEnglish = hijriMonthsInEnglish[hijriMonthInArabic] ?? hijriMonthInArabic;
    _hijriDate = '$hijriMonthInEnglish ${_customHijri.hDay}, ${_customHijri.hYear}';
    notifyListeners();
  }

  String get dayName => _dayName!;
  String get gregorianDate => _gregorianDate!;
  String get hijriDate => _hijriDate!;
  DateTime get pickedDate => _date!;
}