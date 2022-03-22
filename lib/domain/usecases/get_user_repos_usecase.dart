import 'package:dartz/dartz.dart';
import 'package:github_app/common/usecase.dart';
import 'package:github_app/data/model/repository_model.dart';
import 'package:github_app/domain/repository/search_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserRepositoriesUsecase
    extends UseCase<List<RepositoryModel>, String> {
  GetUserRepositoriesUsecase(this.repository);
  final SearchRepository repository;

  @override
  Future<Either<Exception, List<RepositoryModel>>> call(params) async {
    return await repository.getUserRepositories(params);
  }
}
