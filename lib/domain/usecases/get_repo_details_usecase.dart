import 'package:dartz/dartz.dart';
import 'package:github_app/common/usecase.dart';
import 'package:github_app/data/model/repository_details.dart';
import 'package:github_app/domain/repository/search_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetRepositoryDetailsUsecase extends UseCase<RepositoryDetails, String> {
  GetRepositoryDetailsUsecase(this.repository);
  final SearchRepository repository;

  @override
  Future<Either<Exception, RepositoryDetails>> call(params) async {
    return await repository.getRepositoryDetails(params);
  }
}
