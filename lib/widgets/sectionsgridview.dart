import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jamalashoppingapp/providers/datamodels/product.dart';
import 'package:jamalashoppingapp/providers/datamodels/sections.dart';
import 'package:jamalashoppingapp/providers/sectionprovider.dart';
import '../models/models.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';

class SectionsGridView extends StatelessWidget {
  const SectionsGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: Provider.of<SectionProvider>(context,listen: false).getCategories(),
        builder: (ctx, snp) {
          if (snp.connectionState == ConnectionState.waiting)
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          else {
            List<Section> categoryList = Provider.of<SectionProvider>(context,listen: false).CategoryList;
            return GridView.builder(
                itemCount: categoryList.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.all(15),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: size.width * 0.4,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: size.height*0.01,
                  mainAxisSpacing: size.width*0.01,
                ),
                itemBuilder: (ctx, index) {
                  return SectionThumbnail(
                   image_url: categoryList[index].image,
                    name: categoryList[index].name,
                    index: index,
                  );
                });
          }
        });
  }
}
