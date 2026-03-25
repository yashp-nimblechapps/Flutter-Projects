import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_application/dashboard.dart';
import 'package:go_router_application/profile.dart';


void main() {
  runApp(MyApp());
}

//final isLoggedIn = true;

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Go Router',
      routerConfig: _router,
    );
  }

  final GoRouter _router = GoRouter(
    //initialLocation: "/profile",
    //errorBuilder: (context, state) => const ErrorPage(),
    /*redirect: (context, state) {
      if(isLoggedIn){
        return "/";
      }
      else{
        return "/";
      }
    },*/
    routes: [
    GoRoute(path: "/", builder: (context, state) => const Dashboard()),
    GoRoute(
      path: '/profile',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          //transitionDuration: const Duration(seconds: 1),
          fullscreenDialog: true,
          key: state.pageKey,
          child: const Profile(), 
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },);
      }
    )
  ]);
}
