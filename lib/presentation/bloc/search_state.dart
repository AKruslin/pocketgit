part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchFinished extends SearchState {
  final UniqueKey key;
  final List<RepositoryModel> searchList;
  const SearchFinished(this.key, this.searchList);
  @override
  List<Object> get props => [key, searchList];
}

class SearchLoading extends SearchState {}