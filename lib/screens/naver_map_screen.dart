import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class NaverMapScreen extends StatefulWidget {
  const NaverMapScreen({super.key});

  @override
  State<NaverMapScreen> createState() => _NaverMapScreenState();
}

class _NaverMapScreenState extends State<NaverMapScreen> {
  // late final NaverMapController _mapController;

  void _onMapCreated(NaverMapController controller) {
    // _mapController = controller;

    NOverlayImage.fromWidget(
            widget: const _Overlay("흐리고 비"),
            size: const Size(100, 200),
            context: context)
        .then(
      (overlayImage) {
        return controller.addOverlay(
          NMarker(
            id: "sample1",
            size: const Size(100, 200),
            position: const NLatLng(37, 127),
            icon: overlayImage,
            // anchor: const NPoint(0.1, 0.7),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NaverMap(
        onMapReady: _onMapCreated,
        options: const NaverMapViewOptions(
          initialCameraPosition:
              NCameraPosition(target: NLatLng(37, 127), zoom: 14),
        ),
      ),
    );
  }
}

class _Overlay extends StatelessWidget {
  const _Overlay(this.text);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        // SvgPicture.asset('images/cloud_rain.svg'),
        Image.asset("images/cloud_rain.png"),
      ],
    );
  }
}
