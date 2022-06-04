import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import '../models/models.dart';
import 'package:provider/provider.dart';
import '../jamala_pages.dart';
import '../animations/animations.dart';
class ContactUsScreen extends StatefulWidget {
  static MaterialPage page(){
    return MaterialPage(
      child: SlideTransitionAnimation(child: ContactUsScreen()),
      name: jamalapages.contactuspage,
      key: ValueKey(jamalapages.contactuspage),
    );
  }
  const ContactUsScreen({Key? key}) : super(key: key);
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('تواصل معانا',textAlign: TextAlign.center,),
            centerTitle: true,
          ),
          body:   Card(
                  margin: EdgeInsets.only(bottom: size.height*0.38,right: size.width*0.02,left: size.width*0.02,top: size.height*0.02),
                  elevation: 10.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        leading: Icon(Icons.mail_outline),
                        title: Text("abdoamr@gmail.com"),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text("+2001069645711"),
                      ),
                      ListTile(
                        leading: Icon(Icons.chat),
                        title: Text("abdoamr@gmail.com"),
                      ),
                      ListTile(
                        leading: Icon(Icons.location_on),
                        title: Text("20 jhsa uasu ygaya jhfjhfudufydgyfgdygfydgyfydfyd"),
                      )
                    ],
                  ),
          ),
        ));
  }
}