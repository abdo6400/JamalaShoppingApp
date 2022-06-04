import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jamalashoppingapp/providers/datamodels/sections.dart';
import 'package:jamalashoppingapp/providers/sectionprovider.dart';
import '../models/models.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';


class SectionsListView extends StatelessWidget {
  const SectionsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<CategoryProvider>(context,listen: false).getCategories(),
        builder: (ctx, snp) {
          if (snp.connectionState == ConnectionState.waiting)
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          else {
            List<Section> categoryList = Provider.of<SectionProvider>(context,listen: false).CategoryList;
            return  ListView.separated(
                  itemCount: categoryList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                 padding: EdgeInsets.symmetric(horizontal: 10),
                  separatorBuilder: (ctx,index){
                    return SizedBox(width: 20,);
                  },
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
