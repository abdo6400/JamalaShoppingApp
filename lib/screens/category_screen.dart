import 'package:flutter/material.dart';
import 'package:jamalashoppingapp/jamala_pages.dart';
import '../widgets/widgets.dart';
class CategoryScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      child: const CategoryScreen(),
      name: jamalapages.categoryPage,
      key: ValueKey(jamalapages.categoryPage),
    );
  }

  const CategoryScreen({Key? key}) : super(key: key);
  @override
  State<CategoryScreen> createState() => CategoryScreenState();
}
class CategoryScreenState extends State<CategoryScreen>{

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Categories"),
        ),
        body: Column(
            children: [
              SizedBox(child: Directionality(
                textDirection: TextDirection.rtl,
                  child: SectionsGridView()))
            ],
        ),
      ),
    );
  }
}
