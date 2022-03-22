import 'package:dartz/dartz.dart';
import 'package:github_app/data/model/repository_model.dart';

abstract class SearchRepository {
  Future<Either<Exception, List<RepositoryModel>>> searchForRepository(String query);
}
