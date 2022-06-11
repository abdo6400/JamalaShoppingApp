import 'package:flutter/material.dart';
import '../models/models.dart';
import 'package:provider/provider.dart';
import '../jamala_pages.dart';
import '../widgets/widgets.dart';
import '../animations/animations.dart';
class CartScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      child: SlideTransitionAnimation(child: CartScreen(),),
      name: jamalapages.CartePage,
      key: ValueKey(jamalapages.CartePage),
    );
  }

  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text('عربة التسوق'),
      //   centerTitle: true,
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           Provider.of<PageStateManager>(context, listen: false)
      //               .setorder(true);
      //         },
      //         icon: Icon(Icons.list_alt_outlined))
      //   ],
      // ),
      body: i == 0
          ?
      CartListView():EmptyCartScreen(),
    ));
  }
}

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset('assets/images/empty_list.png'),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'لا يوجد عناصر في السلة',
            ),
            const SizedBox(height: 12.0),
            const Text(
              'اضغط علي الزر لتصفح الاقسام',
              textAlign: TextAlign.center,
            ),
            MaterialButton(
              child: const Text('تصفح الاقسام'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
