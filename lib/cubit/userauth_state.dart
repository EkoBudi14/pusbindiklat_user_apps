// ignore_for_file: override_on_non_overriding_member

part of 'userauth_cubit.dart';

abstract class UserauthState extends Equatable {
  const UserauthState();

  @override
  List<Object> get props => [];
}

class UserauthInitial extends UserauthState {}

class Userloaded extends UserauthState {
  final User user;

  Userloaded(this.user);
  @override
  List<Object> get props => [user];
}

class UserLoadingFailed extends UserauthState {
  final String message;
  UserLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
