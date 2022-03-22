import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_app/data/model/user_details.dart';
import 'package:github_app/domain/usecases/get_user_details_usecase.dart';
import 'package:github_app/injection/injection.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  late UserDetails userDetails;
  Future<void> getUserDetails(String owner) async {
    var either = await getIt<GetUserDetailsUsecase>().call(owner);
    if (either.isRight()) {
      either.fold((l) => null, (r) => userDetails = r);
      emit(UserDetailsFinished(userDetails: userDetails));
    } else {
      emit(UserDetailsError());
    }
  }
}
