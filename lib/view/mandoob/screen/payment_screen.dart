import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandoob/controller/mandoob/payment_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentScreen extends GetView<PaymentController> {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){},
            icon: const Icon(Icons.exit_to_app_outlined),
          ),
        ),
        body: WebViewWidget(
            controller: controller.webController,
        ),
      ),
    );
  }
}

