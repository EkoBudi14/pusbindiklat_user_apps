// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:pusbindiklat_global/models/date_time.dart';
import 'package:pusbindiklat_global/models/event.dart';
import 'package:pusbindiklat_global/presentation/pages/detail_event.dart';
import 'package:pusbindiklat_global/styles/style.dart';

class EventCard extends StatelessWidget {
  final Event events;
  EventCard({this.events});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailEvent(
              eventss: events,
            ),
          ),
        );
      },
      child: Container(
        width: 400,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.20,
              blurRadius: 4,
              offset: Offset(1, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                image: DecorationImage(
                  image: (events.image == null)
                      ? AssetImage(
                          "assets/event_silat.jpeg",
                        )
                      : NetworkImage(events.image),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              events.name,
              style: primaryTextStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 3,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon(
                  //   Icons.calendar_month_outlined,
                  //   size: 20,
                  // ),
                  Text(
                    DateTimeUtils.formatCharMonthDateTime(events.dateEvent),
                    style: primaryTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
