import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salat_tracker/providers/date_provider.dart';

class SalatNameWithIconAndButton extends StatelessWidget {
  IconData icon;
  String salatName;

  SalatNameWithIconAndButton(this.icon, this.salatName);

  void _showMyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
              child: Column(
            children: [
              Icon(this.icon),
              Text(this.salatName),
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
                // Navigator.of(context).pop(); // Dismiss the dialog
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
                // Navigator.of(context).pop(); // Dismiss the dialog
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
                // Navigator.of(context).pop(); // Dismiss the dialog
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
                // Navigator.of(context).pop(); // Dismiss the dialog
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
                      this.icon,
                      size: 35,
                    ),
                  ),
                  Text(
                    this.salatName,
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
                child: Container(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
