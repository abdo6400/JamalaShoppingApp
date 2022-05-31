import 'package:flutter/material.dart';
import '../widgets/circle_image.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import 'dart:math';

class SectionThumbnail extends StatelessWidget {
  final String? image_url;
  final String? name;
  final int? index;
  SectionThumbnail({
    this.name,
    this.image_url,
    this.index,
    Key? key,
  }) : super(key: key);
  final Color color = Colors.primaries[Random().nextInt(17)];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
        onTap: () {
          Provider.of<PageStateManager>(context, listen: false).setindex(index);
          Provider.of<PageStateManager>(context, listen: false)
              .setsection(true);
        },
        child: Container(
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(image_url!),
                radius:  size.height*0.06,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              name==null?Container(): Container(
                height: size.height * 0.05,
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5)),
                ),
                child: Text(
                  "${name}",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ));
  }
}
