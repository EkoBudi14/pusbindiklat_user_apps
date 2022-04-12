import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pusbindiklat_global/models/api_return_value.dart';
import 'package:pusbindiklat_global/models/user_login.dart';
import 'package:pusbindiklat_global/services/auth_services.dart';

part 'userauth_state.dart';

class UserauthCubit extends Cubit<UserauthState> {
  UserauthCubit() : super(UserauthInitial());

  Future<void> signIn(String email, String password) async {
    ApiReturnValue<User> result = await AuthServices.signIn(email, password);

    if (result.value != null) {
      emit(Userloaded(user: result.value));
    } else {
      emit(UserLoadingFailed(result.message));
    }
  }

  Future<void> signUp(User user, String password) async {
    ApiReturnValue<User> result = await AuthServices.signUpUser(user, password);

    if (result.value != null) {
      emit(Userloaded(user: result.value));
    } else {
      emit(UserLoadingFailed(result.message));
    }
  }

  Future<void> signOut() async {
    ApiReturnValue<bool> result = await AuthServices.signOut();

    if (result.value != null) {
      emit(UserauthInitial());
    } else {
      emit(UserLoadingFailed(result.message));
    }
  }
}
