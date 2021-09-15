import 'package:flutter_api_task/Provider/data_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
// Page not found
  test("Page Not Found", () {
    var result = ApiResponse.apiStatus(400);
    expect("Api Error: Page Not Found", result);
  });
// Getting successful Data
  test("Getting successful data", () {
    var result = ApiResponse.apiStatus(200);
    expect("Success", result);
  });
// requested URI Issue
  test("requested resource has been temporarily moved to a different URI", () {
    var result = ApiResponse.apiStatus(302);
    expect("performing URL redirection", result);
  });
// Server Issue
  test(" Server is notresponding", () {
    var result = ApiResponse.apiStatus(500);
    expect("Server Error", result);
  });
// List of data not Found in Api
  test("Empty List Found", () {
    var result = ApiResponse.dataListMethod(0);
    expect("no data", result);
  });
// List of data Found in Api
  test("List of Data Found", () {
    var result = ApiResponse.dataListMethod(1);
    expect("data found", result);
  });
}
