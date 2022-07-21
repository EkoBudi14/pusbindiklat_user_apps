// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pusbindiklat_global/models/event.dart';
import 'package:pusbindiklat_global/styles/style.dart';

class DetailEvent extends StatelessWidget {
  final Event eventss;
  DetailEvent({this.eventss});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Events",
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
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 400,
                child: InteractiveViewer(
                  // boundaryMargin: EdgeInsets.all(double.infinity),
                  minScale: 1,
                  maxScale: 4,
                  child: Image(
                    image: (eventss.image == null)
                        ? AssetImage(
                            "assets/event_silat.jpeg",
                          )
                        : NetworkImage(eventss.image),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
