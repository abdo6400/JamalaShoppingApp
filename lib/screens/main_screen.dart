import 'package:flutter/material.dart';
import '../constant.dart';
import '../services/api.dart';
import '../models/models.dart';
import '../providers/providers.dart';
import '../widgets/widgets.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:search_page/search_page.dart';
import '../animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'category_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _pageController = PageController(initialPage: 0);

  int _currentPage = 0;
  List<String> images = [
    'assets/images/section.png',
    'assets/images/section.png',
    'assets/images/section.png'
  ];

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
    return FutureBuilder(
        future: Provider.of<CategoryProvider>(context, listen: false)
            .getCategories(),
        builder: (ctx, snp) {
          /* if (snp.connectionState == ConnectionState.waiting){
            return const progressDialog(mssage: "Loading . . .");
          }
          else {*/
          return Container(
            height: size.height,
            width: size.width,
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
            child: ListView(
              children: [
                TextButton(onPressed: (){
                    //Api_functions.postRequest(Constant.apiLinkFirestore+"/databases/(default)/documents/products/:commit/product");
                    //Api_functions.getRequest(Constant.apiLinkFirestore+"/databases/(default)/documents/sections/:commit/section");
                  }, child: Icon(Icons.explicit)),
                Column(
                  children: [
                    Container(
                      child: Card(
                        color: Colors.blueAccent.shade700,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "عروض خاصه",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              Icon(
                                Icons.note,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        viewportFraction: 0.8,
                        height: size.height*0.22,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 400),
                      ),
                      items: images.map((sliderPhoto) {
                        return Builder(builder: (BuildContext context) {
                          return InkWell(
                            onTap: () {
                              Provider.of<PageStateManager>(context, listen: false)
                                  .setitemdetial(true);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.blueAccent.shade700),
                                  image: DecorationImage(
                                      image: AssetImage(
                                        sliderPhoto.toString(),
                                      ),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          );
                        });
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                CategoryScreen(),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Column(
                  children: [
                    Container(
                        child: Card(
                          color: Colors.blueAccent.shade700,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "الاكثر مبيعا",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            SizedBox(
                              width: size.width * 0.03,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                          ],
                        ),
                      ),
                    )),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    ItemSection(),
                  ],
                )
              ],
            ),
          );
          //}
        });
  }
}
