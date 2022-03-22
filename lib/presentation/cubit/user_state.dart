part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserDetailsError extends UserState {}

class UserDetailsLoading extends UserState {}

class UserDetailsFinished extends UserState {
  final UserDetails userDetails;
  const UserDetailsFinished({
    required this.userDetails,
  });
  @override
  List<Object> get props => [userDetails.createdAt];
}
