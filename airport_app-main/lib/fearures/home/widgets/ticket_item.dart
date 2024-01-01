import 'package:airport_app/fearures/home/models/aircraft_model.dart';
import 'package:airport_app/fearures/home/models/airport_model.dart';
import 'package:airport_app/fearures/home/models/flight_model.dart';
import 'package:airport_app/utils/mds.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TicketItem extends StatelessWidget {
  const TicketItem(
      {super.key,
      required this.flightModel,
      required this.aircraftModel,
      required this.airportModel});

  final FlightModel flightModel;
  final List<AircraftModel> aircraftModel;
  final List<AirportModel> airportModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: whiteColor,
        surfaceTintColor: whiteColor,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 65,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(
                      12,
                    ),
                    topLeft: Radius.circular(
                      12,
                    ),
                  ),
                  color: mainColor),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        flightModel.departureAirportCode,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: whiteColor.withOpacity(.8),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                          ),
                          child: Column(
                            children: [
                              Text(
                                flightModel.flightNumber,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: whiteColor.withOpacity(.8)),
                              ),
                              const Divider(
                                thickness: 2,
                                color: whiteColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        flightModel.destinationAirportCode,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: whiteColor.withOpacity(.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ExpansionTile(
              shape: Border.all(color: Colors.transparent),
              expandedAlignment: Alignment.centerLeft,
              childrenPadding: const EdgeInsets.all(
                16,
              ),
              tilePadding: const EdgeInsets.symmetric(horizontal: 12),
              subtitle: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "United Airlines",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "\$299",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      formatDate(flightModel.departureTime),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              title: const SizedBox(),
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              flightModel.departureAirportCode,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              airportModel
                                  .firstWhere(
                                    (element) =>
                                        element.airportCode ==
                                        flightModel.departureAirportCode,
                                    orElse: () =>
                                        AirportModel('', 'Unknown Airport', ''),
                                  )
                                  .location,
                              style: TextStyle(
                                fontSize: 14,
                                color: greyColor,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Flight Time",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              calculateTimeDifference(
                                flightModel.departureTime,
                                flightModel.arrivalTime,
                              ),
                              style: TextStyle(
                                fontSize: 14,
                                color: greyColor,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              flightModel.destinationAirportCode,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              airportModel
                                  .firstWhere(
                                    (element) =>
                                        element.airportCode ==
                                        flightModel.destinationAirportCode,
                                    orElse: () =>
                                        AirportModel('', 'Unknown Airport', ''),
                                  )
                                  .location,
                              style: TextStyle(
                                fontSize: 14,
                                color: greyColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              formatTime(flightModel.departureTime),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.circle,
                            size: 12,
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 2,
                            ),
                          ),
                          Icon(
                            Icons.circle,
                            size: 12,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              formatTime(flightModel.arrivalTime),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

String formatDate(String input) {
  DateTime dateTime = DateTime.parse(input);

  String formattedDate = "${dateTime.month}/${dateTime.day}/${dateTime.year}";

  return formattedDate;
}

String formatTime(String input) {
  DateTime dateTime = DateTime.parse(input);

  String formattedTime = DateFormat('h:mm a').format(dateTime);

  return formattedTime;
}

String calculateTimeDifference(String departureTime, String arrivalTime) {
  DateTime departureDateTime = DateTime.parse(departureTime);
  DateTime arrivalDateTime = DateTime.parse(arrivalTime);

  Duration difference = arrivalDateTime.difference(departureDateTime);

  int hours = difference.inHours;
  int minutes = difference.inMinutes.remainder(60);

  String formattedDifference = '$hours h $minutes m';

  return formattedDifference;
}
