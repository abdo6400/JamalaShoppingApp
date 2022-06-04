import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../animations/heroanimation.dart';
import '../widgets/widgets.dart';
import '../models/models.dart';
import 'package:provider/provider.dart';
import '../jamala_pages.dart';
import '../animations/animations.dart';
class ItemDetailScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      child: HeroAnimation(child: ItemDetailScreen(),),
      name: jamalapages.itemdetialPage,
      key: ValueKey(jamalapages.itemdetialPage),
    );
  }

  const ItemDetailScreen({Key? key}) : super(key: key);

  @override
  _ItemDetailScreenState createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            body: ListView(
      children: [
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50))),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: Container(
                  width: size.width,
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Provider.of<PageStateManager>(context,
                                    listen: false)
                                .setitemdetial(false);
                          },
                          icon: Icon(Icons.arrow_back)),
                      IconButton(
                          onPressed: () {
                            Provider.of<PageStateManager>(context,
                                    listen: false)
                                .setsection(false);
                            Provider.of<PageStateManager>(context,
                                    listen: false)
                                .setcart(true);
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.shopping_cart_outlined,
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/section.png'),
                    radius: size.height * 0.12,
                  )),
            ],
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Container(
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.minimize)),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        Text(
                          "1",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                      ],
                    ),
                  ),
                  Text(
                    "title",
                    style: TextStyle(fontSize: 21, color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Container(
                padding: EdgeInsets.only(right: size.width * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.01),
                          width: size.width * 0.15,
                          height: size.height * 0.07,
                          child: TextField(
                            decoration: InputDecoration(
                             hintText: "0",
                              contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.1,
                        ),
                        Container(
                          child: Text("quentum"),
                        ),
                      ],
                    ),
                    Text(
                      "5.0 price",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Container(
          width: size.width,
          height: size.height * 0.25,
          child: ExpansionTile(
              title: new Text("Johor"),
              initiallyExpanded: true,
              children: <Widget>[
                new ListTile(
                  title: new Text(
                      "{snapshot.data.accountinfo[index].namecxxxxxxxxxxxxxxxxfsgsgsg}"),
                )
              ]),
        ),
        Container(
            width: size.width,
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.02, vertical: size.height * 0.01),
            child: Row(
              children: [
                Container(
                  width: size.width * 0.78,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("add to cart"),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Container(
                  width: size.width * 0.15,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.favorite_border),
                  ),
                ),
              ],
            ))
      ],
    )));
  }
}
