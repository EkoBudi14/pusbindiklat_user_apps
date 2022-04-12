part of 'getuser_cubit.dart';

abstract class GetuserState extends Equatable {
  const GetuserState();

  @override
  List<Object> get props => [];
}

class GetuserInitial extends GetuserState {}

class GetUserloaded extends GetuserState {
  final Data getUser;

  GetUserloaded({this.getUser});
  @override
  List<Object> get props => [getUser];
}

class GetUserLoadingFailed extends GetuserState {
  final String message;
  GetUserLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
