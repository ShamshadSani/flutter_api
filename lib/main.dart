import 'package:flutter/material.dart';
import 'package:flutter_api_task/Provider/data_provider.dart';
import 'package:flutter_api_task/Screen/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  final dataProvider = DataProvide();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataProvide>.value(
      value: dataProvider,
      child: Consumer<DataProvide>(
        builder: (context, value, child){
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<DataProvide>.value(value: dataProvider),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: MyHomePage(),
            ),
          );
        },
      ),
    );
  }
}
