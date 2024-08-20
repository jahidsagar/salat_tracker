import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salat_tracker/pages/components/custom_bottom_navigation_bar.dart';
import 'package:salat_tracker/pages/components/salat_name_with_icon_and_button.dart';
import 'package:salat_tracker/pages/components/show_day_and_date.dart';
import 'package:salat_tracker/providers/date_provider.dart';
import 'package:salat_tracker/providers/salat_model_provider.dart';
import 'package:salat_tracker/utils/date_utils.dart';

// Source to make Bottom navigation bar: https://blog.logrocket.com/how-to-build-a-bottom-navigation-bar-in-flutter/

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  DateTime? _selectedDate;

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: context.read<DateProvider>().pickedDate, //DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(), // DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        context.read<DateProvider>().getCustomHijriDate(picked);
        context.read<SalatModelProvider>().getSingleSalat(DateToString(picked));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShowDayAndDate(),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Consumer<SalatModelProvider>(
                  builder: (context, provider, child) {
                    final salat = provider.salatInstance;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                          child: Text(
                            "Prayer",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SalatNameWithIconAndButton(
                            Icons.dark_mode_outlined, "Fazr", salat?.fazr),
                        SalatNameWithIconAndButton(Icons.sunny, "Duhr", salat?.duhr),
                        SalatNameWithIconAndButton(Icons.cloud_queue, "Asr", salat?.asr),
                        SalatNameWithIconAndButton(Icons.sunny_snowing, "Magrib", salat?.magrib),
                        SalatNameWithIconAndButton(Icons.night_shelter, "Esha", salat?.esha),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _selectDate(context);
        },
        child: const Icon(
          Icons.calendar_month_outlined,
          size: 40,
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
