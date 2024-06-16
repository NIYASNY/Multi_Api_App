import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:multi_api_app/controller/weather/location_controller.dart';
import 'package:multi_api_app/controller/weather/maincontroller.dart';
import 'package:multi_api_app/model/weather/current_weather_model.dart';
import 'package:multi_api_app/model/weather/hour_weather_model.dart';
import 'package:multi_api_app/utils/api/weather/api_const.dart';
import 'package:multi_api_app/utils/widgets/weather/images.dart';
import 'package:multi_api_app/view/weather/bot/bot_page.dart';
import 'package:multi_api_app/view/widgets/weather/appbar.dart';
import 'package:multi_api_app/view/widgets/weather/drawer_widget.dart';
import 'package:velocity_x/velocity_x.dart';


//weather screen
class WeatherScreen extends StatefulWidget {
  WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _HomePageState();
}

class _HomePageState extends State<WeatherScreen> {
  var controller = Get.put(MainController());
  var locationController = Get.put(LocationController());

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      drawer: const DrawerWidget(),
      body: Container(
          padding: const EdgeInsets.all(12),
          child: FutureBuilder(
              future: controller.currentWeatherData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  CurrentWeatherData? data =
                      snapshot.data as CurrentWeatherData?;

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                "${data!.name}"
                                    .text
                                    .uppercase
                                    .fontFamily("poppins")
                                    .size(36)
                                    .make(),
                                10.widthBox,
                                "location Using API"
                                    .text
                                    .fontFamily("poppins")
                                    .size(15)
                                    .make(),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/weather/${data.weather[0].icon}.png",
                                  width: 80,
                                  height: 80,
                                ),
                                const SizedBox(
                                  width: 130,
                                ),
                                Text(
                                  "${data.main.temp}$degree",
                                  style: const TextStyle(
                                    fontFamily: "poppins",
                                    fontSize: 64,
                                  ),
                                ),
                                Text(
                                  "${data.weather[0].main}",
                                  style: const TextStyle(
                                    fontFamily: "poppins",
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton.icon(
                                    onPressed: null,
                                    icon: Constants.rounded,
                                    label: Text("${data.main.tempMax}$degree")),
                                TextButton.icon(
                                    onPressed: null,
                                    icon: Constants.expand,
                                    label: Text("${data.main.tempMin}$degree"))
                              ],
                            ),
                          ],
                        ),
                        10.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(3, (index) {
                            var IconList = [clouds, humidity, windspeed];
                            var values = [
                              '${data.clouds.all} %',
                              '${data.main.humidity} %',
                              '${data.wind.speed} km/h'
                            ];

                            return Column(
                              children: [
                                Image.asset(
                                  IconList[index],
                                  width: 60,
                                  height: 60,
                                )
                                    .box
                                    .gray200
                                    .padding(const EdgeInsets.all(8))
                                    .roundedSM
                                    .make(),
                                10.heightBox,
                                values[index].text.gray400.make(),
                              ],
                            );
                          }),
                        ),
                        10.heightBox,
                        const Divider(),
                        10.heightBox,
                        FutureBuilder(
                          future: controller.hourWeatherData,
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              HourlyWeatherData hourlyData = snapshot.data;

                              return SizedBox(
                                height: 160,
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: hourlyData.list!.length > 6
                                      ? 6
                                      : hourlyData.list!.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var time = DateFormat.jm().format(
                                        DateTime.fromMillisecondsSinceEpoch(
                                            hourlyData.list![index].dt!
                                                    .toInt() *
                                                1000));

                                    return Container(
                                      padding: const EdgeInsets.all(8),
                                      margin: const EdgeInsets.only(right: 4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        children: [
                                          time.text.make(),
                                          Image.asset(
                                            "assets/weather/${hourlyData.list![index].weather![0].icon}.png",
                                            width: 80,
                                          ),
                                          10.heightBox,
                                          "${hourlyData.list![index].main!.temp}$degree"
                                              .text
                                              .make(),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                        10.heightBox,
                        const Divider(),
                        10.heightBox,
                        Obx(
                          () => Row(
                            children: [
                              locationController.city.value.text.uppercase
                                  .fontFamily("poppins")
                                  .size(15)
                                  .make(),
                              10.widthBox,
                              "using Geolocator"
                                  .text
                                  .fontFamily("poppins")
                                  .size(10)
                                  .make(),
                            ],
                          ),
                        ),
                        10.heightBox,
                        const Divider(),
                        20.heightBox,
                        Column(
                          children: [
                            " AccuBot is Here to help You! "
                                .text
                                .fontFamily("poppins_light")
                                .size(25)
                                .make(),
                            IconButton(
                              icon: Image.asset('assets/icons/robot.gif'),
                              iconSize: 70,
                              onPressed: () {
                                Get.off(() =>const BotPage());
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })),
    );
  }
}
