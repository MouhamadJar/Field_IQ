import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentController extends GetxController {

  late String link;
  late WebViewController webController;
  RxBool isLoading = true.obs;
  RxDouble loadingValue = 0.0.obs;

  @override
  void onInit() {
    /// TODO: Initial Web Controller
    webController = WebViewController()
    ..loadRequest(Uri.parse(link))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(link)  ) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );
    super.onInit();
  }

  PaymentController(this.link);
}
