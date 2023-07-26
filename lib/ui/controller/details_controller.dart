import 'package:latest_news/model/news_response_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailsController extends GetxController {
  late Articles newsArticle;


  @override
  onInit(){
    super.onInit();
    if(Get.arguments!=null){
      newsArticle=Get.arguments;
    }
  }

  String formatDate(String dateTime){
    return DateFormat("dd MMM, yyyy hh:mm a").format(
        DateTime.parse(dateTime));
  }

}
