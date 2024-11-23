class MockAddressData {
  static List<Map<String, dynamic>> getAddresses() {
    return [
      {
        "formatted_address": "123 Main Street, Cityville, Country",
        "latitude": 20.9501,
        "longitude": 105.8249,
        "place_id": "mock_place_id_1",
      },
      {
        "formatted_address": "456 Side Road, Townland, Country",
        "latitude": 21.0021,
        "longitude": 105.8502,
        "place_id": "mock_place_id_2",
      },
    ];
  }

  static Map<String, dynamic>? getPlaceDetails(String placeId) {
    final addresses = getAddresses();
    return addresses.firstWhere(
      (address) => address['place_id'] == placeId,
      orElse: () => {},
    );
  }
}
