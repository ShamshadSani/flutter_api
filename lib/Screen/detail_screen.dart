import 'package:flutter/material.dart';
import 'package:flutter_api_task/Model/data_model.dart';
import 'package:flutter_api_task/Widgets/row_widget.dart';

class DetailScreen extends StatelessWidget {
  final DataModel? data;
  const DetailScreen({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${data!.name}"),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        RowWidget(
                          title: "Name: ",
                          text: data!.name,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RowWidget(
                          title: "Brewery Type: ",
                          text: data!.breweryType,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RowWidget(
                          title: "Phone: ",
                          text: data!.phone,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RowWidget(
                          title: "Postal Code: ",
                          text: "${data!.postalCode} ",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RowWidget(
                          title: "Address: ",
                          text: "${data!.street == null ? "" : data!.street} " +
                              "${data!.city == null ? "" : data!.city} " +
                              "${data!.state == null ? "" : data!.state} " +
                              "${data!.country == null ? "" : data!.country}",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RowWidget(
                          title: "Longitude: ",
                          text: data!.longitude,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RowWidget(
                          title: "Latitude: ",
                          text: data!.latitude,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}


