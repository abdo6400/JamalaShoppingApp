import 'package:flutter/material.dart';
import '../models/models.dart';
import '../screens/screens.dart';
import '../jamala_pages.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState>? _navigatorKey;
  final AppStateManager? appStateManager;
  final PageStateManager? pageStateManager;
  final CarteStateManager? carteStateManager ;
  final OrderStateManager? orderStateManager;
  AppRouter({this.appStateManager,this.pageStateManager,this.carteStateManager,this.orderStateManager})
      : _navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager!.addListener(notifyListeners);
    pageStateManager!.addListener(notifyListeners);
    carteStateManager!.addListener(notifyListeners);
    orderStateManager!.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appStateManager!.removeListener(notifyListeners);
    pageStateManager!.removeListener(notifyListeners);
    carteStateManager!.removeListener(notifyListeners);
    orderStateManager!.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        if(!appStateManager!.initialized)  SplashScreen.page(),
        if(appStateManager!.initialized && !appStateManager!.onboardingComplete) OnboardingScreen.page(),
        if(appStateManager!.onboardingComplete&&!appStateManager!.logIn) SignScreen.page(),
        if(appStateManager!.forgetscreen) ForgetPassScreen.page(),
        if(appStateManager!.authotp) AuthOtpScreen.page(),
        if(appStateManager!.restpassword) RestpasswordScreen.page(),
        if(appStateManager!.succeedsign) SucceedSignScreen.page(),
        if(appStateManager!.logIn) HomeScreen.page(),
        if(pageStateManager!.category_screen) CategoryScreen.page(),
        if(pageStateManager!.carte_screen) CartScreen.page(),
        if(pageStateManager!.favorite_screen) FavoriteScreen.page(),
        if(pageStateManager!.order_screen) OrderScreen.page(),
        if(orderStateManager!.OrderdetailScreen) OrderDetailScreen.page(),
        if(pageStateManager!.profile_screen) ProfileScreen.page(),
        if(pageStateManager!.notification_screen) NotificationScreen.page(),
        if(pageStateManager!.scetion_screen) SectionScreen.page(),
        if(pageStateManager!.contactus_screen) ContactUsScreen.page(),
        if(pageStateManager!.item_detial_screen) ItemDetailScreen.page(),
        if(pageStateManager!.edit_screen) EditScreen.page(),
        if(carteStateManager!.infoScreen)   InformationScreen.page(),

      ],
    );
  }

  @override
  // TODO: implement navigatorKey
  GlobalKey<NavigatorState>? get navigatorKey => throw UnimplementedError();
  bool _handlePopPage(Route<dynamic> route,result){
    if(!route.didPop(result)) return false;
    if(route.settings.name == jamalapages.onboardingPage) return false;
    if(route.settings.name == jamalapages.signPage) return false;
    if(route.settings.name == jamalapages.forgetPage) appStateManager!.setforgetpass(false);
    if(route.settings.name == jamalapages.authotpPage) appStateManager!.setauthotp(false);
    if(route.settings.name == jamalapages.succeedsignPage) appStateManager!.setsucceedsign(false);
    if(route.settings.name == jamalapages.restpasswordPage) appStateManager!.setrestpassword(false);
    if(route.settings.name == jamalapages.homePage) return false;
    if(route.settings.name == jamalapages.categoryPage) pageStateManager!.setcategory(false);
    if(route.settings.name == jamalapages.CartePage) pageStateManager!.setcart(false);
    if(route.settings.name == jamalapages.orderPage) pageStateManager!.setorder(false);
    if(route.settings.name == jamalapages.orderdetailPage) orderStateManager!.setOrderdetail(false);
    if(route.settings.name == jamalapages.favoritePage) pageStateManager!.setfavorite(false);
    if(route.settings.name == jamalapages.profilePage) pageStateManager!.setprofile(false);
    if(route.settings.name == jamalapages.notificationPage) pageStateManager!.setnotification(false);
    if(route.settings.name == jamalapages.sectionPage) pageStateManager!.setsection(false);
    if(route.settings.name == jamalapages.contactuspage) pageStateManager!.setcontact(false);
    if(route.settings.name == jamalapages.informationPage) carteStateManager!.setInfo(false);
    if(route.settings.name == jamalapages.itemdetialPage) pageStateManager!.setitemdetial(false);
    if(route.settings.name == jamalapages.editPage) pageStateManager!.setedit(false);
      return true;
    }
  @override
  Future<void> setNewRoutePath(configuration) async => null;
}

