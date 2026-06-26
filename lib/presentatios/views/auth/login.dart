import 'package:app_fixed/Business_logic/cubit/login_cupit/login_cupit_cubit.dart';
import 'package:app_fixed/core/them/app_them.dart';
import 'package:app_fixed/core/constants/strings.dart';
import 'package:app_fixed/presentatios/widget/custom_textField.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  bool isObscure = true;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Widget welcomeText() {
    return Text(
      " Welcome Back! ",
      style: Theme.of(context).textTheme.headlineLarge,
      textAlign: TextAlign.center,
    );
  }

  Widget signInText() {
    return Text(
      'sign in your account',
      style: Theme.of(context).textTheme.bodyMedium,
      textAlign: TextAlign.center,
    );
  }

  Widget inkwellForgetPass() {
    return Container(
      alignment: Alignment.centerRight,
      child: InkWell(
        child: Text(
          "Forget Password?",
          style: TextTheme.of(context).bodyMedium,
        ),
        onTap: () {
          Navigator.pushNamed(context, forgetScreen);
        },
      ),
    );
  }

  Widget buttonIcons() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.facebook)),
          IconButton(onPressed: () {}, icon: Icon(Icons.apple_rounded)),
          IconButton(onPressed: () {}, icon: Icon(Icons.g_mobiledata_sharp)),
        ],
      ),
    );
  }

  Widget buildBlocConsumer() {
    return BlocConsumer<LoginCupitCubit, LoginCupitState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushReplacementNamed(context, homeScreen);
        } else if (state is LoginError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error), backgroundColor: Colors.blue),
          );
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return Center(
            child: CircularProgressIndicator(color: AppTheme.primaryBlack),
          );
        }
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (formkey.currentState!.validate()) {
                context.read<LoginCupitCubit>().login(
                  {
                    "username": username.text.trim(),
                    'password': password.text.trim(),
                  },
                  // trim to delet space
                );
              }
            },
            child: const Text("Login", style: TextStyle(color: Colors.black)),
          ),
        );
      },
    );
  }

  Widget inkwellSignUp() {
    return Container(
      alignment: Alignment.center,
      child: InkWell(
        child: Text(
          "Don't have an account? SignUp",
          style: TextTheme.of(context).bodyMedium,
        ),
        onTap: () {
          Navigator.pushNamed(context, signScreen);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFF5F5F7),
        toolbarHeight: 100,
        leading: IconButton(
          padding: EdgeInsets.only(left: 5),
          alignment: Alignment.topLeft,
          onPressed: () {
            Navigator.pushReplacementNamed(context, onboarding);
          },

          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          'LuxeShop',
          style: TextTheme.of(context).headlineLarge,
          textAlign: TextAlign.center,
        ),
      ),
      ///////////////////////////////////////////////////
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
                      welcomeText(),
                      const SizedBox(height: 10),
                      signInText(),
                      SizedBox(height: 40),
                      /////////////
                      CustomTextfield(
                        controller: username,
                        hintText: "username .. ",
                        validator: (value) =>
                            value!.isEmpty ? '  username is requierd' : null,
                      ),

                      SizedBox(height: 20),
                      CustomTextfield(
                        controller: password,
                        hintText: 'password ..',
                        isobscure: isObscure,
                        onSuffixpressed: () {
                          setState(() => isObscure = !isObscure);
                        },
                        validator: (value) =>
                            value!.length < 6 ? " It's too short " : null,
                      ),
                      SizedBox(height: 15),
                      ///////////////
                      inkwellForgetPass(),
                    ],
                  ),
                ),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildBlocConsumer(),

                    SizedBox(height: 20),

                    Center(
                      child: Container(
                        child: Text(
                          "Or sign in with ",
                          style: TextTheme.of(context).bodyMedium,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),

                    buttonIcons(),
                    SizedBox(height: 15),
                    inkwellSignUp(),
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
