import 'package:flutter/material.dart';
import 'package:flutter_api_task/Provider/data_provider.dart';
import 'package:flutter_api_task/Screen/detail_screen.dart';
import 'package:flutter_api_task/Widgets/text.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {

      Provider.of<DataProvide>(context, listen: false).getData();


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvide>(context);
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Task"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: dataProvider.isLoading!
              ? CircularProgressIndicator()
              : dataProvider.dataList!.isEmpty || dataProvider.dataList == null
                  ? TextWidget("No Data Found")
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          List.generate(dataProvider.dataList!.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: InkWell(
                              onTap: () {
                                onCardTap(
                                    dataProvider: dataProvider, index: index);
                              },
                              child: Container(
                                width: screenSize.width,
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      "${dataProvider.dataList![index].name}",
                                      size: 18,
                                      weight: FontWeight.w600,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextWidget(
                                          "${dataProvider.dataList![index].city}",
                                        ),
                                        TextWidget(
                                            "${dataProvider.dataList![index].createdAt}"
                                                .split(" ")[0])
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  onCardTap({dataProvider, index}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailScreen(
                  data: dataProvider.dataList![index],
                )));
  }
}
