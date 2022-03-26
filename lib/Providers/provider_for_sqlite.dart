import 'package:database_app_tutorial/SqLiteDataBase/sqlite_database.dart';
import 'package:database_app_tutorial/model/bank_model_class.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class ProviderForSqLite extends ChangeNotifier {

  final DataBaseSQLIT dbHelper;

 // final  _db = DataBaseSQLIT();
   List<LocalBankDetails> _localBank = [ ];
  List<LocalBankDetails> get getLocalBankDetails => [..._localBank];

  void refreshBankDetails() async {
    final data = await db.retrieveBankDetails();
    _localBank = data;
    notifyListeners(); }

  void save( String bnkName, String bnkAccName,String bnkAccNum) {
    var newBankDetails =  LocalBankDetails(
      bankName: bnkName,
      bankAccName: bnkAccName,
      bankAccNum: bnkAccNum,
    );
    _localBank.add(newBankDetails);
     db.insertBankDetails(newBankDetails);
     db.retrieveBankDetails();

   // final id = await db.insertBankDetails(newBankDetails);
    print('inserted row idwwwwww ${newBankDetails}');
      notifyListeners();
  }

  Future addUsers(String bnk1, String bn2, String bn3) async  {
    LocalBankDetails firstUser = LocalBankDetails(
      bankAccName: bnk1,
      bankAccNum: bn2,
      bankName: bn3,
    );
    _localBank = [firstUser,];
    return await db.insertBankDetails(firstUser);
  }


  Future<List<LocalBankDetails>> retrieveBankFromProvider() async {
    final  dbb = await db.initializeDB();
    final List<Map<String, Object?>> queryResult = await dbb.query('BankDetails');
    return queryResult.map((e) {
      return LocalBankDetails.fromMap(e);
    }).toList();
  }

  Future<List> getIttems() async {
    final bdd = await db.initializeDB();
    return bdd.query('BankDetails', orderBy: "id");
  }

  ProviderForSqLite(this._localBank, this.dbHelper) {
    if (dbHelper != null)
      fetchAndSetData();
  }




}