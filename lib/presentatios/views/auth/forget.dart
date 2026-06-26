// import 'package:app_fixed/core/them/app_them.dart';
import 'package:app_fixed/core/constants/strings.dart';
import 'package:app_fixed/presentatios/widget/custom_textField.dart';

import 'package:flutter/material.dart';

class Forget extends StatefulWidget {
  const Forget({super.key});

  @override
  State<Forget> createState() => _Forget();
}

class _Forget extends State<Forget> {
  bool isObscure = true;
  TextEditingController email = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Widget inkwellToLogin() {
    return Container(
      alignment: Alignment.center,
      child: InkWell(
        child: Text("Back to Login", style: TextTheme.of(context).bodyMedium),
        onTap: () {
          Navigator.pushNamed(context, loginScreen);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFF5F5F7),
        toolbarHeight: 100,
        leading: IconButton(
          padding: EdgeInsets.only(left: 5),
          alignment: Alignment.topLeft,
          onPressed: () {
            Navigator.of(context).pushNamed(loginScreen);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          'LuxeShop',
          style: TextTheme.of(context).headlineLarge,
          textAlign: TextAlign.center,
        ),
      ),

      body: Form(
        key: formkey,
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),

                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 40),
                      Text(
                        " Forget password",
                        style: Theme.of(context).textTheme.headlineLarge,
                        textAlign: TextAlign.center,
                      ),

                      Center(
                        child: Icon(
                          Icons.mark_email_read_rounded,
                          size: 120,
                          color: Colors.blue.shade200,
                        ),
                      ),

                      const SizedBox(height: 10),
                      Text(
                        "enter your email eddress and we'll send you a link to reset yur passwor  ",
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 60),

                      CustomTextfield(
                        hintText: 'Email',
                        controller: email,
                        validator: (value) =>
                            value!.isEmpty ? 'email is required' : null,
                        isobscure: isObscure,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),

              Align(
                alignment: Alignment.bottomCenter,

                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 20,
                  ),

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // String userEmail = email.text;
                            if (formkey.currentState!.validate()) {
                              setState(() {
                                email.clear();
                              });
                            }
                          },

                          child: const Text("Send reset Link "),
                        ),
                      ),
                      SizedBox(height: 30),

                      inkwellToLogin(),
                    ],
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
