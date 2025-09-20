import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'loginsreen.dart';

void main() {
  runApp(Animatedsplashscreen());
}
int duringSplash (){
  print('Something working in background...');
  int a =123+23;
  print('Calculate value:$a');
  if (a > 100) {
    return 1;
  } else {
    return 2;
  }
}
class Animatedsplashscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Scaffold(appBar:AppBar(centerTitle:true,
          title: Text("Saniva Shop Free Area",
            style:TextStyle(color:Colors.red.shade900,fontSize: 35.0,
                fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),),
          body:AnimatedSplashScreen.withScreenFunction(
              splash: 'assets/8.jpg',
              splashIconSize: 250,
              duration: 3000,
              splashTransition: SplashTransition.fadeTransition,
              pageTransitionType: PageTransitionType.rightToLeft,
              backgroundColor: Colors.white,
              screenFunction: () async {
                int result = duringSplash();
                if (result == 1) {
                  return Home();
                } else {
                  return HomeState();
                }
              }
          ),
        )
    );
  }
}
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LoginSreen(),
    );
  }

}
class HomeState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Splash'),
        backgroundColor: Colors.purple,
      ),
      body: Center(child: Text('next',
        style: TextStyle(color: Colors.yellowAccent,fontSize: 30.0),),),
    );
  }
}
