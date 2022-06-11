import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamalashoppingapp/providers/datamodels/product.dart';
import 'package:jamalashoppingapp/providers/sectionprovider.dart';
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Container(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Container(
                height: size.height * 0.1,
                width: size.width,
                child: Stack(children: [
                  Container(
                    width: size.width,
                    height: size.height * 0.08,
                    padding: EdgeInsets.only(top: size.height * 0.015),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "J",
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.secondary)),
                        TextSpan(
                          text: "A",
                        ),
                        TextSpan(
                            text: "M",
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.secondary)),
                        TextSpan(
                          text: "A",
                        ),
                        TextSpan(
                            text: "L",
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.secondary)),
                        TextSpan(
                          text: "A",
                        ),
                      ]),
                    ),
                    alignment: Alignment.topCenter,
                  ),
                  Positioned(
                      top: size.height * 0.035,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () => showSearch(
                            context: context,
                            delegate: SearchPage<Product>(
                                items: Provider.of<SectionProvider>(context,
                                        listen: false)
                                    .getallproduct(),
                                searchLabel: 'Search products',
                                suggestion: Container(
                                  height: size.height,
                                  width: size.width,
                                  child: const Center(
                                    child: Text(
                                      'search about products by name',
                                    ),
                                  ),
                                ),
                                failure: const Center(
                                  child: Text(
                                    'No products found :(',
                                  ),
                                ),
                                filter: (prod) => [
                                      prod.name,
                                      prod.id.toString(),
                                    ],
                                builder: (prod) => Container(
                                      height: size.height,
                                      width: size.width,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.01),
                                      child: GridView.builder(
                                          itemCount: images.length,
                                          padding: EdgeInsets.all(15),
                                          gridDelegate:
                                              SliverGridDelegateWithMaxCrossAxisExtent(
                                            maxCrossAxisExtent:
                                                size.width * 0.42,
                                            childAspectRatio: 2 / 3,
                                            crossAxisSpacing: 15,
                                            mainAxisSpacing: 15,
                                          ),
                                          itemBuilder: (ctx, index) {
                                            return Item(
                                              name: prod.name,
                                              image_url: prod.image,
                                              price: prod.price.toString(),
                                            );
                                          }),
                                    ))),
                        child: Container(
                            width: size.width,
                            height: size.height * 0.05,
                            child: Card(
                                elevation: 2.0,
                                shadowColor:
                                    Theme.of(context).colorScheme.primary,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                margin: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.07,
                                    vertical: size.height * 0.01),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.03,
                                      vertical: size.height * 0.01),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.search,
                                        color: Colors.grey.shade700,
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      Text(
                                        "search product",
                                        style: TextStyle(
                                            color: Colors.grey.shade400),
                                      )
                                    ],
                                  ),
                                ))),
                      ))
                ]),
              ),
              FutureBuilder(
                  future: Provider.of<SectionProvider>(context, listen: false)
                      .getCategories(),
                  builder: (ctx, snp) {
                    if (snp.connectionState == ConnectionState.waiting) {
                      return const progressDialog(mssage: "Loading . . .");
                    } else {
                      return Container(
                        height: size.height * 0.85,
                        width: size.width,
                        child: ListView(
                          children: [
                            CarouselSlider(
                              options: CarouselOptions(
                                viewportFraction: 0.8,
                                height: size.height * 0.2,
                                enlargeCenterPage: true,
                                autoPlay: true,
                                aspectRatio: 16 / 9,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enableInfiniteScroll: true,
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 400),
                              ),
                              items: images.map((sliderPhoto) {
                                return Builder(builder: (BuildContext context) {
                                  return InkWell(
                                    onTap: () {
                                      Provider.of<PageStateManager>(context,
                                              listen: false)
                                          .setitemdetial(true);
                                    },
                                    child: Card(
                                      elevation: 2.0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  sliderPhoto.toString(),
                                                ),
                                                fit: BoxFit.fill),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                  );
                                });
                              }).toList(),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Categories",
                                    textAlign: TextAlign.center,
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "ViewAll",
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              height: size.height * 0.15,
                              child: SectionsListView(),
                            ),
                            Card(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.05),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "الاكثر مبيعا",
                                    ),
                                    SizedBox(
                                      width: size.width * 0.03,
                                    ),
                                    Icon(
                                      Icons.star,
                                    ),
                                  ],
                                ),),
                                margin: EdgeInsets.only(
                                    top: 0.0,
                                    left: 0.0,
                                    right: 0.0,
                                    bottom: size.height * 0.01),
                              elevation: 2.0,
                            ),
                            ItemSection(),
                          ],
                        ),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
