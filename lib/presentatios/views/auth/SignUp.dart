import 'package:app_fixed/core/constants/strings.dart';
import 'package:app_fixed/presentatios/widget/custom_textField.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(SignUp());
}

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  bool isObscure = true;
  bool? checkbox = false;
  bool isObscure2 = true;

  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Widget checkBox() {
    return Container(
      child: CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        value: checkbox,
        onChanged: (val) {
          setState(() {
            checkbox = val;
          });
        },
        title: Text(
          " I agree to the Trems&condtion and privacy polic",
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget elevatedButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (formkey.currentState!.validate()) {
            setState(() {
              fullname.clear();
              email.clear();
              password.clear();
              confirmpassword.clear();
            });
          }
        },
        child: const Text("Sign Up"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /////////////////////////////appPar////////////////////////////////////
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFF5F5F7),
        toolbarHeight: 80,
        leading: IconButton(
          padding: EdgeInsets.only(left: 5),
          alignment: Alignment.topLeft,
          onPressed: () {
            Navigator.pushNamed(context, loginScreen);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          'LuxeShop',
          style: TextTheme.of(context).headlineLarge,
          textAlign: TextAlign.center,
        ),
      ),
      //////////////////////////////////body///////////////////
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
                      SizedBox(height: 20),
                      Text(
                        " Create Account ",
                        style: Theme.of(context).textTheme.headlineLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Sign up to get  started',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      /////////////////////////////TextFormFields/////////////////////
                      CustomTextfield(
                        hintText: 'Full Name',
                        controller: fullname,
                        validator: (v) =>
                            v!.isEmpty ? 'fullname is required' : null,
                      ),
                      SizedBox(height: 20),
                      CustomTextfield(
                        hintText: 'Email',
                        controller: email,
                        validator: (v) =>
                            v!.isEmpty ? 'Email is required' : null,
                      ),

                      SizedBox(height: 20),
                      CustomTextfield(
                        hintText: 'Password',
                        controller: password,
                        isobscure: isObscure,
                        validator: (v) =>
                            v!.length < 6 ? 'password is too short ' : null,
                        onSuffixpressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      CustomTextfield(
                        hintText: ' Confirm Password',
                        controller: confirmpassword,
                        isobscure: isObscure2,
                        validator: (v) =>
                            v!.length < 6 ? 'password is too short ' : null,
                        onSuffixpressed: () {
                          setState(() {
                            isObscure2 = !isObscure2;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    checkBox(),
                    SizedBox(height: 10),

                    elevatedButton(),
                    SizedBox(height: 30),

                    Container(
                      alignment: Alignment.center,
                      child: InkWell(
                        child: Text(
                          "Aleardy have an account? Login",
                          style: TextTheme.of(context).bodyMedium,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, loginScreen);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
