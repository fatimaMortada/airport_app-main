class FlightModel {
  final String flightNumber;
  final String departureAirportCode;
  final String destinationAirportCode;
  final String departureTime;
  final String arrivalTime;
  final int aircraftID;

  FlightModel(
    this.flightNumber,
    this.departureAirportCode,
    this.departureTime,
    this.aircraftID,
    this.arrivalTime,
    this.destinationAirportCode,
  );

  factory FlightModel.fromJson(Map<String, dynamic> json) {
    return FlightModel(
      json['FlightNumber'] as String,
      json['DepartureAirportCode'] as String,
      json['DepartureTime'] as String,
      json['AircraftID'] as int,
      json['ArrivalTime'] as String,
      json['DestinationAirportCode'] as String,
    );
  }
}
