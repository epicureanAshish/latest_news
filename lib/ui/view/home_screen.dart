import 'package:latest_news/constant/route_constant.dart';
import 'package:latest_news/ui/controller/home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreen extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SafeArea(
        child: Obx(() => controller.isDataLoading.value
            ? _loadingView()
            : _newsListView()),
      ),
    );
  }

  PreferredSizeWidget _appBar(){
    return AppBar(
      leading: const SizedBox(),
      title: const Text('Latest News',),
      centerTitle: true,);
  }

  Widget _loadingView(){
    return const Center(child: CircularProgressIndicator());
  }

  Widget _newsListView(){
    return ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: controller.newsResponseModel?.articles?.length??0,
        separatorBuilder: (context, index) {
          return const Divider(color: Colors.white,);
        },
        itemBuilder: (context, index) {
          return _newsCardView(index);
        });
  }

  Widget _newsCardView(int index){
    return InkWell(
      onTap: (){
        Get.toNamed(RouteConstant.detailScreen,
            arguments: controller.newsResponseModel!.articles![index]
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          children: [
            controller.newsResponseModel!.articles![index].media==null?const SizedBox():
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft:Radius.circular(10),
                topRight:Radius.circular(10),
              ),
              child:
              CachedNetworkImage(
                imageUrl:controller.newsResponseModel!.articles![index].media??"",
                errorWidget: (context, str, obj){
                  return Container(
                      height: 200,
                      alignment: Alignment.center,
                      color: Colors.grey.shade300,
                      child: const Icon(Icons.image,color: Colors.grey, size: 50,));
                },
                placeholder: (context, str,){
                  return Container(
                      height: 200,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator());
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text((controller.newsResponseModel!.articles![index].title??"").toUpperCase(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),),
                Text(controller.newsResponseModel!.articles![index].summary??"",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18
                    )),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    controller.formatDate(
                      controller.newsResponseModel!.articles![index].publishedDate!),
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14
                      )),
                ),
              ],
            )
                .paddingSymmetric(horizontal: 20, vertical: 10),
          ],
        ),
      ),
    );
  }
}
