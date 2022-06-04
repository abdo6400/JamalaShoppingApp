import 'package:flutter/material.dart';
import '../models/models.dart';
import 'package:provider/provider.dart';
import '../jamala_pages.dart';
import '../providers/providers.dart';
import '../widgets/widgets.dart';
import '../animations/animations.dart';
class ProfileScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      child: SlideTransitionAnimation(child: ProfileScreen()),
      name: jamalapages.profilePage,
      key: ValueKey(jamalapages.profilePage),
    );
  }

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الصفحة الشخصيه",
        ),
        elevation: 0,
        centerTitle: true,
        actions: [TextButton(onPressed: () {
          Provider.of<PageStateManager>(
              context, listen: false)
              .setedit(true);
        }, child: Text("تعديل"))],
      ),
      body: Container(
        width: size.width,
        padding: EdgeInsets.symmetric(vertical: size.height * 0.03,horizontal: size.width*0.03),
        child: Column(
          children: [
            CircleImage(
              imageProvider: AssetImage("assets/icons/profile.png"),
              imageRadius: 55.0,
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              "Abdo Amr",
            ),
            SizedBox(height: size.height * 0.01),
            Card(
              elevation: 2.0,
              child: Container(
                child: Column(
                  children: [
                    ListTile(
                      title: Text("Email"),
                      subtitle: Text("abdo@gmail.com"),
                    ),
                    ListTile(
                      title: Text("address"),
                      subtitle: Text("abdo@gmail.com"),
                    ),
                    ListTile(
                      title: Text("phone number"),
                      subtitle: Text("0102524454"),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              width: size.width * 0.5,
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<Auth>(context,listen: false).Logout();
                  Provider.of<AppStateManager>(
                      context, listen: false).logOut();
                  Provider.of<PageStateManager>(
                      context, listen: false).LogOut();
                },
                child: Text("Logout"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
