import 'package:get_it/get_it.dart';
import 'package:flutter_getx_news/features/data/datasource/news_remote_data.dart';
import 'package:flutter_getx_news/features/data/repositories/news_repository_implementation.dart';
import 'package:flutter_getx_news/features/domain/repositories/news_repository.dart';
import 'package:flutter_getx_news/features/domain/usecase/get_news.dart';
import 'package:flutter_getx_news/features/domain/usecase/get_news_category.dart';
import 'package:flutter_getx_news/features/presentation/category/controller/category_controller.dart';
import 'package:flutter_getx_news/features/presentation/news/controller/news_controller.dart';

final locator = GetIt.instance;

void init() {
  //getx state
  locator.registerFactory(() => CategoryController(locator()));
  locator.registerFactory(() => NewsController(locator()));

  //use case
  locator.registerFactory(() => GetNewsCategory(locator()));
  locator.registerFactory(() => GetNews(locator()));

  //data source
  locator.registerFactory(() => NewsRemoteDateImpl());

  //repo
  locator.registerFactory<NewsRepository>(() => NewsRepositoryImpl(locator()));
}
