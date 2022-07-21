// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, missing_return, avoid_unnecessary_containers, prefer_is_empty, avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pusbindiklat_global/cubit/getevent_cubit.dart';
import 'package:pusbindiklat_global/models/event.dart';
import 'package:pusbindiklat_global/models/model_event.dart';
import 'package:pusbindiklat_global/presentation/widgets/event_card.dart';
import 'package:pusbindiklat_global/styles/style.dart';

class EventPage extends StatefulWidget {
  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  // final scrollController = ScrollController();

  // void setupScrollController(context) {
  //   scrollController.addListener(() {
  //     if (scrollController.position.atEdge) {
  //       if (scrollController.position.pixels != 0) {
  //         BlocProvider.of<GeteventCubit>(context).getEvent();
  //         // context.read<GeteventCubit>().getEvent();
  //       }
  //     }
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    context.read<GeteventCubit>().getEvent();
    // BlocProvider.of<GeteventCubit>(context).getEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // setupScrollController(context);
    // BlocProvider.of<GeteventCubit>(context).getEvent();
    // bool click = false;

    // Widget _eventss(Event events, BuildContext context) {
    //   return Container(
    //     child: Column(
    //       // ignore: prefer_const_literals_to_create_immutables
    //       children: [
    //         Center(
    //           child: Text(events.name),
    //         ),
    //       ],
    //     ),
    //   );
    // }

    // Widget _getEvent() {
    //   return BlocBuilder<GeteventCubit, GeteventState>(
    //     // ignore: missing_return
    //     builder: (context, state) {
    //       if (state is GetEventLoading && state.isFirstFetchEvent) {
    //         return CircularProgressIndicator();
    //       }

    //       List<Event> events = [];
    //       bool isLoading = false;

    //       if (state is GetEventLoading) {
    //         events = state.oldEvent;
    //         isLoading = true;
    //       } else if (state is GetEventLoaded) {
    //         events = state.events;
    //       }

    //       return ListView.builder(
    //         controller: scrollController,
    //         itemCount: events.length + (isLoading ? 1 : 0),
    //         // ignore: missing_return
    //         itemBuilder: (context, index) {
    //           if (index < events.length) {
    //             return Container(
    //               margin: EdgeInsets.only(left: 30, right: 30, top: 30),
    //               child: EventCard(
    //                 events: events[index],
    //               ),
    //             );
    //           } else {
    //             Timer(Duration(milliseconds: 20), () {
    //               scrollController
    //                   .jumpTo(scrollController.position.maxScrollExtent);
    //             });
    //             return CircularProgressIndicator();
    //           }
    //         },
    //       );
    //     },
    //   );
    // }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Event",
          style: primaryTextStyle.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: BlocConsumer<GeteventCubit, GeteventState>(
        listener: (_, state) {
          if (state is GetEventLoaded) {
            print("Succes get event");
          } else if (state is GetEventLoadingFailed) {
            print("Gagal Get Event");
          }
        },
        // ignore: missing_return
        builder: (context, state) {
          if (state is GetEventLoaded) {
            if (state.events.length == 0) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              // List<Event> events = state.events;
              return RefreshIndicator(
                onRefresh: () async {
                  await context.read<GeteventCubit>().getEvent();
                  print("refresh");
                },
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  children: [
                    Column(
                      children: state.events
                          .map((e) => Container(
                              padding: EdgeInsets.only(
                                bottom: 20,
                                left: 30,
                                right: 30,
                                top: 20,
                              ),
                              child: Builder(builder: (_) {
                                return Container(
                                  child: EventCard(
                                    events: e,
                                  ),
                                );
                              })))
                          .toList(),
                    )
                  ],
                ),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
