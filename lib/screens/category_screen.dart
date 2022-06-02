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
    return  Scaffold(
      body: Column(
          children: [
            Container(
              height: size.height * 0.06,
              width: size.width,
              child: Card(
                color: Colors.blueAccent.shade700,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width*0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "الاقسام",
                        style: TextStyle(fontSize: 18,color: Colors.white),
                      ),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      Icon(
                        Icons.widgets_outlined,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(child: Directionality(
              textDirection: TextDirection.rtl,
                child: SectionsGridView()))
          ],
      ),
    );
  }
}
