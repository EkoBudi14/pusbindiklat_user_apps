import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:pusbindiklat_global/models/api_return_value.dart';
import 'package:pusbindiklat_global/models/event.dart';
import 'package:pusbindiklat_global/models/model_event.dart';
import 'package:pusbindiklat_global/services/get_event_silat.dart';

part 'getevent_state.dart';

class GeteventCubit extends Cubit<GeteventState> {
  GeteventCubit() : super(GeteventInitial());

  // final GetEventSilat getEventSilat;

  // int page = 1;
  // void getEvent() async {
  //   // ApiReturnValue<List<Event>> result = GetEventSilat.getEvent(page);
  //   if (state is GetEventLoading) return;
  //   final currentState = state;
  //   var oldEvent = <Event>[];
  //   if (currentState is GetEventLoaded) {
  //     oldEvent = currentState.events;
  //   }

  //   emit(GetEventLoading(oldEvent: oldEvent, isFirstFetchEvent: page == 1));

  //   getEventSilat.getEvent(page).then((newEvent) {
  //     page++;

  //     final result = (state as GetEventLoading).oldEvent;
  //     result.addAll(newEvent);

  //     emit(GetEventLoaded(result));
  //   });
  // }
  Future<void> getEvent() async {
    ApiReturnValue<List<Event>> result = await GetEventSilat.getEvent();

    if (result.value != null) {
      emit(GetEventLoaded(result.value));
    } else {
      emit(GetEventLoadingFailed(message: result.message));
    }
  }
}
