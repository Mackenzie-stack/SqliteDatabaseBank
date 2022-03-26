
import 'package:database_app_tutorial/Providers/provider_for_sqlite.dart';
import 'package:database_app_tutorial/SqLiteDataBase/sqlite_database.dart';
import 'package:database_app_tutorial/model/bank_model_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_bank_details_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ProviderForSqLite>(context);
     //DataBaseSQLIT db = DataBaseSQLIT();
    final db = DataBaseSQLIT();


    return Scaffold(
      appBar: AppBar(),


      body: FutureBuilder(
        future: db.getItems(),
          builder: (BuildContext context, AsyncSnapshot<List<LocalBankDetails>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    //key: ValueKey<int>(snapshot.data![index]),
                    contentPadding: const EdgeInsets.all(8.0),
                    title: Text(
                      snapshot.data![index].bankName,
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.red,
                      ),
                    ),
                    subtitle: Text(
                      snapshot.data![index].bankAccName,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
                child:
            Text(" No Bank Details dded Yet "));
          }
        },
      ),





      // body: (prov.isloading)
      //     ? ListView.builder(
      //     itemCount: _journals.length,
      //     itemBuilder: (context, index){
      //       return Card(
      //           elevation: 8,
      //           shadowColor: Colors.green,
      //           margin: EdgeInsets.all(20),
      //           shape:  OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(10),
      //               borderSide: BorderSide(color: Colors.green, width: 1)
      //           ),
      //           child: Row(
      //             children: <Widget>[
      //               Column(
      //                 children: <Widget>[
      //                   Padding(
      //                     padding: const EdgeInsets.all(8.0),
      //                     child: Text(prov.getLocalBankDetails[index].bankName),
      //                   ),
      //                   Padding(
      //                     padding: const EdgeInsets.all(8.0),
      //                     child: Text(prov.getLocalBankDetails[index].bankAccName),
      //                   ),
      //                   Padding(
      //                     padding: const EdgeInsets.all(8.0),
      //                     child: Text(prov.getLocalBankDetails[index].bankAccNum),
      //                   ),
      //                 ],
      //               ),
      //
      //
      //             IconButton(
      //               icon: Icon(
      //                 Icons.directions_transit,
      //               ),
      //               color: Colors.green,
      //               onPressed: () {},
      //             ),
      //           ],
      //         ),
      //       );
      //     }
      //
      // )
      //
      //     : const CircularProgressIndicator(),


      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddBankDetails()));},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),

    );
  }
}



