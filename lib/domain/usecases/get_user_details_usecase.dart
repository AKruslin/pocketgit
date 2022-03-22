import 'package:dartz/dartz.dart';
import 'package:github_app/common/usecase.dart';
import 'package:github_app/data/model/user_details.dart';
import 'package:github_app/domain/repository/search_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserDetailsUsecase extends UseCase<UserDetails, String> {
  GetUserDetailsUsecase(this.repository);
  final SearchRepository repository;

  @override
  Future<Either<Exception, UserDetails>> call(params) async {
    return await repository.getUserDetails(params);
  }
}
