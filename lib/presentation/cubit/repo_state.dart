part of 'repo_cubit.dart';

abstract class RepoState extends Equatable {
  const RepoState();

  @override
  List<Object> get props => [];
}

class RepoInitial extends RepoState {}

class RepoDetailsLoading extends RepoState {}

class RepoDetailsError extends RepoState {}

class RepoDetailsFinished extends RepoState {
  final RepositoryDetails repositoryDetails;
  const RepoDetailsFinished({
    required this.repositoryDetails,
  });
  @override
  List<Object> get props => [repositoryDetails.browserUrl];
}
