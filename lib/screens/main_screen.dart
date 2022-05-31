import 'package:flutter/cupertino.dart';
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 2.0,
          title: Text(
            'JAMALA',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: SearchPage<Producttest>(
                          items: Provider.of<CategoryProvider>(context,
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
                                decoration: BoxDecoration(color: Colors.white),
                                height: size.height,
                                width: size.width,
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.01),
                                child: GridView.builder(
                                    itemCount: 6,
                                    padding: EdgeInsets.all(15),
                                    gridDelegate:
                                        SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: size.width * 0.42,
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
                              )));
                },
                icon: Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  Provider.of<PageStateManager>(context, listen: false)
                      .setcart(true);
                },
                icon: Icon(Icons.shopping_cart_outlined))
          ],
        ),
        body: FutureBuilder(
            future: Provider.of<CategoryProvider>(context, listen: false)
                .getCategories(),
            builder: (ctx, snp) {
              if (snp.connectionState == ConnectionState.waiting) {
                return const progressDialog(mssage: "Loading . . .");
              } else {
                return Container(
                  height: size.height,
                  width: size.width,
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                  child: ListView(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          viewportFraction: 0.8,
                          height: size.height * 0.19,
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
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            sliderPhoto.toString(),
                                          ),
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                              ),
                            );
                          });
                        }).toList(),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Categories",
                              style: TextStyle(fontSize: 18),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "ViewAll",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.blueAccent),
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.blueAccent,
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Container(
                        height: size.height * 0.18,
                        child: SectionsListView(),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "الاكثر مبيعا",
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              width: size.width * 0.03,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                      ItemSection(),
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}
