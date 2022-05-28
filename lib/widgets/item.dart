import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';
import 'package:provider/provider.dart';

class Item extends StatefulWidget {
  final String? name;
  final String? price;
  final String? image_url;
   Item({
     this.name,
     this.price,
     this.image_url,
    Key? key
   }) : super(key: key);

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      elevation: 5.0,
      shadowColor: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: size.width * 0.4,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              child: Container(
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.blue,
                      ))),
            ),
            Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: size.height * 0.03),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Provider.of<PageStateManager>(context, listen: false)
                            .setitemdetial(true);
                      },
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          widget.image_url!,
                        ),
                        radius: size.height * 0.07,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(widget.name!,style: TextStyle(fontSize: 14),),
                  ],
                )),
            Positioned(
                bottom: size.height * 0.02,
                left: size.width * 0.04,
                right: size.width * 0.05,
                child: Container(
                  width: size.width * 0.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: size.height*0.021,
                        backgroundColor: Colors.blue,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: size.height*0.021,
                            )),
                      ),
                      Text(
                        widget.price!+" جنية ",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
