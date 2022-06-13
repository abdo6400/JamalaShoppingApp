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
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              decoration: BoxDecoration(
          ),
              child: Column(
                children: [
                Column(
                  children: [
                    Container(
                        margin: EdgeInsets.all(size.height*0.02),
                        height: size.height * 0.1,
                        width: size.width * 0.2,
                        child: const Image(
                          image: AssetImage("assets/icons/store.png"),
                          fit: BoxFit.cover,
                        )),
                    Container(
                      child: Text(
                        "جمله",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ],
                ),
                  Divider(),
                  SizedBox(
                    height: size.height * 0.08,
                    child: ListTile(
                        leading: Icon(Icons.home,color: Colors.black,),
                        title: const Text(
                          "الصفحة الرئسية",
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        }),
                  ),
                  Divider(),
                  SizedBox(
                    height: size.height * 0.08,
                    child: ListTile(
                        leading: Icon(Icons.favorite,color: Colors.redAccent,),
                        title: const Text(
                          "العناصرالمفضله",
                        ),
                        onTap: () {
                          Provider.of<PageStateManager>(context, listen: false)
                              .setfavorite(true);
                          Navigator.of(context).pop();
                        }),
                  ),
                  Divider(),
                  SizedBox(
                    height: size.height * 0.08,
                    child: ListTile(
                        leading: Icon(Icons.featured_play_list_outlined,color: Colors.greenAccent,),
                        title: const Text(
                          "قائمة الطلبات",
                        ),
                        onTap: () {
                          Provider.of<PageStateManager>(context, listen: false)
                              .setorder(true);
                          Navigator.of(context).pop();
                        }),
                  ),
                  Divider(),
                  SizedBox(
                    height: size.height * 0.08,
                    child: ListTile(
                        leading: Icon(Icons.perm_contact_calendar_outlined,color: Colors.blueAccent,),
                        title: const Text(
                          "الصفحة الشخصيه",
                        ),
                        onTap: () {
                          Provider.of<PageStateManager>(context, listen: false)
                              .setprofile(true);
                          Navigator.of(context).pop();
                        }),
                  ),
                  Divider(),
                  SizedBox(
                    height: size.height * 0.08,
                    child: ListTile(
                        leading: Icon(Icons.contact_support_outlined,color: Colors.green,),
                        title: const Text(
                          "تواصل معانا",
                        ),
                        onTap: () {
                          Provider.of<PageStateManager>(context, listen: false)
                              .setcontact(true);
                          Navigator.of(context).pop();
                        }),
                  ),
                  Divider(),
                  SizedBox(
                    height: size.height * 0.08,
                    child: ListTile(
                        leading: Icon(Icons.logout,color: Colors.redAccent,),
                        title: const Text(
                          "تسجيل الخروج",
                        ),
                        onTap: () {
                          Provider.of<Auth>(context, listen: false).Logout();
                          Provider.of<AppStateManager>(context, listen: false)
                              .logOut();
                          Navigator.of(context).pop();
                        }),
                  ),
                  Divider(),
                  Text("Connact us",style: Theme.of(context).textTheme.headline4,),
                  SizedBox(height: size.height*0.01,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("01069645711",style: Theme.of(context).textTheme.headline4,),
                      Text("01069645711",style: Theme.of(context).textTheme.headline4,),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
