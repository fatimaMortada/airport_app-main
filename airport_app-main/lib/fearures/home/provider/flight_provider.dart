import 'dart:convert';

import 'package:airport_app/fearures/home/models/aircraft_model.dart';
import 'package:airport_app/fearures/home/models/airport_model.dart';
import 'package:airport_app/fearures/home/models/flight_model.dart';
import 'package:airport_app/fearures/home/models/flight_provider_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class FlightProvider extends ChangeNotifier {
  final FlightProviderModel _flightProviderModel = FlightProviderModel();

  List<FlightModel> get flights => _flightProviderModel.flights;
  List<AircraftModel> get planes => _flightProviderModel.planes;
  List<AirportModel> get airports => _flightProviderModel.airports;

  bool get isLoading => _flightProviderModel.isLoading;

  Future<void> fetchData() async {
    setLoading(true);
    try {
      final response = await http
          .get(Uri.parse('https://fatima11.000webhostapp.com/test.php'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        final List<dynamic> flightsData = data['Flight'];
        final List<FlightModel> flightsList = flightsData
            .map((flightData) => FlightModel.fromJson(flightData))
            .toList();

        final List<dynamic> airportData = data['Airport'];
        final List<AirportModel> airportList = airportData
            .map((airportData) => AirportModel.fromJson(airportData))
            .toList();

        final List<dynamic> aircraftData = data['Aircraft'];
        final List<AircraftModel> planeList = aircraftData
            .map((aircraftData) => AircraftModel.fromJson(aircraftData))
            .toList();
        setFlights(flightsList);
        setAirports(airportList);
        setPlanes(planeList);
      } else {
        print('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
    setLoading(false);
  }

  void setFlights(List<FlightModel> flightsData) {
    _flightProviderModel.flights = flightsData;
    notifyListeners();
  }

  void setPlanes(List<AircraftModel> data) {
    _flightProviderModel.planes = data;
    notifyListeners();
  }

  void setAirports(List<AirportModel> data) {
    _flightProviderModel.airports = data;
    notifyListeners();
  }

  void setLoading(bool status) {
    _flightProviderModel.isLoading = status;
    notifyListeners();
  }
}
