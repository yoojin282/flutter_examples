import 'package:examples/constants.dart';
import 'package:examples/screens/home_screen.dart';
import 'package:examples/screens/naver_map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NaverMapSdk.instance.initialize(clientId: Constants.mapKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '예제모음',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: GoRouter(
        initialLocation: "/home",
        routes: _routes,
      ),
      // home: const HomeScreen(),
    );
  }
}

List<GoRoute> _routes = [
  GoRoute(
    path: "/home",
    name: "home",
    builder: (_, __) => const HomeScreen(),
  ),
  GoRoute(
    path: "/naver_map",
    name: "naver_map",
    builder: (context, state) => const NaverMapScreen(),
  ),
];
