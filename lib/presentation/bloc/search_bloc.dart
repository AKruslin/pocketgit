import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:github_app/common/c.dart';
import 'package:github_app/data/model/repository_model.dart';
import 'package:github_app/domain/usecases/search_for_repository_usecase.dart';
import '../../injection/injection.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  List<RepositoryModel> listOfSearchRepositories = [];
  SortTypes sortType = SortTypes.none;

  SearchBloc() : super(SearchInitial()) {
    on<SortExistingData>((event, emit) {
      if (listOfSearchRepositories.isNotEmpty) {
        sortListOfRepositories(event.sort);
        emit(SearchFinished(UniqueKey(), listOfSearchRepositories));
      }
    });
    on<SearchForRepository>((event, emit) async {
      emit(SearchLoading());
      String query = getSortQuery(event.sort);
      query += 'q=${event.name}';
      var either = await getIt<SearchForRepositoryUsecase>().call(query);
      if (either.isRight()) {
        either.fold((l) => null, (r) => listOfSearchRepositories = r);
        emit(SearchFinished(UniqueKey(), listOfSearchRepositories));
      } else {
        print('Left');
      }
    });
  }

  void sortListOfRepositories(SortTypes type) {
    switch (type) {
      case SortTypes.mostStars:
        listOfSearchRepositories
            .sort((a, b) => b.numberOfStars.compareTo(a.numberOfStars));
        break;
      case SortTypes.mostForks:
        listOfSearchRepositories
            .sort((a, b) => b.numberOfForks.compareTo(a.numberOfForks));
        break;
      case SortTypes.mostUpdated:
        listOfSearchRepositories
            .sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
        break;
      default:
        break;
    }
  }

  String getSortQuery(SortTypes sortType) {
    String query = '';
    switch (sortType) {
      case SortTypes.mostForks:
        sortType = SortTypes.mostForks;
        query = 'order=desc&sort=forks&';
        break;
      case SortTypes.mostStars:
        sortType = SortTypes.mostStars;
        query = 'order=desc&sort=stars&';
        break;
      case SortTypes.mostUpdated:
        sortType = SortTypes.mostUpdated;
        query = 'order=desc&sort=updated&';
        break;
      default:
        sortType = SortTypes.none;
        query = '';
    }
    return query;
  }
}
