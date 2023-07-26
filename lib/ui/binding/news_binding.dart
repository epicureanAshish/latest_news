import 'package:latest_news/ui/controller/details_controller.dart';
import 'package:latest_news/ui/controller/home_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class NewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
    Get.lazyPut<DetailsController>(
          () => DetailsController(),
    );
  }
}
