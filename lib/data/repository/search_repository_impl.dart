import 'package:github_app/data/datasource/search_datasource.dart';
import 'package:github_app/data/model/repository_details.dart';
import 'package:github_app/data/model/repository_model.dart';
import 'package:dartz/dartz.dart';
import 'package:github_app/data/model/user_details.dart';
import 'package:github_app/domain/repository/search_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: SearchRepository)
class SearchRepositoryImpl implements SearchRepository {
  SearchDatasource searchDatasource;
  SearchRepositoryImpl({
    required this.searchDatasource,
  });

  @override
  Future<Either<Exception, List<RepositoryModel>>> searchForRepository(
      String query) async {
    try {
      return Right(await searchDatasource.searchForRepository(query));
    } catch (e) {
      return Left(Exception());
    }
  }

  @override
  Future<Either<Exception, RepositoryDetails>> getRepositoryDetails(
      String query) async {
    try {
      return Right(await searchDatasource.getRepositoryDetails(query));
    } catch (e) {
      return Left(Exception());
    }
  }

  @override
  Future<Either<Exception, UserDetails>> getUserDetails(String query) async {
    try {
      return Right(await searchDatasource.getUserDetails(query));
    } catch (e) {
      return Left(Exception());
    }
  }

  @override
  Future<Either<Exception, List<RepositoryModel>>> getUserRepositories(
      String query) async {
    try {
      return Right(await searchDatasource.getUserRepositories(query));
    } catch (e) {
      return Left(Exception());
    }
  }
}
