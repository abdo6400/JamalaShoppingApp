import 'package:flutter/material.dart';
import 'package:jamalashoppingapp/providers/datamodels/product.dart';
import 'package:jamalashoppingapp/providers/sectionprovider.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';
class FavoriteListView extends StatefulWidget {
  const FavoriteListView({Key? key}) : super(key: key);

  @override
  _FavoriteListViewState createState() => _FavoriteListViewState();
}

class _FavoriteListViewState extends State<FavoriteListView> {
  late List<Product> products;
  @override
  void initState() {
    super.initState();
    products = Provider.of<SectionProvider>(context,listen: false).getbestproductsold();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child:GridView.builder(
        itemCount: products.length,
          controller: ScrollController(),
          padding: EdgeInsets.all(15),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: size.width*0.45,
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
