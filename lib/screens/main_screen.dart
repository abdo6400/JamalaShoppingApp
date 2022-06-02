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
        // appBar: AppBar(
        //   elevation: 2.0,
        //   backgroundColor: Colors.transparent,
        //   title: Text(
        //     'JAMALA',
        //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        //   ),
        //   actions: [
        //   ],
        // ),
        body: Container(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                width: size.width,
                padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: "J",style: TextStyle(color: Colors.black,fontSize: 18)),
                            TextSpan(text: "A",style: TextStyle(color: Color(0xffffcc2a),fontSize: 18)),
                            TextSpan(text: "M",style: TextStyle(color: Colors.black,fontSize: 18)),
                            TextSpan(text: "A",style: TextStyle(color: Color(0xffffcc2a),fontSize: 18)),
                            TextSpan(text: "L",style: TextStyle(color: Colors.black,fontSize: 18)),
                            TextSpan(text: "A",style: TextStyle(color: Color(0xffffcc2a),fontSize: 18)),
                          ]
                        )
                    ),
                    Row(
                      children: [
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
                            icon: Icon(Icons.search,color: Color.fromRGBO(146, 180, 236, 1))),
                        IconButton(
                            onPressed: () {
                              Provider.of<PageStateManager>(context, listen: false)
                                  .setcart(true);
                            },
                            icon: Icon(Icons.shopping_cart_outlined,color: Color.fromRGBO(146, 180, 236, 1),))
                      ],
                    )
                  ],
                ),
              ),
              FutureBuilder(
                  future: Provider.of<CategoryProvider>(context, listen: false)
                      .getCategories(),
                  builder: (ctx, snp) {
                    if (snp.connectionState == ConnectionState.waiting) {
                      return  const progressDialog(mssage: "Loading . . .");
                    } else {
                      return Container(
                        height: size.height*0.8,
                        width: size.width,
                        child: ListView(
                          children: [
                            Card(
                              child: Text(
                                "specicl offers",
                                style: TextStyle(fontSize: 18,color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              color: Color.fromRGBO(255, 230, 154, 1),
                              margin: EdgeInsets.only(top: 0.0,left: 0.0,right: 0.0,bottom: size.height*0.01),
                            ),
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
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide.lerp(BorderSide(color: Color.fromRGBO(146, 180, 236, 1)), BorderSide(color: Color.fromRGBO(146, 180, 236, 1)), 2.0)
                                      ),
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  sliderPhoto.toString(),
                                                ),
                                                fit: BoxFit.fill),
                                            borderRadius: BorderRadius.circular(10)),
                                      ),
                                    ),
                                  );
                                });
                              }).toList(),
                            ),
                             Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width*0.05) ,
                               child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Categories",
                                      style: TextStyle(fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
                                    TextButton(
                                        onPressed: () {

                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "ViewAll",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                color:  Color.fromRGBO(146, 180, 236, 1),),
                                            ),
                                            Icon(
                                              Icons.arrow_forward,
                                              color:  Color.fromRGBO(146, 180, 236, 1),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                             ),
                            Container(
                              height: size.height * 0.13,
                              child: SectionsListView(),
                            ),
                            SizedBox(
                              height: size.height*0.01,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: size.width * 0.05),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "الاكثر مبيعا",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.03,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color(0xffffcc2a),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height*0.02,
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
