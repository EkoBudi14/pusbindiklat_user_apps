// ignore_for_file: use_key_in_widget_constructors, unused_field, prefer_final_fields, unused_element, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pusbindiklat_global/cubit/userauth_cubit.dart';
import 'package:pusbindiklat_global/models/user_login.dart';
import 'package:pusbindiklat_global/presentation/pages/main_page.dart';
import 'package:pusbindiklat_global/providers/auth_provider.dart';
import 'package:pusbindiklat_global/styles/style.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameUserController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController noTelpController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController borndayController = TextEditingController();

  bool isSignIn = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // AuthProvider authProvider = Provider.of<AuthProvider>(context);

    // void handleSignUp() async {
    //   setState(() {
    //     isLoading = true;
    //   });

    //   if (await authProvider.signUp(
    //     emailController.text,
    //     fullnameController.text,
    //     passwordController.text,
    //     addressController.text,
    //     borndayController.text,
    //   )) {
    //     Navigator.pushAndRemoveUntil(context,
    //         MaterialPageRoute(builder: (_) => MainPage()), (route) => false);
    //   } else {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         backgroundColor: Colors.red,
    //         content: Text(
    //           'Gagal Sign Up!',
    //           textAlign: TextAlign.center,
    //         ),
    //       ),
    //     );
    //   }

    //   setState(() {
    //     isLoading = false;
    //   });
    // }

    Widget fullNameInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nama Lengkap",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Color(0xffE1E1E1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: primaryColor,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: fullnameController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Harus Diisi';
                          }
                          return null;
                        },
                        decoration: InputDecoration.collapsed(
                          hintText: 'Masukan Nama Lengkap Anda',
                          hintStyle: primaryTextStyle.copyWith(
                            fontSize: 14,
                            color: Color(0xffA39C9C),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget address() {
      return Container(
        margin: EdgeInsets.only(
          top: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Alamat Lengkap",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Color(0xffE1E1E1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_username.png',
                      width: 20,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: addressController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Harus Diisi';
                          }
                          return null;
                        },
                        decoration: InputDecoration.collapsed(
                          hintText: 'Masukan alamat lengkap anda',
                          hintStyle: primaryTextStyle.copyWith(
                            fontSize: 14,
                            color: Color(0xffA39C9C),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Color(0xffE1E1E1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: primaryColor,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: emailController,
                        key: ValueKey('email'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Harus Diisi';
                          }
                          return null;
                        },
                        decoration: InputDecoration.collapsed(
                          hintText: 'Masukan Email Anda',
                          hintStyle: primaryTextStyle.copyWith(
                            fontSize: 14,
                            color: Color(0xffA39C9C),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget btnSignUp() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: TextButton(
          onPressed: () async {
            setState(() {
              isLoading = true;
            });

            await context.read<UserauthCubit>().signUp(
                  User(
                    email: emailController.text,
                    alamat: addressController.text,
                    tanggalLahir: borndayController.text,
                    namaLengkap: fullnameController.text,
                  ),
                  passwordController.text,
                );

            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => MainPage()),
                (route) => false);

            setState(() {
              isLoading = false;
            });
          },
          style: TextButton.styleFrom(
              backgroundColor: Color(0xFF01122B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )),
          child: Text(
            "Masuk",
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Password",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Color(0xffE1E1E1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.lock,
                      color: primaryColor,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: passwordController,
                        key: ValueKey('password'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Harus Diisi';
                          }
                          return null;
                        },
                        decoration: InputDecoration.collapsed(
                          hintText: 'Masukan Password Anda',
                          hintStyle: primaryTextStyle.copyWith(
                            fontSize: 14,
                            color: Color(0xffA39C9C),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget bornDay() {
      return Container(
        margin: EdgeInsets.only(
          top: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tanggal Lahir",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Color(0xffE1E1E1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.date_range,
                      color: Color(0xffB12341),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: borndayController,
                        key: ValueKey('password'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Harus Diisi';
                          }
                          return null;
                        },
                        decoration: InputDecoration.collapsed(
                          hintText: 'Masukan tanggal lahir',
                          hintStyle: primaryTextStyle.copyWith(
                            fontSize: 14,
                            color: Color(0xffA39C9C),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    header() {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Silahkan Isi Data Anda",
          style: primaryTextStyle.copyWith(
            color: Colors.black,
            fontWeight: bold,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: header(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Column(
            children: [
              fullNameInput(),
              address(),
              bornDay(),
              emailInput(),
              passwordInput(),
              btnSignUp(),
            ],
          ),
        ),
      ),
    );
  }
}
