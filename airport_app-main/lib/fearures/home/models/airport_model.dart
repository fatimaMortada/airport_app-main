class AirportModel {
  final String airportCode;
  final String airportName;
  final String location;

  AirportModel(
    this.airportCode,
    this.airportName,
    this.location,
  );

  factory AirportModel.fromJson(Map<String, dynamic> json) {
    return AirportModel(
      json['AirportCode'] as String,
      json['AirportName'] as String,
      json['Location'] as String,
    );
  }
}
