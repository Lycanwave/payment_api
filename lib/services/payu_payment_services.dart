import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:payment_api/constants.dart';
import 'package:payment_api/model/payment_biodata_model.dart';
import 'package:payment_api/model/paytm_payment_model.dart';

class PayuStateServices {
  // Future<PaytmModel> fetch_Payment_States_Records() async {
  //   var headers = {'Authorization': 'Bearer '};
  //   var response =
  //       await http.get(Uri.parse(base_url + "payment/paytm/checkout"));

  //   response.headers.addAll(headers);
  //   var streamedResponse = await response.

  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body);
  //     return PaytmModel.fromJson(data);
  //   } else {
  //     throw Exception('Error');
  //   }
  // }

  Future<PaymentBiodataModel> fetch_payment_biodata_details() async {
    String token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjo iYWNjZXNzIiwiZXhwIjoxNjgzMzk4NDEyLCJqdGkiOiJiODYxYmMwNWNjZWM0ZWMwYWUxYTYyN2VjYzZiOTZhZiIsInVzZXJfaWQiOjE2Njh9.708K85Q-dxiBHoUTFIS6wQTFvAHQQUXsZnazjhxwe0Y';

    var header = {'Authorization': 'Bearer $token'};
    final response = await http.get(Uri.parse(base_url + "biodata/details"),
        headers: header);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return PaymentBiodataModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  //Future<>
}


// [999] (){
//   model = payustate(biodata,payment);
//   payucheckoutpro(model)
// }