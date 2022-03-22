import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_app/data/model/repository_details.dart';
import 'package:github_app/domain/usecases/get_repo_details_usecase.dart';
import 'package:github_app/injection/injection.dart';

part 'repo_state.dart';

class RepoCubit extends Cubit<RepoState> {
  RepoCubit() : super(RepoInitial());
  late RepositoryDetails repositoryDetails;

  Future<void> getRepoDetails(String owner, String repo) async {
    var either =
        await getIt<GetRepositoryDetailsUsecase>().call(owner + '/' + repo);
    if (either.isRight()) {
      either.fold((l) => null, (r) => repositoryDetails = r);
      emit(RepoDetailsFinished(repositoryDetails: repositoryDetails));
    } else {
      emit(RepoDetailsError());
    }
  }
}
