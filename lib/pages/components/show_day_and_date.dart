import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:salat_tracker/providers/date_provider.dart';

import '../../providers/salat_model_provider.dart';
import '../../utils/date_utils.dart';

class ShowDayAndDate extends StatefulWidget {
  const ShowDayAndDate({super.key});

  @override
  State<ShowDayAndDate> createState() => _ShowDayAndDateState();
}

class _ShowDayAndDateState extends State<ShowDayAndDate> {

  @override
  void initState() {
    super.initState();
    context.read<DateProvider>().getTodayHijriDate();
  }

  @override
  Widget build(BuildContext context) {
    final dateProviderClass = Provider.of<DateProvider>(context);
    context.read<SalatModelProvider>().getSingleSalat(DateToString(dateProviderClass.pickedDate));

    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFE2ECE9), //E2ECE9
      ),
      child: Column(
        children: [
          Text(
            dateProviderClass.dayName,
            style: TextStyle(fontSize: 20),
          ),
          Text(
            dateProviderClass.gregorianDate,
            style: TextStyle(fontSize: 20),
          ),
          Text(
            dateProviderClass.hijriDate,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
