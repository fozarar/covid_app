import 'package:covid_app/utils/colors.dart';
import 'package:covid_app/widgets/appbar.dart';
import 'package:covid_app/widgets/card_item.dart';
import 'package:covid_app/widgets/header_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CovidDataController _covidDataController = Get.find();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _covidDataController.getGlobalCovidDataNum();
    _covidDataController.getCountryCovidDataNum();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: CustomAppBar(
          onPressed: () {
            _covidDataController.getGlobalCovidDataNum();
            _covidDataController.getCountryCovidDataNum();
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: Get.height * 0.13,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  Container(
                    color: kPrimaryColor,
                    height: 100,
                    width: 100,
                    margin: const EdgeInsets.all(32),
                    child: Image.asset(
                      'assets/images/covid_image.png',
                      color: Colors.white,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const HeaderText(text: 'Global'),
                    const SizedBox(height: 8),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(40), // if you need this
                        side: BorderSide(
                          color: Colors.grey.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: Get.height * 0.12,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Row(
                              children: [
                                CardItem(
                                  title: 'New Confirmed',
                                  globalText:
                                      _covidDataController.countryData.isEmpty
                                          ? const Text('Please refresh')
                                          : Text(_covidDataController
                                              .globalData.first.newConfirmed
                                              .toString()),
                                ),
                                CardItem(
                                  title: 'Total Confirmed',
                                  globalText:
                                      _covidDataController.globalData.isEmpty
                                          ? const Text('Please refresh')
                                          : Text(
                                              _covidDataController.globalData
                                                  .first.totalConfirmed
                                                  .toString(),
                                            ),
                                ),
                                CardItem(
                                  title: 'New Deaths',
                                  globalText:
                                      _covidDataController.globalData.isEmpty
                                          ? const Text('Please refresh')
                                          : Text(
                                              _covidDataController
                                                  .globalData.first.newDeaths
                                                  .toString(),
                                            ),
                                ),
                                CardItem(
                                  title: 'Total Deaths',
                                  globalText:
                                      _covidDataController.globalData.isEmpty
                                          ? const Text('Please refresh')
                                          : Text(
                                              _covidDataController
                                                  .globalData.first.totalDeaths
                                                  .toString(),
                                            ),
                                ),
                                CardItem(
                                  title: 'New Recovered',
                                  globalText:
                                      _covidDataController.globalData.isEmpty
                                          ? const Text('Please refresh')
                                          : Text(
                                              _covidDataController
                                                  .globalData.first.newConfirmed
                                                  .toString(),
                                            ),
                                ),
                                CardItem(
                                  title: 'Total Recovered',
                                  globalText:
                                      _covidDataController.globalData.isEmpty
                                          ? const Text('Please refresh')
                                          : Text(
                                              _covidDataController.globalData
                                                  .first.totalRecovered
                                                  .toString(),
                                            ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const HeaderText(text: 'Countries'),
                    SizedBox(
                      width: 500,
                      height: Get.height,
                      child: ListView.builder(
                        itemCount: _covidDataController.countryData.length,
                        itemBuilder: (context, i) => Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(40), // if you need this
                            side: BorderSide(
                              color: Colors.grey.withOpacity(0.2),
                              width: 1,
                            ),
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            height: 200,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CardItem(
                                      title: 'Country',
                                      globalText: _covidDataController
                                              .countryData.isEmpty
                                          ? const Text('Please refresh')
                                          : Text(
                                              _covidDataController
                                                  .countryData[i].country
                                                  .toString(),
                                            ),
                                    ),
                                    CardItem(
                                      title: 'New Confirmed',
                                      globalText: _covidDataController
                                              .countryData.isEmpty
                                          ? const Text('Please refresh')
                                          : Text(
                                              _covidDataController
                                                  .countryData[i].newConfirmed
                                                  .toString(),
                                            ),
                                    ),
                                    CardItem(
                                      title: 'Total Confirmed',
                                      globalText: _covidDataController
                                              .countryData.isEmpty
                                          ? const Text('Please refresh')
                                          : Text(
                                              _covidDataController
                                                  .countryData[i].totalConfirmed
                                                  .toString(),
                                            ),
                                    ),
                                    CardItem(
                                      title: 'New Deaths',
                                      globalText: _covidDataController
                                              .countryData.isEmpty
                                          ? const Text('Please refresh')
                                          : Text(
                                              _covidDataController
                                                  .countryData[i].newDeaths
                                                  .toString(),
                                            ),
                                    ),
                                    CardItem(
                                      title: 'Total Deaths',
                                      globalText: _covidDataController
                                              .countryData.isEmpty
                                          ? const Text('Please refresh')
                                          : Text(
                                              _covidDataController
                                                  .countryData[i].totalDeaths
                                                  .toString(),
                                            ),
                                    ),
                                    CardItem(
                                      title: 'New Recovered',
                                      globalText: _covidDataController
                                              .countryData.isEmpty
                                          ? const Text('Please refresh')
                                          : Text(
                                              _covidDataController
                                                  .countryData[i].newRecovered
                                                  .toString(),
                                            ),
                                    ),
                                    CardItem(
                                      title: 'Total Recovered',
                                      globalText: _covidDataController
                                              .countryData.isEmpty
                                          ? const Text('Please refresh')
                                          : Text(
                                              _covidDataController
                                                  .countryData[i].totalRecovered
                                                  .toString(),
                                            ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
