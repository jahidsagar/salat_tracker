import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salat_tracker/models/salat_model.dart';
import 'package:salat_tracker/providers/date_provider.dart';
import 'package:salat_tracker/providers/salat_model_provider.dart';
import 'package:salat_tracker/utils/date_utils.dart';

class SalatNameWithIconAndButton extends StatefulWidget {
  IconData icon;
  String salatName;
  int? salatValue;

  SalatNameWithIconAndButton(this.icon, this.salatName, this.salatValue);

  @override
  State<SalatNameWithIconAndButton> createState() =>
      _SalatNameWithIconAndButtonState();
}

class _SalatNameWithIconAndButtonState
    extends State<SalatNameWithIconAndButton> {
  void _showMyDialog(BuildContext context) {
    final date = DateToString(context.read<DateProvider>().pickedDate);
    final salatProvider = context.read<SalatModelProvider>().salatInstance;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
              child: Column(
            children: [
              Icon(this.widget.icon),
              Text(this.widget.salatName),
              Text(
                context.read<DateProvider>().gregorianDate,
                style: TextStyle(fontSize: 10),
              ),
            ],
          )),
          content: Text(
            'Select your salat status',
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            TextButton(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.block),
                  ),
                  Expanded(
                    child: Text("Not Prayed"),
                  ),
                ],
              ),
              onPressed: () {
                SalatModel salat = new SalatModel.fromString(
                    salat: salatProvider!,
                    //context.read<SalatModelProvider>().salatModel ?? SalatModel(date: date),
                    salatName: this.widget.salatName,
                    value: 0);

                context
                    .read<SalatModelProvider>()
                    .insertOrUpdate(salat)
                    .then((_) {
                  Navigator.of(context).pop();
                }).catchError((err) {});
              },
            ),
            TextButton(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.add_alert_outlined),
                  ),
                  Expanded(
                    child: Text("Late"),
                  ),
                ],
              ),
              onPressed: () {
                SalatModel salat = new SalatModel.fromString(
                    salat: salatProvider!,
                    salatName: this.widget.salatName,
                    value: 1);

                context
                    .read<SalatModelProvider>()
                    .insertOrUpdate(salat)
                    .then((_) {
                  Navigator.of(context).pop();
                }).catchError((err) {});
              },
            ),
            TextButton(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.person_outline),
                  ),
                  Expanded(
                    child: Text("On time"),
                  ),
                ],
              ),
              onPressed: () {
                SalatModel salat = new SalatModel.fromString(
                    salat: salatProvider!,
                    salatName: this.widget.salatName,
                    value: 2);

                context
                    .read<SalatModelProvider>()
                    .insertOrUpdate(salat)
                    .then((_) {
                  Navigator.of(context).pop();
                }).catchError((err) {});
              },
            ),
            TextButton(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.people_outline),
                  ),
                  Expanded(
                    child: Text("Jamaat"),
                  ),
                ],
              ),
              onPressed: () {
                SalatModel salat = new SalatModel.fromString(
                    salat: salatProvider!,
                    salatName: this.widget.salatName,
                    value: 3);

                context
                    .read<SalatModelProvider>()
                    .insertOrUpdate(salat)
                    .then((_) {
                  context.read<SalatModelProvider>().getSingleSalat(
                      DateToString(context.read<DateProvider>().pickedDate));
                  Navigator.of(context).pop();
                }).catchError((err) {});
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 2, bottom: 2),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFDFE7FD), // Background color for the Row
          borderRadius: BorderRadius.circular(20.0), // Rounded border
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Icon(
                      this.widget.icon,
                      size: 35,
                    ),
                  ),
                  Text(
                    this.widget.salatName,
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 70,
              width: 70,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFAD2E1), // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), // Rounded corners
                  ),
                ),
                onPressed: () {
                  _showMyDialog(context);
                },
                child: this.widget.salatValue == 0
                    ? Icon(Icons.block)
                    : this.widget.salatValue == 1
                        ? Icon(Icons.add_alert_outlined)
                        : this.widget.salatValue == 2
                            ? Icon(Icons.person_outline)
                            : this.widget.salatValue == 3
                                ? Icon(Icons.people_outline)
                                : Container(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
