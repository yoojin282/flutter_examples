import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class NaverMapScreen extends StatefulWidget {
  const NaverMapScreen({super.key});

  @override
  State<NaverMapScreen> createState() => _NaverMapScreenState();
}

class _NaverMapScreenState extends State<NaverMapScreen> {
  late final NaverMapController _mapController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NaverMap(
        onMapReady: (controller) => _mapController = controller,
        options: const NaverMapViewOptions(
          initialCameraPosition:
              NCameraPosition(target: NLatLng(37, 127), zoom: 14),
        ),
      ),
    );
  }
}
