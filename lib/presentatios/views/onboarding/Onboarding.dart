import 'package:app_fixed/core/constants/strings.dart';
import 'package:app_fixed/presentatios/views/onboarding/CustomOnboarding.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:app_fixed/core/them/app_them.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController pageController = PageController();
  double numbage = 0;
  final List onboardingdata = [
    {
      'image': 'images/woman.png',
      "title": "Discover Timeless Style",
      'subtitle': "shop exclusive luxury accessorise and fashion",
    },
    {
      'image': 'images/handbags.png',
      "title": "Uncompromising Quality",
      'subtitle':
          "Each piece is selected for premium materials and craftmanship",
    },
    {
      'image': 'images/watch.png',
      "title": "Seamless Shopping Experince",
      'subtitle':
          "Enjoy curated delivery and a world class customer experirnce",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // الـ Stack شايل عنصرين أساسيين فوق بعض
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: onboardingdata.length,
            itemBuilder: (context, index) {
              return Customonboarding(
                image: onboardingdata[index]['image'],
                title: onboardingdata[index]['title'],
                subtitle: onboardingdata[index]['subtitle'],
              );
            },
            onPageChanged: (value) {
              setState(() {
                numbage = value.toDouble();
              });
            },
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(right: 40, left: 40, bottom: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // بياخد مساحة محتوياته بس
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DotsIndicator(
                          dotsCount: onboardingdata.length,
                          position: numbage,
                          decorator: DotsDecorator(
                            activeColor: AppTheme.primaryBlack,
                            color: Colors.grey,
                            size: const Size.square(9.0),
                            activeSize: const Size(18.0, 9.0),
                            activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          pageController.page == 2
                              ? Navigator.pushReplacementNamed(
                                  context,
                                  loginScreen,
                                )
                              : pageController.nextPage(
                                  duration: Duration(seconds: 2),
                                  curve: Curves.decelerate,
                                );
                        },
                        child: const Text("Next"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
