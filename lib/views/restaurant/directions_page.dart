import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hpc_food/constants/constants.dart';

class DirectionsPage extends StatefulWidget {
  const DirectionsPage({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;

  @override
  State<DirectionsPage> createState() => _DirectionsPageState();
}

class _DirectionsPageState extends State<DirectionsPage> {
  GoogleMapController? _mapController;
  LatLng? _selectedPosition;

  @override
  void initState() {
    super.initState();
    _selectedPosition = LatLng(widget.latitude, widget.longitude);
  }

  void moveToSelectedPosition() {
    if (_selectedPosition != null && _mapController != null) {
      _mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: _selectedPosition!,
            zoom: 15,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cOffWhite,
        elevation: 0,
        title: const Text('Địa chỉ cửa hàng'),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            AntDesign.closecircleo,
            color: cRed,
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          onMapCreated: (GoogleMapController controller) {
            _mapController = controller;
            moveToSelectedPosition();
          },
          initialCameraPosition: CameraPosition(
            target:
                _selectedPosition ?? LatLng(widget.latitude, widget.longitude),
            zoom: 15,
          ),
          markers: {
            Marker(
              markerId: const MarkerId('Vị trí cửa hàng'),
              position: _selectedPosition ??
                  LatLng(widget.latitude, widget.longitude),
            ),
          },
        ),
      ),
    );
  }
}
