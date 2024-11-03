import 'dart:math';

import 'package:hpc_food/models/distane_time.dart';

class Distance {
  DistanceTime calculateDistanceTimePrice(double lat1, double lon1, double lat2,
      double lon2, double speedKmPerHr, double pricePerKm) {
    var rLat1 = _toRadians(lat1);
    var rLon1 = _toRadians(lon1);
    var rLat2 = _toRadians(lat2);
    var rLon2 = _toRadians(lon2);

    var dLat = rLat2 - rLat1;
    var dLon = rLon2 - rLon1;
    var a =
        pow(sin(dLat / 2), 2) + cos(rLat1) * cos(rLat2) * pow(sin(dLon / 2), 2);
    var c = 2 * atan2(sqrt(a), sqrt(1 - a));

    const double earthRadiusKm = 6371.0;
    var distance = (earthRadiusKm * 2) * c;

    var time = distance / speedKmPerHr;

    var price = distance * pricePerKm;

    return DistanceTime(distance: distance, time: time, price: price);
  }

  double _toRadians(double degree) {
    return degree * pi / 180;
  }
}