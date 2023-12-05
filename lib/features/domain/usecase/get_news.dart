import 'package:dartz/dartz.dart';
import 'package:flutter_getx_news/common/failure.dart';
import 'package:flutter_getx_news/features/domain/entities/news_entity.dart';
import 'package:flutter_getx_news/features/domain/repositories/news_repository.dart';

class GetNews {
  final NewsRepository repository;
  GetNews(this.repository);
  Future<Either<Failure, List<NewsEntity>>> execute(String query) {
    return repository.getNews(query);
  }
}
