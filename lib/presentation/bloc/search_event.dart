part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchForUsers extends SearchEvent {}

class SearchForRepository extends SearchEvent {
  final String name;
  final SortTypes sort;
  const SearchForRepository({
    required this.name,
    this.sort = SortTypes.none,
  });
  @override
  List<Object> get props => [name, sort];
}

class LoadMoreData extends SearchEvent {}

class SortExistingData extends SearchEvent {
  final SortTypes sort;
  const SortExistingData({
    required this.sort,
  });
  @override
  List<Object> get props => [sort];
}
