import 'package:bazar/core/utils/helpers/dependency_helpers.dart';
import 'package:bazar/data/repostories/location_repositories.dart';
import 'package:bazar/presentation/screens/cart_screen/bloc/location_cubit/location_cubit.dart';
import 'package:bazar/presentation/screens/cart_screen/bloc/location_cubit/location_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class SelectMyLocation extends StatefulWidget {
  const SelectMyLocation({super.key});

  @override
  State<SelectMyLocation> createState() => _SelectMyLocationState();
}

class _SelectMyLocationState extends State<SelectMyLocation> {
  late YandexMapController mapController;

  Point myCurrentLocation = const Point(
    latitude: 41.2856806,
    longitude: 69.9034646,
  );

  void onMapCreated(YandexMapController controller) async {
    mapController = controller;
    final myLocation = await getIt<LocationRepositories>().getMyLocation();
    print("bu my location $myLocation");
    if (myLocation != null) {
      mapController.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: myLocation,
            zoom: 200,
          ),
        ),
      );
    }
    // setState(() {});
  }

  void onCameraPositionChanged(
    CameraPosition position,
    CameraUpdateReason reason,
    bool finished,
  ) async {
    myCurrentLocation = position.target;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LocationCubit, LocationCubitState>(
        listener: (context, state) {
          if (state is ErrorLocationCubitState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return YandexMap(
            mapType: MapType.vector,
            onMapCreated: onMapCreated,
            onCameraPositionChanged: onCameraPositionChanged,
            mapObjects: [
              PlacemarkMapObject(
                mapId: const MapObjectId("najotTalim"),
                point: myCurrentLocation,
                icon: PlacemarkIcon.single(
                  PlacemarkIconStyle(
                    image: BitmapDescriptor.fromAssetImage(
                      "assets/images/place.png",
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
