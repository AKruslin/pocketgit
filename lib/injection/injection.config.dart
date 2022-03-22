// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/datasource/search_datasource.dart' as _i3;
import '../data/repository/search_repository_impl.dart' as _i5;
import '../domain/repository/search_repository.dart' as _i4;
import '../domain/usecases/get_repo_details_usecase.dart' as _i6;
import '../domain/usecases/get_user_details_usecase.dart' as _i7;
import '../domain/usecases/search_for_repository_usecase.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.SearchDatasource>(() => _i3.SearchDatasourceImpl());
  gh.singleton<_i4.SearchRepository>(
      _i5.SearchRepositoryImpl(searchDatasource: get<_i3.SearchDatasource>()));
  gh.lazySingleton<_i6.GetRepositoryDetailsUsecase>(
      () => _i6.GetRepositoryDetailsUsecase(get<_i4.SearchRepository>()));
  gh.lazySingleton<_i7.GetUserDetailsUsecase>(
      () => _i7.GetUserDetailsUsecase(get<_i4.SearchRepository>()));
  gh.lazySingleton<_i8.SearchForRepositoryUsecase>(
      () => _i8.SearchForRepositoryUsecase(get<_i4.SearchRepository>()));
  return get;
}
