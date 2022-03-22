part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchFinished extends SearchState {
  final List<RepositoryModel> searchList;
  const SearchFinished(this.searchList);
  @override
  List<Object> get props => [searchList];
}

class SearchLoading extends SearchState {}
