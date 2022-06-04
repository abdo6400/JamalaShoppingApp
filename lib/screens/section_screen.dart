import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import '../models/models.dart';
import 'package:provider/provider.dart';
import '../jamala_pages.dart';
import '../animations/animations.dart';
class SectionScreen extends StatefulWidget {
  static MaterialPage page(){
    return MaterialPage(
      child: SectionScreen(),
      name: jamalapages.sectionPage,
      key: ValueKey(jamalapages.sectionPage),
    );
  }
  const SectionScreen({Key? key}) : super(key: key);
  @override
  _SectionScreenState createState() => _SectionScreenState();
}

class _SectionScreenState extends State<SectionScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('قسم'),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Provider.of<PageStateManager>(context, listen: false)
                        .setfavorite(true);
                  },
                  icon: Icon(Icons.favorite_border))
            ],
          ),
          body: ItemSectionListView(),
        ));
  }
}