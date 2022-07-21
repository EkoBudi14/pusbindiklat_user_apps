// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:pusbindiklat_global/cubit/getevent_cubit.dart';
import 'package:pusbindiklat_global/cubit/getuser_cubit.dart';
import 'package:pusbindiklat_global/cubit/userauth_cubit.dart';

import 'package:pusbindiklat_global/presentation/pages/splash_screen.dart';
import 'package:pusbindiklat_global/services/get_event_silat.dart';

void main() {
  runApp(MyApp(
    getEventSilat: GetEventSilat(),
  ));
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  final GetEventSilat getEventSilat;
  MyApp({this.getEventSilat});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetuserCubit()),
        BlocProvider(create: (_) => UserauthCubit()),
        BlocProvider(create: (_) => GeteventCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
