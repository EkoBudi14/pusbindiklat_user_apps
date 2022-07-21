// ignore_for_file: prefer_const_constructors_in_immutables

part of 'getevent_cubit.dart';

abstract class GeteventState extends Equatable {
  const GeteventState();

  @override
  List<Object> get props => [];
}

class GeteventInitial extends GeteventState {}

class GetEventLoaded extends GeteventState {
  final List<Event> events;

  GetEventLoaded(this.events);
  @override
  List<Object> get props => [events];
}

class GetEventLoadingFailed extends GeteventState {
  // final List<Event> oldEvent;
  // final bool isFirstFetchEvent;

  // GetEventLoading({this.oldEvent, this.isFirstFetchEvent});
  final String message;

  GetEventLoadingFailed({this.message});
  @override
  List<Object> get props => [message];
}
