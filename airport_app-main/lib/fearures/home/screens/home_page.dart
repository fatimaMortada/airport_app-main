// ignore_for_file: unused_import

import 'dart:math';

import 'package:airport_app/fearures/home/provider/flight_provider.dart';
import 'package:airport_app/fearures/home/widgets/home_banner.dart';
import 'package:airport_app/fearures/home/widgets/list_banners.dart';
import 'package:airport_app/fearures/home/widgets/search_bar.dart';
import 'package:airport_app/fearures/home/widgets/ticket_item.dart';
import 'package:airport_app/utils/mds.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  final PageController _pageController = PageController(initialPage: 0);
  final List<String> images = [
    "images/banner1.jpg",
    "images/banner2.jpg",
    "images/banner3.jpg",
  ];
  FlightProvider _flightProvider = FlightProvider();

  @override
  void didChangeDependencies() {
    _flightProvider = Provider.of<FlightProvider>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    Provider.of<FlightProvider>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        title: const Text(
          "Home",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: whiteColor,
          ),
        ),
      ),
      body: Consumer<FlightProvider>(builder: (context, flightProvider, _) {
        return flightProvider.isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: mainColor,
                ),
              )
            : _flightProvider.flights.isEmpty
                ? const Center(
                    child: Text("No Flights Found"),
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HomeSearchBar(
                          searchController: _searchController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListBanners(
                          pageController: _pageController,
                          items: images,
                        ),
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Flights Available:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: flightProvider.flights.length,
                            itemBuilder: (context, pos) {
                              return TicketItem(
                                flightModel: flightProvider.flights[pos],
                                aircraftModel: flightProvider.planes,
                                airportModel: flightProvider.airports,
                              );
                            }),
                      )
                    ],
                  );
      }),
    );
  }
}
