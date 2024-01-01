class AircraftModel {
  final int aircraftID;
  final String aircraftType;
  final String airlineCode;

  AircraftModel(
    this.aircraftID,
    this.aircraftType,
    this.airlineCode,
  );

  factory AircraftModel.fromJson(Map<String, dynamic> json) {
    return AircraftModel(
      json['AircraftID'] as int,
      json['AircraftType'] as String,
      json['AirlineCode'] as String,
    );
  }
}
