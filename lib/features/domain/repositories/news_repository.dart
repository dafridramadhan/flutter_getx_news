import 'package:dartz/dartz.dart';
import 'package:flutter_getx_news/common/failure.dart';
import 'package:flutter_getx_news/features/domain/entities/news_category_entity.dart';
import 'package:flutter_getx_news/features/domain/entities/news_entity.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<NewsCategoryEntity>>> getNewsCategory(
      String query);
  Future<Either<Failure, List<NewsEntity>>> getNews(String query);
}
