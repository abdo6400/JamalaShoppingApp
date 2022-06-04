import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import '../models/models.dart';
import 'package:provider/provider.dart';
import '../jamala_pages.dart';
import '../animations/animations.dart';
class FavoriteScreen extends StatefulWidget {
  static MaterialPage page(){
    return MaterialPage(
      child: SlideTransitionAnimation(child:FavoriteScreen()),
      name: jamalapages.favoritePage,
      key: ValueKey(jamalapages.favoritePage),
    );
  }
  const FavoriteScreen({Key? key}) : super(key: key);
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('العناصر المفضله'),
            centerTitle: true,
          ),
          body: FavoriteListView(),
        ));
  }
}
