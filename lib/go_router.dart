import 'package:examples/screens/home_screen.dart';
import 'package:examples/screens/naver_map_screen.dart';
import 'package:go_router/go_router.dart';

final routerConfig = GoRouter(
  initialLocation: "/home",
  routes: _routes,
);

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
