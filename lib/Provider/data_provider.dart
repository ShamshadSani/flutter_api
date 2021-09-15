import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api_task/Model/data_model.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class DataProvide extends ChangeNotifier {
  List<DataModel>? dataList = [];
  bool? isLoading = true;

  Future<void> getData() async {
    try {
      isLoading = true;
      dataList = [];

      final http.Response appJson = await http.get(
        Uri.parse("https://api.openbrewerydb.org/breweries"),
      );

      if (ApiResponse.apiStatus(appJson.statusCode) ==
          "Api Error: Page Not Found") {
        print("Api Error: Page Not Found");
      } else if (ApiResponse.apiStatus(appJson.statusCode) ==
          "performing URL redirection") {
        print("performing URL redirection");
      } else if (ApiResponse.apiStatus(appJson.statusCode) == "Server Error") {
        print("Server Error");
      } else if (ApiResponse.apiStatus(appJson.statusCode) == "Success") {
        var allData = jsonDecode(appJson.body);
        if (ApiResponse.dataListMethod(allData!.length) == "data found") {
          allData!.forEach((element) {
            dataList!.add(DataModel.fromJson(element));
            notifyListeners();
          });
          isLoading = false;
          notifyListeners();
        }
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print(e);
      throw Exception();
    }
  }
}

class ApiResponse {
  static String? apiStatus(int response) {
    if (response >= 200 && response <= 205) {
      return "Success";
    } else if (response >= 400 && response <= 405) {
      return "Api Error: Page Not Found";
    } else if (response == 302) {
      return "performing URL redirection";
    } else if (response == 500) {
      return "Server Error";
    }
  }

  static String? dataListMethod(length) {
    if (length == 0) {
      return "no Data";
    } else if (length >= 1) {
      return "data found";
    }
  }
}
