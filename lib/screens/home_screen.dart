import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';
import '../widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../jamala_pages.dart';
import '../models/models.dart';
import '../screens/screens.dart';

class HomeScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      child: const HomeScreen(),
      name: jamalapages.homePage,
      key: ValueKey(jamalapages.homePage),
    );
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text(
          'الصفحة الرئسيه',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent.shade700,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: SearchPage<Producttest>(
                      items:
                          Provider.of<CategoryProvider>(context, listen: false)
                              .getallproduct(),
                      searchLabel: 'Search products',
                      searchStyle: TextStyle(color: Colors.blueAccent),
                      suggestion: Container(
                        height: size.height,
                        width: size.width,
                        decoration: BoxDecoration(color: Colors.grey.shade100),
                        child: const Center(
                          child: Text(
                            'search about products by name',
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        ),
                      ),
                      failure: const Center(
                        child: Text('No products found :(',style: TextStyle(color: Colors.blueAccent),),
                      ),
                      barTheme: ThemeData(
                        appBarTheme: const AppBarTheme(
                            backgroundColor: Colors.white,
                            iconTheme: IconThemeData(color: Colors.black)),
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
        actions: [
          IconButton(
              onPressed: () {
                _key.currentState!.openEndDrawer();
              },
              icon: Icon(Icons.menu))
        ],
      ),
      body: MainScreen(),
      endDrawer: MainDrawer(),

    ));
  }
}
