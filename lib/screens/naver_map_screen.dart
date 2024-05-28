import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:go_router/go_router.dart';

class NaverMapScreen extends StatefulWidget {
  const NaverMapScreen({super.key});

  @override
  State<NaverMapScreen> createState() => _NaverMapScreenState();
}

class _NaverMapScreenState extends State<NaverMapScreen> {
  late final NaverMapController _mapController;
  late final Image _precachedImage;
  late final Image _barImage;
  final _position = const NLatLng(37, 127);

  @override
  void initState() {
    super.initState();
    _precachedImage = Image.asset("images/cloud_rain.png");
    _barImage = Image.asset("images/bar.png");
  }

  @override
  void didChangeDependencies() {
    precacheImage(_precachedImage.image, context);
    precacheImage(_barImage.image, context);
    super.didChangeDependencies();
  }

  void _onMapCreated(NaverMapController controller) {
    _mapController = controller;

    NOverlayImage.fromWidget(
            widget: _Overlay("흐리고 비", _precachedImage),
            size: const Size(100, 200),
            context: context)
        .then(
      (overlayImage) {
        return controller.addOverlay(
          NMarker(
            id: "sample1",
            position: _position.offsetByMeter(northMeter: -100),
            icon: overlayImage,
          ),
        );
      },
    );
    _addOverlay();
  }

  void _addOverlay() {
    // NOverlayImage.fromAssetImage 으로는 이미지 해상도가 맞지 않아 fromWidget 으로
    NOverlayImage.fromWidget(
      widget: Container(
        child: _barImage,
      ),
      size: const Size(24, 32),
      context: context,
    ).then((overlay) {
      final marker = NMarker(
        id: "marker1",
        position: _position,
        size: const Size(24, 32),
        anchor: const NPoint(0.5, 0),
        icon: overlay,
      );
      _mapController.addOverlay(marker);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton.filled(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black54,
          ),
        ),
      ),
      body: NaverMap(
        onMapReady: _onMapCreated,
        options: NaverMapViewOptions(
          initialCameraPosition: NCameraPosition(target: _position, zoom: 14),
        ),
      ),
    );
  }
}

class _Overlay extends StatelessWidget {
  const _Overlay(this.text, this.precachedImage);
  final String text;
  final Image precachedImage;
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
        precachedImage,
        // SvgPicture.asset('images/cloud_rain.svg'),
      ],
    );
  }
}
