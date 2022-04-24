// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pusbindiklat_global/presentation/widgets/event_card.dart';
import 'package:pusbindiklat_global/styles/style.dart';

class EventPage extends StatefulWidget {
  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    bool click = false;

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
      body: Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Column(
          children: [
            Row(
              children: [
                EventCard(),
                SizedBox(
                  width: 20,
                ),
                EventCard(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
