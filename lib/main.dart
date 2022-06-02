import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'models/models.dart';
import 'navigation/app_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart' ;
import 'constant.dart';

import 'providers/providers.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppStateManager _appStateManager = AppStateManager();
  final PageStateManager _pageStateManager = PageStateManager();
  final CarteStateManager _carteStateManager = CarteStateManager();
  final OrderStateManager _orderStateManager = OrderStateManager();
  final CategoryProvider _categoryProvider = CategoryProvider();
  AppRouter? _appRouter;

  @override
  void initState() {
    _appRouter = AppRouter(
        appStateManager: _appStateManager,
        pageStateManager: _pageStateManager,
        carteStateManager: _carteStateManager,
        orderStateManager: _orderStateManager);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => _appStateManager),
        ChangeNotifierProvider(create: (_) => _pageStateManager),
        ChangeNotifierProvider(create: (_) => _carteStateManager),
        ChangeNotifierProvider(create: (_) => _orderStateManager),
        ChangeNotifierProvider(create: (_) => _categoryProvider),
        ChangeNotifierProvider(create: (_) => Auth()),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => Orders()),
        ChangeNotifierProvider(create: (_) => Products()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'جمله',
          home: Router(
            routerDelegate: _appRouter!,
            backButtonDispatcher: RootBackButtonDispatcher(),
          ),
      ),
    );
  }
}
