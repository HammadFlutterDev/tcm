import 'package:flutter/material.dart';

class AppRouter {
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  static void back() {
    Navigator.pop(navKey.currentContext!);
    FocusScope.of(navKey.currentContext!).unfocus();
  }

  static push(page, {Function()? fun}) async {
    await Navigator.push(
      navKey.currentContext!,
      MaterialPageRoute(builder: (context) => page),
    ).then((c) {
      if(fun != null){
        fun();
      }
    });
  }

  static pushReplacement(
    page,
  ) async {
    await Navigator.pushReplacement(
      navKey.currentContext!,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static pushAndRemoveUntil(page) async {
    await Navigator.pushAndRemoveUntil(
      navKey.currentContext!,
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false,
    );
  }
// Bottom to Top
//   static pushAndRemoveUntilWithAnimation(page) async {
//   await Navigator.pushAndRemoveUntil(
//     navKey.currentContext!,
//     PageRouteBuilder(
//       transitionDuration: const Duration(seconds: 1),
//       pageBuilder: (_, __, ___) => page,
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         const begin = Offset(0.0, 1.0);
//         const end = Offset.zero;
//         const curve = Curves.easeInOut;

//         var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//         var offsetAnimation = animation.drive(tween);

//         return SlideTransition(position: offsetAnimation, child: child);
//       },
//     ),
//     (Route<dynamic> route) => false,
//   );
// }

// static pushWithAnimation(page) async {
//   await Navigator.push(
//     navKey.currentContext!,
//     PageRouteBuilder(
//       transitionDuration: const Duration(seconds: 1),
//       pageBuilder: (_, __, ___) => page,
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         const begin = Offset(0.0, 1.0);
//         const end = Offset.zero;
//         const curve = Curves.easeInOut;

//         var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//         var offsetAnimation = animation.drive(tween);

//         return SlideTransition(position: offsetAnimation, child: child);
//       },
//     ),
//   );
// }

// Right to Left
  static pushAndRemoveUntilWithAnimation(page) async {
    await Navigator.pushAndRemoveUntil(
      navKey.currentContext!,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // Start from the right
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
      (Route<dynamic> route) => false,
    );
  }

  static pushWithAnimation(page) async {
    await Navigator.push(
      navKey.currentContext!,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // Start from the right
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }

//Left to Right

// static pushAndRemoveUntilWithAnimation(page) async {
//   await Navigator.pushAndRemoveUntil(
//     navKey.currentContext!,
//     PageRouteBuilder(
//       transitionDuration: const Duration(seconds: 1),
//       pageBuilder: (_, __, ___) => page,
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         const begin = Offset(-1.0, 0.0); // Start from the left
//         const end = Offset.zero;
//         const curve = Curves.easeInOut;

//         var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//         var offsetAnimation = animation.drive(tween);

//         return SlideTransition(position: offsetAnimation, child: child);
//       },
//     ),
//     (Route<dynamic> route) => false,
//   );
// }

// static pushWithAnimation(page) async {
//   await Navigator.push(
//     navKey.currentContext!,
//     PageRouteBuilder(
//       transitionDuration: const Duration(seconds: 1),
//       pageBuilder: (_, __, ___) => page,
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         const begin = Offset(-1.0, 0.0); // Start from the left
//         const end = Offset.zero;
//         const curve = Curves.easeInOut;

//         var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//         var offsetAnimation = animation.drive(tween);

//         return SlideTransition(position: offsetAnimation, child: child);
//       },
//     ),
//   );
// }
}
