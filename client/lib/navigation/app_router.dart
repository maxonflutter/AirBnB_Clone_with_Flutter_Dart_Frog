import 'package:client/screens/home_screen.dart';
import 'package:client/screens/planning_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app_routes.dart';

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
        name: 'some-dialog',
        path: '/some-dialog',
        pageBuilder: (context, state) => NoTransitionPage<void>(
          child: HeroControllerScope(
            controller: MaterialApp.createMaterialHeroController(),
            child: const PlanningScreen(),
          ),
        ),

        // pageBuilder: (BuildContext context, GoRouterState state) {
        //   // return CustomTransitionPage<void>(
        //   //   key: state.pageKey,
        //   //   child: const SomeDialog(),
        //   //   barrierDismissible: true,
        //   //   barrierColor: Colors.black38,
        //   //   opaque: false,
        //   //   transitionDuration: Duration.zero,
        //   //   transitionsBuilder: (_, __, ___, Widget child) => child,
        //   // );
        //   return CustomTransitionPage<void>(
        //     key: state.pageKey,
        //     child: const SomeDialog(),
        //     transitionDuration: const Duration(milliseconds: 000),
        //     transitionsBuilder: (
        //       BuildContext context,
        //       Animation<double> animation,
        //       Animation<double> secondaryAnimation,
        //       Widget child,
        //     ) {
        //       return child;
        //     },
        //   );
        // },
      ),
    ],
  );
}

// /// The route configuration.
// final GoRouter _router = GoRouter(
//   routes: <RouteBase>[
//     GoRoute(
//       path: '/',
//       builder: (BuildContext context, GoRouterState state) {
//         return const HomeScreen();
//       },
//       routes: <RouteBase>[
//         GoRoute(
//           path: 'details',
//           pageBuilder: (BuildContext context, GoRouterState state) {
//             return CustomTransitionPage<void>(
//               key: state.pageKey,
//               child: const DetailsScreen(),
//               transitionDuration: const Duration(milliseconds: 150),
//               transitionsBuilder: (BuildContext context,
//                   Animation<double> animation,
//                   Animation<double> secondaryAnimation,
//                   Widget child) {
//                 // Change the opacity of the screen using a Curve based on the the animation's
//                 // value
//                 return FadeTransition(
//                   opacity:
//                       CurveTween(curve: Curves.easeInOut).animate(animation),
//                   child: child,
//                 );
//               },
//             );
//           },
//         ),
//         GoRoute(
//           path: 'dismissible-details',
//           pageBuilder: (BuildContext context, GoRouterState state) {
//             return CustomTransitionPage<void>(
//               key: state.pageKey,
//               child: const DismissibleDetails(),
//               barrierDismissible: true,
//               barrierColor: Colors.black38,
//               opaque: false,
//               transitionDuration: Duration.zero,
//               transitionsBuilder: (_, __, ___, Widget child) => child,
//             );
//           },
//         ),
//         GoRoute(
//           path: 'custom-reverse-transition-duration',
//           pageBuilder: (BuildContext context, GoRouterState state) {
//             return CustomTransitionPage<void>(
//               key: state.pageKey,
//               child: const DetailsScreen(),
//               barrierDismissible: true,
//               barrierColor: Colors.black38,
//               opaque: false,
//               transitionDuration: const Duration(milliseconds: 500),
//               reverseTransitionDuration: const Duration(milliseconds: 200),
//               transitionsBuilder: (BuildContext context,
//                   Animation<double> animation,
//                   Animation<double> secondaryAnimation,
//                   Widget child) {
//                 return FadeTransition(
//                   opacity: animation,
//                   child: child,
//                 );
//               },
//             );
//           },
//         ),
//       ],
//     ),
//   ],
// );

// /// The main app.
// class MyApp extends StatelessWidget {
//   /// Constructs a [MyApp]
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routerConfig: _router,
//     );
//   }
// }

// /// The home screen
// class HomeScreen extends StatelessWidget {
//   /// Constructs a [HomeScreen]
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Home Screen')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () => context.go('/details'),
//               child: const Text('Go to the Details screen'),
//             ),
//             const SizedBox(height: 48),
//             ElevatedButton(
//               onPressed: () => context.go('/dismissible-details'),
//               child: const Text('Go to the Dismissible Details screen'),
//             ),
//             const SizedBox(height: 48),
//             ElevatedButton(
//               onPressed: () =>
//                   context.go('/custom-reverse-transition-duration'),
//               child: const Text(
//                 'Go to the Custom Reverse Transition Duration Screen',
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /// The details screen
// class DetailsScreen extends StatelessWidget {
//   /// Constructs a [DetailsScreen]
//   const DetailsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Details Screen')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () => context.go('/'),
//               child: const Text('Go back to the Home screen'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /// The dismissible details screen
// class DismissibleDetails extends StatelessWidget {
//   /// Constructs a [DismissibleDetails]
//   const DismissibleDetails({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Padding(
//       padding: EdgeInsets.all(48),
//       child: ColoredBox(color: Colors.red),
//     );
//   }
// }
