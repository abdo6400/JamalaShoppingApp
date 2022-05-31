import 'package:flutter/material.dart';
import '../models/models.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';
import '../screens/screens.dart';
class MainDrawer extends StatefulWidget {
  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), bottomLeft: Radius.circular(35)),
        ),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35), bottomLeft: Radius.circular(35)),
          ),
          child: ListView(
            children: [
              Container(
                width: size.width * 0.8,
                height: size.height * 0.25,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                )),
                child: Material(
                  elevation: 2.0,
                  color: Colors.blueAccent.shade700,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(35)),
                  ),
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              top: size.height * 0.04,
                              left: size.width * 0.02,
                              right: size.width * 0.02,
                              bottom: size.height * 0.02),
                          height: size.height * 0.1,
                          width: size.width * 0.2,
                          child: const Image(
                            image: AssetImage("assets/icons/store.png"),
                            fit: BoxFit.cover,
                          )),
                      Container(
                        child: const Text(
                          "جمله",
                          style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.08,
                        child: Card(
                          child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage(
                                  'assets/icons/home.png',
                                ),
                                radius: size.height * 0.021,
                              ),
                              title: const Text("الصفحة الرئسية",
                                  style: TextStyle(color: Colors.black)),
                              onTap: () {
                                Navigator.of(context).pop();
                              }),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.08,
                        child: Card(
                          child: ListTile(
                              leading:  CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/icons/love.png'),
                              radius: size.height * 0.021,),
                              title: const Text("العناصرالمفضله",
                                  style: TextStyle(color: Colors.black)),
                              onTap: () {
                                Provider.of<PageStateManager>(context,
                                        listen: false)
                                    .setfavorite(true);
                                Navigator.of(context).pop();
                              }),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.08,
                        child: Card(
                          child: ListTile(
                              leading: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/icons/order.png'),
                                radius: size.height * 0.021,
                              ),
                              title: const Text("قائمة الطلبات",
                                  style: TextStyle(color: Colors.black)),
                              onTap: () {
                                Provider.of<PageStateManager>(context,
                                        listen: false)
                                    .setorder(true);
                                Navigator.of(context).pop();
                              }),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.08,
                        child: Card(
                          child: ListTile(
                              leading:  CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/icons/profile.png'),
                                radius: size.height * 0.021,
                              ),
                              title: const Text("الصفحة الشخصيه",
                                  style: TextStyle(color: Colors.black)),
                              onTap: () {
                                Provider.of<PageStateManager>(context,
                                        listen: false)
                                    .setprofile(true);
                                Navigator.of(context).pop();
                              }),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.08,
                        child: Card(
                          child: ListTile(
                              leading:  CircleAvatar(
                                backgroundImage:
                                AssetImage('assets/icons/contactus.png'),
                                radius: size.height * 0.021,
                              ),
                              title: const Text("تواصل معانا",
                                  style: TextStyle(color: Colors.black)),
                              onTap: () {
                                Provider.of<PageStateManager>(context,
                                    listen: false).setcontact(true);
                                Navigator.of(context).pop();
                              }),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.08,
                        child: Card(
                          child: ListTile(
                              leading:  CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/icons/logout.png'),
                                radius: size.height * 0.021,
                              ),
                              title: const Text("تسجيل الخروج",
                                  style: TextStyle(color: Colors.black)),
                              onTap: () {
                                Provider.of<Auth>(context,listen: false).Logout();
                                Provider.of<AppStateManager>(context, listen: false).logOut();
                                Navigator.of(context).pop();
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
