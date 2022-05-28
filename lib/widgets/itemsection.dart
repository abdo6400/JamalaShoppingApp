import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/category.dart';
import '../models/category_provider.dart';
import '../models/page_manager.dart';
import '../widgets/widgets.dart';

class ItemSection extends StatefulWidget {
  const ItemSection({Key? key}) : super(key: key);

  @override
  _ItemSectionState createState() => _ItemSectionState();
}

class _ItemSectionState extends State<ItemSection> {
  final Color color = Colors.primaries[Random().nextInt(17)];
  late List<Producttest> products;
  @override
  void initState() {
    super.initState();
    products = Provider.of<CategoryProvider>(context,listen: false).getbestproductsold();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.3,
      child: ListView.separated(
        separatorBuilder: (ctx, index) {
          return SizedBox(
            width: size.width * 0.02,
          );
        },
        itemCount: products.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: ScrollPhysics(),
        itemBuilder: (ctx, index) {
          return Item(
            name: products[index].name,
            image_url: products[index].image,
            price: products[index].price.toString(),
          );
        },
      ),
    );
  }
}
