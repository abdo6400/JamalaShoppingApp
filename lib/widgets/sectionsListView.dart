import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
            List<category> categoryList = Provider.of<CategoryProvider>(context,listen: false).CategoryList;
            return  ListView.separated(

                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: EdgeInsets.all(15),
                  separatorBuilder: (ctx,index){
                    return SizedBox(width: 20,);
                  },
                  itemBuilder: (ctx, index) {
                    return SectionThumbnail(
                      image_url: categoryList[index].image,
                      index: index,
                    );
                  });

          }
        });
  }
}