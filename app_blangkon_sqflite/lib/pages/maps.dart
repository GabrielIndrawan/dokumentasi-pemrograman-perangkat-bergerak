import 'package:app_blangkon_sqflite/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Maps extends StatelessWidget {
  const Maps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: FlutterMap(
          options: const MapOptions(
            initialCenter: LatLng(-7.240270, 110.536200),
            initialZoom: 15.0
          ),
          children: [
            TileLayer(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: const ['a', 'b', 'c'],
              userAgentPackageName: "Gabriel Indrawan",
            )
          ],
        ),
      ),
    );
  }
}