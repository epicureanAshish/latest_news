import 'package:latest_news/constant/route_constant.dart';
import 'package:latest_news/ui/binding/news_binding.dart';
import 'package:latest_news/ui/view/details_screen.dart';
import 'package:latest_news/ui/view/home_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage> getPages = [
  GetPage(
      name: RouteConstant.homeScreen,
      page: () =>  HomeScreen(),
      binding: NewsBinding()),
  GetPage(
      name: RouteConstant.detailScreen,
      page: () =>  DetailsScreen(),
      binding: NewsBinding()),
];