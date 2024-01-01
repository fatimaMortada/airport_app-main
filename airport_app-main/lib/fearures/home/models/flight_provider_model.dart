import 'package:airport_app/fearures/home/models/aircraft_model.dart';
import 'package:airport_app/fearures/home/models/airport_model.dart';
import 'package:airport_app/fearures/home/models/flight_model.dart';

class FlightProviderModel {
  List<FlightModel> flights = [];
  List<AircraftModel> planes = [];
  List<AirportModel> airports = [];

  bool isLoading = false;
}
