import 'package:flutter/material.dart';
import 'package:payment_api/model/screen_arguments.dart';
import 'package:payment_api/services/payu_payment_services.dart';
import 'package:payu_checkoutpro_flutter/payu_checkoutpro_flutter.dart';
import 'package:payu_checkoutpro_flutter/PayUConstantKeys.dart';
import 'dart:convert';

import 'HashServices.dart';
//Dont Use this file and do the hash calculation in backend.

class PayuPaymentScreen extends StatefulWidget {
  static const route = '/payupayment';

  // String productInfo;
  // String firstName;
  // String email;
  // String amount;
  // String phoneNo;
  // PayuPaymentScreen(
  //     {Key? key,
  //     required this.amount,
  //     required this.email,
  //     required this.firstName,
  //     required this.productInfo,
  //     required this.phoneNo})
  //     : super(key: key);

  @override
  State<PayuPaymentScreen> createState() => _PayuPaymentScreenState();
}

class _PayuPaymentScreenState extends State<PayuPaymentScreen>
    implements PayUCheckoutProProtocol {
  late PayUCheckoutProFlutter _checkoutPro;
  // String? productInfo;
  // String? firstName;
  // String? email;
  // String? amount;
  // String? phoneNo;

  @override
  void initState() {
    super.initState();
    _checkoutPro = PayUCheckoutProFlutter(this);
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    final productInfo = args.productInfo;
    final firstName = args.firstName;
    final email = args.email;
    final amount = args.amount;
    final phoneNo = args.phoneNo;
    return _checkoutPro.openCheckoutScreen(
      payUPaymentParams: PayUParams.createPayUPaymentParams(amount: amount),
      payUCheckoutProConfig: PayUParams.createPayUConfigParams(),
    );
  }

  showAlertDialog(BuildContext context, String title, String content) {
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(content),
            ),
            actions: [okButton],
          );
        });
  }

  @override
  generateHash(Map response) {
    // Backend will generate the hash which you need to pass to SDK
    // hashResponse: is the response which you get from your server

    Map hashResponse = {};

    //Keep the salt and hash calculation logic in the backend for security reasons. Don't use local hash logic.
    //Uncomment following line to test the test hash.
    hashResponse = HashService.generateHash(response);

    _checkoutPro.hashGenerated(hash: hashResponse);
  }

  @override
  onPaymentSuccess(dynamic response) {
    Map<String, Object> result = response;
    // String payuResponse = result[PayUCheckoutProConstants.CP_PAYU_RESPONSE].toString();
    // String merchantResponse = result[PayUCheckoutProConstants.CP_MERCHANT_RESPONSE].toString();
    //Log.e(TAG, "onPaymentFailure: " + payuResponse);
    showAlertDialog(context, "onPaymentSuccess", response.toString());
  }

  @override
  onPaymentFailure(dynamic response) {
    showAlertDialog(context, "onPaymentFailure", response.toString());
  }

  @override
  onPaymentCancel(Map? response) {
    showAlertDialog(context, "onPaymentCancel", response.toString());
  }

  @override
  onError(Map? response) {
    showAlertDialog(context, "onError", response.toString());
  }
}

class PayUTestCredentials {
  //Find the test credentials from dev guide: https://devguide.payu.in/flutter-sdk-integration/getting-started-flutter-sdk/mobile-sdk-test-environment/
  static const merchantKey = "l1K8X1P1"; // Add you Merchant Key
  static const iosSurl = "http://www.payu.in/txnstatus";
  static const iosFurl = "http://www.payu.in/txnstatus";
  static const androidSurl = "https://payuresponse.firebaseapp.com/success";
  static const androidFurl = "https://payuresponse.firebaseapp.com/failure";

  static const merchantAccessKey = ""; //Add Merchant Access Key - Optional
  static const sodexoSourceId = ""; //Add sodexo Source Id - Optional
}

//Pass these values from your app to SDK, this data is only for test purpose
class PayUParams {
  // final payu_services=PayuStateServices().startTransaction("njdcjbcbdbchd", "l1K8X1P1", "123", "999", "", (datas, flag) { });
  static Map createPayUPaymentParams({String? amount}) {
    var siParams = {
      PayUSIParamsKeys.isFreeTrial: true,
      PayUSIParamsKeys.billingAmount: amount, //Required
      PayUSIParamsKeys.billingInterval: '1', //Required
      PayUSIParamsKeys.paymentStartDate: '2023-03-17', //Required
      PayUSIParamsKeys.paymentEndDate: '2023-03-17', //Required
      PayUSIParamsKeys.billingCycle: //Required
          'daily', //Can be any of 'daily','weekly','yearly','adhoc','once','monthly'
      PayUSIParamsKeys.remarks: 'Test SI transaction',
      PayUSIParamsKeys.billingCurrency: 'INR',
      PayUSIParamsKeys.billingLimit: 'ON', //ON, BEFORE, AFTER
      PayUSIParamsKeys.billingRule: 'MAX', //MAX, EXACT
    };

    var additionalParam = {
      PayUAdditionalParamKeys.udf1: "udf1",
      PayUAdditionalParamKeys.udf2: "udf2",
      PayUAdditionalParamKeys.udf3: "udf3",
      PayUAdditionalParamKeys.udf4: "udf4",
      PayUAdditionalParamKeys.udf5: "udf5",
      PayUAdditionalParamKeys.merchantAccessKey:
          PayUTestCredentials.merchantAccessKey,
      PayUAdditionalParamKeys.sourceId: PayUTestCredentials.sodexoSourceId,
    };

    var spitPaymentDetails = {
      "type": "absolute",
      "splitInfo": {
        PayUTestCredentials.merchantKey: {
          "aggregatorSubTxnId":
              "1234567540099887766650091", //unique for each transaction
          "aggregatorSubAmt": "1"
        }
      }
    };

    var payUPaymentParams = {
      PayUPaymentParamKey.key: PayUTestCredentials.merchantKey,
      PayUPaymentParamKey.amount: amount,
      PayUPaymentParamKey.productInfo: "Info",
      PayUPaymentParamKey.firstName: "Abc",
      PayUPaymentParamKey.email: "test@gmail.com",
      PayUPaymentParamKey.phone: "9999999999",
      PayUPaymentParamKey.ios_surl: PayUTestCredentials.iosSurl,
      PayUPaymentParamKey.ios_furl: PayUTestCredentials.iosFurl,
      PayUPaymentParamKey.android_surl: PayUTestCredentials.androidSurl,
      PayUPaymentParamKey.android_furl: PayUTestCredentials.androidFurl,
      PayUPaymentParamKey.environment: "0", //0 => Production 1 => Test
      PayUPaymentParamKey.userCredential:
          null, //Pass user credential to fetch saved cards => A:B - Optional
      PayUPaymentParamKey.transactionId:
          DateTime.now().millisecondsSinceEpoch.toString(),
      //"<ADD TRANSACTION ID>", //DateTime.now().millisecondsSinceEpoch.toString()
      PayUPaymentParamKey.additionalParam: additionalParam,
      PayUPaymentParamKey.enableNativeOTP: true,
      PayUPaymentParamKey.splitPaymentDetails: json.encode(spitPaymentDetails),
      PayUPaymentParamKey.userToken:
          "", //Pass a unique token to fetch offers. - Optional
    };

    return payUPaymentParams;
  }

  static Map createPayUConfigParams() {
    var paymentModesOrder = [
      {"Wallets": "PHONEPE"},
      {"UPI": "PAYTM"},
      {"Wallets": "PAYTM"},
      {"EMI": ""},
      {"NetBanking": ""},
    ];

    var cartDetails = [
      {"GST": "5%"},
      {"Delivery Date": "25 Dec"},
      {"Status": "In Progress"}
    ];
    var enforcePaymentList = [
      {"payment_type": "CARD", "enforce_ibiboCode": "UTIBENCC"},
    ];

    var customNotes = [
      {
        "custom_note": "Its Common custom note for testing purpose",
        "custom_note_category": [
          PayUPaymentTypeKeys.emi,
          PayUPaymentTypeKeys.card
        ]
      },
      {
        "custom_note": "Payment options custom note",
        "custom_note_category": null
      }
    ];

    var payUCheckoutProConfig = {
      PayUCheckoutProConfigKeys.primaryColor: "#4994EC",
      PayUCheckoutProConfigKeys.secondaryColor: "#FFFFFF",
      PayUCheckoutProConfigKeys.merchantName: "PayU",
      //PayUCheckoutProConfigKeys.merchantLogo: "logo",
      PayUCheckoutProConfigKeys.showExitConfirmationOnCheckoutScreen: true,
      PayUCheckoutProConfigKeys.showExitConfirmationOnPaymentScreen: true,
      PayUCheckoutProConfigKeys.cartDetails: cartDetails,
      PayUCheckoutProConfigKeys.paymentModesOrder: paymentModesOrder,
      PayUCheckoutProConfigKeys.merchantResponseTimeout: 30000,
      PayUCheckoutProConfigKeys.customNotes: customNotes,
      PayUCheckoutProConfigKeys.autoSelectOtp: true,
      //PayUCheckoutProConfigKeys.enforcePaymentList: enforcePaymentList,
      PayUCheckoutProConfigKeys.waitingTime: 30000,
      PayUCheckoutProConfigKeys.autoApprove: true,
      PayUCheckoutProConfigKeys.merchantSMSPermission: true,
      PayUCheckoutProConfigKeys.showCbToolbar: true,
    };
    return payUCheckoutProConfig;
  }
}
