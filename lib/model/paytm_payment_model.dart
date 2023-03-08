// To parse this JSON data, do
//
//     final paytmModel = paytmModelFromJson(jsonString);

import 'dart:convert';

PaytmModel paytmModelFromJson(String str) =>
    PaytmModel.fromJson(json.decode(str));

String paytmModelToJson(PaytmModel data) => json.encode(data.toJson());

class PaytmModel {
  PaytmModel({
    this.transactionDetails,
    this.orderDetails,
  });

  TransactionDetails? transactionDetails;
  OrderDetails? orderDetails;

  factory PaytmModel.fromJson(Map<String, dynamic> json) => PaytmModel(
        transactionDetails:
            TransactionDetails.fromJson(json["transaction_details"]),
        orderDetails: OrderDetails.fromJson(json["order_details"]),
      );

  Map<String, dynamic> toJson() => {
        "transaction_details": transactionDetails!.toJson(),
        "order_details": orderDetails!.toJson(),
      };
}

class OrderDetails {
  OrderDetails({
    this.body,
    this.head,
  });

  OrderDetailsBody? body;
  OrderDetailsHead? head;

  factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
        body: OrderDetailsBody.fromJson(json["body"]),
        head: OrderDetailsHead.fromJson(json["head"]),
      );

  Map<String, dynamic> toJson() => {
        "body": body!.toJson(),
        "head": head!.toJson(),
      };
}

class OrderDetailsBody {
  OrderDetailsBody({
    this.requestType,
    this.mid,
    this.websiteName,
    this.orderId,
    this.callbackUrl,
    this.txnAmount,
    this.userInfo,
  });

  String? requestType;
  String? mid;
  String? websiteName;
  int? orderId;
  String? callbackUrl;
  TxnAmount? txnAmount;
  UserInfo? userInfo;

  factory OrderDetailsBody.fromJson(Map<String, dynamic> json) =>
      OrderDetailsBody(
        requestType: json["requestType"],
        mid: json["mid"],
        websiteName: json["websiteName"],
        orderId: json["orderId"],
        callbackUrl: json["callbackUrl"],
        txnAmount: TxnAmount.fromJson(json["txnAmount"]),
        userInfo: UserInfo.fromJson(json["userInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "requestType": requestType,
        "mid": mid,
        "websiteName": websiteName,
        "orderId": orderId,
        "callbackUrl": callbackUrl,
        "txnAmount": txnAmount!.toJson(),
        "userInfo": userInfo!.toJson(),
      };
}

class TxnAmount {
  TxnAmount({
    this.value,
    this.currency,
  });

  String? value;
  String? currency;

  factory TxnAmount.fromJson(Map<String, dynamic> json) => TxnAmount(
        value: json["value"],
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "currency": currency,
      };
}

class UserInfo {
  UserInfo({
    this.custId,
  });

  int? custId;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        custId: json["custId"],
      );

  Map<String, dynamic> toJson() => {
        "custId": custId,
      };
}

class OrderDetailsHead {
  OrderDetailsHead({
    this.signature,
  });

  String? signature;

  factory OrderDetailsHead.fromJson(Map<String, dynamic> json) =>
      OrderDetailsHead(
        signature: json["signature"],
      );

  Map<String, dynamic> toJson() => {
        "signature": signature,
      };
}

class TransactionDetails {
  TransactionDetails({
    this.head,
    this.body,
  });

  TransactionDetailsHead? head;
  TransactionDetailsBody? body;

  factory TransactionDetails.fromJson(Map<String, dynamic> json) =>
      TransactionDetails(
        head: TransactionDetailsHead.fromJson(json["head"]),
        body: TransactionDetailsBody.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "head": head!.toJson(),
        "body": body!.toJson(),
      };
}

class TransactionDetailsBody {
  TransactionDetailsBody({
    this.resultInfo,
    this.txnToken,
    this.isPromoCodeValid,
    this.authenticated,
  });

  ResultInfo? resultInfo;
  String? txnToken;
  bool? isPromoCodeValid;
  bool? authenticated;

  factory TransactionDetailsBody.fromJson(Map<String, dynamic> json) =>
      TransactionDetailsBody(
        resultInfo: ResultInfo.fromJson(json["resultInfo"]),
        txnToken: json["txnToken"],
        isPromoCodeValid: json["isPromoCodeValid"],
        authenticated: json["authenticated"],
      );

  Map<String, dynamic> toJson() => {
        "resultInfo": resultInfo!.toJson(),
        "txnToken": txnToken,
        "isPromoCodeValid": isPromoCodeValid,
        "authenticated": authenticated,
      };
}

class ResultInfo {
  ResultInfo({
    this.resultStatus,
    this.resultCode,
    this.resultMsg,
  });

  String? resultStatus;
  String? resultCode;
  String? resultMsg;

  factory ResultInfo.fromJson(Map<String, dynamic> json) => ResultInfo(
        resultStatus: json["resultStatus"],
        resultCode: json["resultCode"],
        resultMsg: json["resultMsg"],
      );

  Map<String, dynamic> toJson() => {
        "resultStatus": resultStatus,
        "resultCode": resultCode,
        "resultMsg": resultMsg,
      };
}

class TransactionDetailsHead {
  TransactionDetailsHead({
    this.responseTimestamp,
    this.version,
    this.signature,
  });

  String? responseTimestamp;
  String? version;
  String? signature;

  factory TransactionDetailsHead.fromJson(Map<String, dynamic> json) =>
      TransactionDetailsHead(
        responseTimestamp: json["responseTimestamp"],
        version: json["version"],
        signature: json["signature"],
      );

  Map<String, dynamic> toJson() => {
        "responseTimestamp": responseTimestamp,
        "version": version,
        "signature": signature,
      };
}
