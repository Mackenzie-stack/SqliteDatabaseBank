import 'package:database_app_tutorial/Providers/provider_for_sqlite.dart';
import 'package:database_app_tutorial/SqLiteDataBase/sqlite_database.dart';
import 'package:database_app_tutorial/model/bank_model_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddBankDetails  extends StatelessWidget {
final TextEditingController bnkName = TextEditingController();
final TextEditingController bnkAccName = TextEditingController();
final TextEditingController bnkAccNum = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ProviderForSqLite>(context);
    final DataBaseSQLIT db = DataBaseSQLIT();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children:  <Widget>[
        Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: bnkName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Bank Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: bnkAccName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Full Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: bnkAccNum,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Bank Account',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                model.save(
                     bnkName.text,
                    bnkAccName.text,
                    bnkAccNum.text
                );
                   var newnk = LocalBankDetails(
                    bankName:  bnkName.text,
                    bankAccNum:bnkAccName.text,
                    bankAccName: bnkAccNum.text
                );
                // db.insertBankDetails(
                //     LocalBankDetails(
                //      bankAccName: bnkName.text,
                //       bankName: bnkAccName.text,
                //       bankAccNum:  bnkAccNum.text,);
                 db.insertBankDetails(newnk);
               model.localBank = db.retrieveBankDetails(newnk);

               // model.isloading =false;
                //Navigator.pop(context);
                },

              child: Text(
                'Save Account',
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.green,
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

            ),

          ],
        ),
      ),
      ],
    ),
    ),
    );
      }
}
