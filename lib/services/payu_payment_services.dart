import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:payment_api/constants.dart';
import 'package:payment_api/model/payment_biodata_model.dart';
import 'package:payment_api/model/paytm_payment_model.dart';
import 'package:payment_api/payuPayment/payu_payment_screen.dart';

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
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjgzNjMyMDQzLCJqdGkiOiJlYzNmNzEyZjE3NGY0NzQ5ODQyNjYwMTFiNTViODY1YSIsInVzZXJfaWQiOjE2Njh9.2-6tKoqO0o7My7vPfLtdGFLWtOEr93w44VoNq9LwlC4';

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

  startTransaction(txnToken, mid, orderId, amount, callBackUrl,
      void completionHandler(datas, flag)) {
    if (txnToken.isEmpty) {
      return;
    }

    final responseBiodata = fetch_payment_biodata_details();

    responseBiodata.then((value) {
      var response = PayuPaymentScreen(
        productInfo: orderId,
        amount: amount,
        email: value.response!.email.toString() == "null"
            ? "rohit.kumar07feb@gmail.com"
            : value.response!.email.toString(),
        phoneNo: value.response!.phoneNumber.toString(),
        firstName: value.response!.firstName.toString(),
      );
    });
  }
}


// [999] (){
//   model = payustate(biodata,payment);
//   payucheckoutpro(model)
// }