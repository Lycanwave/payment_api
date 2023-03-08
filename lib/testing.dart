import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
              }))
        ],
      ),
    );
  }
}
