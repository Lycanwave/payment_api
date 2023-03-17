import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:payment_api/model/screen_arguments.dart';
import 'package:payment_api/payuPayment/payu_payment_screen.dart';
import 'package:payment_api/services/payu_payment_services.dart';

class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: PayuStateServices().fetch_payment_biodata_details(),
              builder: ((context, snapshot) {
                print(snapshot.data);
                if (snapshot.hasData)
                  return Container(
                    child: Text(snapshot.data!.response!.firstName.toString()),
                  );
                else
                  return Center(
                    child: CircularProgressIndicator(),
                  );
              })),
          ElevatedButton(
              onPressed: () {
                final responseBioData =
                    PayuStateServices().fetch_payment_biodata_details();
                responseBioData.then(
                  (value) {
                    Navigator.of(context).pushNamed(
                      PayuPaymentScreen.route,
                      arguments: ScreenArguments(
                        productInfo: "123",
                        amount: "999",
                        firstName: value.response!.firstName.toString(),
                        email: value.response!.email.toString() == "null"
                            ? "rohit.kumar07feb@gmail.com"
                            : value.response!.email.toString(),
                        phoneNo: value.response!.phoneNumber.toString(),
                      ),
                    );
                    // var response = PayuPaymentScreen(
                    //   productInfo: "123",
                    //   amount: "999",
                    //   email: value.response!.email.toString() == "null"
                    //       ? "rohit.kumar07feb@gmail.com"
                    //       : value.response!.email.toString(),
                    //   phoneNo: value.response!.phoneNumber.toString(),
                    //   firstName: value.response!.firstName.toString(),
                    // );
                    // PayuStateServices().startTransaction(txnToken, mid, orderId,
                    //     amount, callBackUrl, (datas, flag) {});
                  },
                );
              },
              child: Text("Press")),
        ],
      ),
    );
  }
}
