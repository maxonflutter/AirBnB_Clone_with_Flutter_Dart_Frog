import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../screens/booking_details_screen.dart';
import '../../screens/home_screen.dart';
import '../theme/colors.dart';

class AppRouter {
  late final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        name: 'home',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        name: 'booking-details',
        path: '/booking-details',
        pageBuilder: (context, state) {
          return CustomTransitionPage<void>(
            key: state.pageKey,
            opaque: false,
            barrierColor: appBlack.withOpacity(0.5),
            transitionDuration: const Duration(milliseconds: 300),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return child;
            },
            child: const BookingDetailsScreen(),
          );
        },
      ),
    ],
  );
}



// class AppRouter {
//   late final GoRouter router = GoRouter(
//     routes: <GoRoute>[
//       GoRoute(
//         name: 'home',
//         path: '/',
//         builder: (BuildContext context, GoRouterState state) {
//           return const HomeScreen();
//         },
//       ),
//       GoRoute(
//         name: 'booking-details',
//         path: '/booking-details',
//         pageBuilder: (context, state) {
//           return CustomTransitionPage<void>(
//             key: state.pageKey,
//             opaque: false,
//             barrierColor: appBlack.withOpacity(0.5),
//             transitionDuration: const Duration(milliseconds: 300),
//             reverseTransitionDuration: const Duration(milliseconds: 300),
//             child: const BookingDetailsScreen(),
//             transitionsBuilder:
//                 (context, animation, secondaryAnimation, child) {
//               return child;
//             },
//           );
//         },
//       ),
//     ],
//   );
// }

// Navigator.push(
//   context,
//   PageRouteBuilder(
//     opaque: false,
//     barrierColor: appBlack.withOpacity(0.5),
//     transitionDuration: const Duration(milliseconds: 300),
//     reverseTransitionDuration: const Duration(
//       milliseconds: 300,
//     ),
//     transitionsBuilder: (
//       context,
//       animation,
//       secondaryAnimation,
//       child,
//     ) {
//       return child;
//     },
//     pageBuilder: (context, animation1, animation2) {
//       return BackdropFilter(
//         filter: ImageFilter.blur(
//           sigmaX: 8.0,
//           sigmaY: 8.0,
//         ),
//         child: const BookingDetailsScreen(),
//       );
//     },
//   ),
// ),