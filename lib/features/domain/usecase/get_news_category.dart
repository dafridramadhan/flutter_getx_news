import 'package:dartz/dartz.dart';
import 'package:flutter_getx_news/common/failure.dart';
import 'package:flutter_getx_news/features/domain/entities/news_category_entity.dart';
import 'package:flutter_getx_news/features/domain/repositories/news_repository.dart';

class GetNewsCategory {
  final NewsRepository repository;
  GetNewsCategory(this.repository);
  Future<Either<Failure, List<NewsCategoryEntity>>> execute(String query) {
    return repository.getNewsCategory(query);
  }
}
