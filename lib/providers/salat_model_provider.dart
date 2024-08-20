import 'package:flutter/foundation.dart';
import 'package:salat_tracker/db/db_helper.dart';
import 'package:salat_tracker/models/salat_model.dart';

class SalatModelProvider extends ChangeNotifier{
  DbHelper db = DbHelper();
  SalatModel? _salatModel;
  
  Future<void> insertOrUpdate(SalatModel salat) async{
    await db.insertOrUpdate(salat);
    await getSingleSalat(salat.date!);
  }

  Future<void> getSingleSalat(String date) async{
    _salatModel = await db.getSingleData(date);
    notifyListeners();
  }

  SalatModel? get salatInstance => _salatModel;
}