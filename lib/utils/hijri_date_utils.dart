import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';

Future<void> _selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );
  if (picked != null) {
    // Convert the picked date to Hijri
    HijriCalendar _hijri = HijriCalendar.fromDate(picked);
  }
}