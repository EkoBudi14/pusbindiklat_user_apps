import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pusbindiklat_global/models/api_return_value.dart';
import 'package:pusbindiklat_global/models/get_user.dart';
import 'package:pusbindiklat_global/services/getUser.dart';

part 'getuser_state.dart';

class GetuserCubit extends Cubit<GetuserState> {
  GetuserCubit() : super(GetuserInitial());

  Future<void> getUsers() async {
    ApiReturnValue<Data> result = await GetUserTs.getUser();

    if (result.value != null) {
      emit(GetUserloaded(getUser: result.value));
    } else {
      emit(GetUserLoadingFailed(result.message));
    }
  }
}
