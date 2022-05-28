import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../jamala_pages.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../models/models.dart';

class OnboardingScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      child: const OnboardingScreen(),
      name: jamalapages.onboardingPage,
      key: ValueKey(jamalapages.onboardingPage),
    );
  }

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(seconds: 1),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.7, child: buildPages()),
              Column(
                children: const [
                  Text(
                    "مرحبا بك في جمله",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              buildIndicator(),
              SizedBox(
                height: size.height * 0.02,
              ),
              SizedBox(
                height: size.height / 15,
                width: size.width / 4.80,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue.shade700),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
                  ),
                  onPressed: () {
                    Provider.of<AppStateManager>(context, listen: false).boardingcompleted();
                    Provider.of<AppStateManager>(context, listen: false)
                        .completeOnboarding();
                  },
                  child: const Center(
                      child: Icon(Icons.arrow_forward_sharp, size: 28)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPages() {
    final size = MediaQuery.of(context).size;
    return PageView(
      controller: _pageController,
      children: [
        buildPage(
            SvgPicture.asset(
              "assets/images/img1.svg",
              allowDrawingOutsideViewBox: true,
              height: size.height * 0.3,
              width: size.width,
            ),
            "منتجات عالية الجوده",
            " بسعر الجمله",
            ""),
        buildPage(
            SvgPicture.asset(
              "assets/images/img3.svg",
              allowDrawingOutsideViewBox: true,
              height: size.height * 0.3,
              width: size.width,
            ),
            "تسوق بشكل سريع وسهل",
            "",
            ""),
        buildPage(
            SvgPicture.asset(
              "assets/images/img2.svg",
              allowDrawingOutsideViewBox: true,
              height: size.height * 0.3,
              width: size.width,
            ),
            "التوصيل الي اي مكان",
            "",
            ""),
      ],
    );
  }

  Widget buildPage(imageProvider, String text1, String text2, String text3) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imageProvider,
          SizedBox(
            height: size.height * 0.04,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text1,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: size.height * 0.04),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                text2,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: size.height * 0.04),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                text3,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: size.height * 0.04),
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildIndicator() {
    return SmoothPageIndicator(
      controller: _pageController,
      count: 3,
      effect: const WormEffect(
          activeDotColor: Colors.grey, dotHeight: 4, dotWidth: 5),
    );
  }
}
