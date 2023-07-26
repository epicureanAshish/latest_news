import 'dart:convert';
import 'dart:developer';

import 'package:latest_news/main.dart';
import 'package:latest_news/model/news_response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' hide Response;
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  NewsResponseModel? newsResponseModel;

  var isDataLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getApi();
  }

  String formatDate(String dateTime){
    return DateFormat("dd MMM, yyyy hh:mm a").format(
        DateTime.parse(dateTime));
  }

  Future<void> getApi() async {
    try {
      isDataLoading(true);
      Response response = await dioClient.get(
        'https://api.newscatcherapi.com/v2/latest_headlines?countries=US&topic=business',
        queryParameters: {"countries": "US", "topic": "business"},
        options: Options(headers: {
          "x-api-key": "6BNDlK5ihipNXK24RPGAyhtwF-yVJzIf2XDgEba5emo"
        }),
      );
      if (response.statusCode == 200) {
        ///data successfully
        var result = json.encode(response.data);
        debugPrint("RESPONSE ${result.runtimeType}");
        newsResponseModel = NewsResponseModel.fromJson(jsonDecode(result));
      } else {
        ///error
      }
    } catch (e) {
      log('Error while getting data is $e');
    } finally {
      isDataLoading(false);
    }
  }
}
