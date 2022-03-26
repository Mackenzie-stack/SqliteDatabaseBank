

import 'package:database_app_tutorial/model/bank_model_class.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseSQLIT {

  // return db.execute(
  // 'CREATE TABLE BankDetails( '
  // 'id INTEGER PRIMARY KEY, '
  // 'bankName TEXT, '
  // 'bankAccName TEXT, '
  // 'bankAccNum INTEGER)',
  // );


  // INITIALIZE THE DATABASE
   Future<Database> initializeDB() async {
  String path = await getDatabasesPath();
  return openDatabase(join(path, 'tether.db'),onCreate: (database, version) async {
  await  database.execute(
  'CREATE TABLE BankDetails( '
  'id INTEGER PRIMARY KEY, '
  'bankName TEXT, '
  'bankAccName TEXT, '
  'bankAccNum TEXT)',
  );
  },
    version: 1,
  );
  }

// INSERT TO THE DATABASE
  Future<int> insertBankDetails(LocalBankDetails bankdetails) async {
    // Get a reference to the database.
    // final Database db = await initializeDB();  You can try this out instead of the above option 1
    final Database db = await initializeDB();    // Insert the Dog into the correct table. You might also specify the
    // conflictAlgorithm` to use in case the same dog is inserted twice.
    //In this case, replace any previous data.
    try {
      await db.insert('BankDetails', bankdetails.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );   }
      catch (error){
      print(error);
      print('NOT SAVED TO DATABASE');
    }

    final id = await db.insert('BankDetails', bankdetails.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  // READ ALL DATA FROM THE DATABASE
    Future<List<Map<String, dynamic>>> getItems() async {
    final Database db = await initializeDB();
    return db.query('BankDetails', orderBy: "id");
  }

  //READ FROM THE DATABASE
   Future<List<LocalBankDetails>> retrieveBankDetails() async {
    final Database db = await initializeDB();

    //final List<Map<String, Object?>> queryResult = await db.query('BankDetails');
var query = await db.query('BankDetails');
    List<LocalBankDetails> expenseList = <LocalBankDetails>[];

    return query.map((e) {
      return LocalBankDetails.fromMap(e);
    }).toList();
  }


}