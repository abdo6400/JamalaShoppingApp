import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/category_provider.dart';
import 'package:provider/provider.dart';
import '../models/page_manager.dart';
import '../widgets/widgets.dart';

class ItemSectionListView extends StatefulWidget {
  const ItemSectionListView({Key? key}) : super(key: key);

  @override
  _ItemSectionListViewState createState() => _ItemSectionListViewState();
}

class _ItemSectionListViewState extends State<ItemSectionListView> {
  late List<Producttest> products;
  @override
  void initState() {
    int index = Provider.of<PageStateManager>(context,listen: false).index;
    products = Provider.of<CategoryProvider>(context,listen: false).getProducts(index);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.symmetric(
             horizontal: size.width * 0.01),
        child: GridView.builder(
            itemCount: products.length,
            padding: EdgeInsets.all(15),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: size.width*0.42,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemBuilder: (ctx,index){
              return Item(
                name: products[index].name,
                image_url: products[index].image,
                price: products[index].price.toString(),
              );
            }
        ),
        );
  }
}
