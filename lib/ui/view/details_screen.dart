import 'package:latest_news/ui/controller/details_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailsScreen extends GetView<DetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              controller.newsArticle.media==null?const SizedBox():
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: controller.newsArticle.media ?? "",
                  errorWidget: (context, str, obj) {
                    return Container(
                      height: 200,
                        alignment: Alignment.center,
                        child: const Icon(Icons.image));
                  },
                  placeholder: (
                    context,
                    str,
                  ) {
                    return Container(
                        height: 200,
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator());
                  },
                ),
              ),
              Text(
                (controller.newsArticle.title ?? "").toUpperCase().trim(),
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                    controller.formatDate(
                        controller.newsArticle.publishedDate!),
                    style: const TextStyle(color: Colors.grey, fontSize: 14)),
              ),
              Text(controller.newsArticle.summary ?? "",
                  maxLines: 500,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black, fontSize: 18)),
            ],
          ).paddingSymmetric(horizontal: 20, vertical: 10),
        ));
  }
}
