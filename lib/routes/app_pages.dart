import 'package:get/get.dart';
import 'package:flutter_getx_news/features/presentation/category/controller/category_controller.dart';
import 'package:flutter_getx_news/features/presentation/category/pages/category_page.dart';
import 'package:flutter_getx_news/features/presentation/news/controller/news_controller.dart';
import 'package:flutter_getx_news/features/presentation/news/pages/news_page.dart';
import 'package:flutter_getx_news/routes/router_name.dart';

import '../features/presentation/home/pages/home_page.dart';
import '../inject.dart' as di;

class AppPages {
  static final pages = [
    GetPage(name: RouteName.home, page: () => const HomePage()),
    GetPage(
        name: RouteName.categoryNews,
        page: () => CategoryPage(),
        binding: CategoryNewsBinding()),
    GetPage(
        name: RouteName.news, page: () => NewsPage(), binding: NewsBinding())
  ];
}

class CategoryNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryController(di.locator()));
  }
}

class NewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsController(di.locator()));
  }
}
