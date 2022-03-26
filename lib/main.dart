import 'package:database_app_tutorial/model/bank_model_class.dart';
import 'package:database_app_tutorial/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/provider_for_sqlite.dart';
import 'SqLiteDataBase/sqlite_database.dart';
import 'screens/add_bank_details_page.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderForSqLite()),
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
