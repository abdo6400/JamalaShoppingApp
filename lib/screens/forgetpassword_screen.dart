import 'package:flutter/material.dart';
import '../widgets/helperwidgets.dart';
import 'package:provider/provider.dart';
import '../jamala_pages.dart';
import '../models/models.dart';
import '../providers/providers.dart';
class ForgetPassScreen extends StatefulWidget {
  static MaterialPage page() {
    return const MaterialPage(
      child: ForgetPassScreen(),
      name: jamalapages.forgetPage,
      key: ValueKey(jamalapages.forgetPage),
    );
  }

  const ForgetPassScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Map<String, String>? userInfo =
        Provider.of<Auth>(context, listen: false).userInfo;
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromRGBO(255, 255, 250, 0.9),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "اعادة تعين كلمة المرور",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 2.0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: size.height*0.1,left: size.width*0.02,right: size.width*0.02),
          child: Center(
            child: Card(
                elevation: 10.0,
                shadowColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  height: size.height*0.5,
                  padding: EdgeInsets.symmetric(vertical: size.height*0.05,horizontal: size.width*0.05),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView(
                    children: [
                      Container(
                        width: size.width,
                        child: Stack(
                          children: [
                             Container(
                                alignment: Alignment.topLeft,
                                child: Image(
                                  image:AssetImage('assets/icons/phonenumber.png'),
                                  height: size.height*0.1,
                                  width: size.width*0.3,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child:  Column(
                                  children: [
                                    const Text(
                                      "الرجاء ادخال رقم الهاتف",
                                      style: TextStyle(
                                          color: Colors.black26,
                                          fontWeight: FontWeight.bold,),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                   const Text(
                                      "الذى تريد ان ترسل علية رسالة التاكيد",
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.08,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black38),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child:  TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.01,
                                  horizontal: size.width * 0.02),
                              enabledBorder:InputBorder.none,
                              constraints: BoxConstraints(
                                  maxHeight: size.height * 0.1, maxWidth: size.width*0.7),
                              border: const OutlineInputBorder(),
                              hintText: "${userInfo!["email"]!}",
                              hintStyle: TextStyle(color: Colors.black54),
                              hintTextDirection: TextDirection.rtl,
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: size.width * 0.05),
                                child: const Icon(
                                  Icons.email,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            enabled: false,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Container(
                       padding: EdgeInsets.symmetric(horizontal: size.height*0.04),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue)
                          ),
                          onPressed: () async{
                            try{
                             bool val =await Provider.of<Auth>(context,listen: false).changePassword("${userInfo["email"]!}");
                             if(val){
                               Provider.of<AppStateManager>(context, listen: false)
                                   .setsucceedsign(true);
                             }
                            }catch(e){
                              snackBar(context, "$e", MediaQuery.of(context).size.width*0.3);
                            }
                          },
                          child: const Text("الاستمرار",style: TextStyle(color: Colors.white,fontSize: 14),),
                        ),
                      )
                    ],
                  ),
                ),
              ),
          ),
        ),
        ),
    ));
  }
}
