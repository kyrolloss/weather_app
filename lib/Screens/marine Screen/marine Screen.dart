import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/components/Text.dart';
import '../../components/wave Container.dart';
import '../../cubits/app_cubit.dart';

class MarineScreen extends StatelessWidget {
  const MarineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        if (state is MarineWeatherLoading || cubit.marineWeather == null) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
            body: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            List<dynamic> tides = cubit.marineWeather!['forecast']
                ['forecastday'][0]['day']['tides'][0]['tide'];
            Map<String, dynamic> firstTide = tides[index];

            return Stack(
              children: [
                Container(
                  height: height,
                  width: width,
                  decoration: const BoxDecoration(
                    color: Color(0xffA6763C),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50.0),
                          child: BuildText(
                            text: 'Tides',
                            color: Colors.white,
                            bold: true,
                            size: 20,
                          ),
                        ),
                        BuildText(
                          text: firstTide['tide_time'],
                          color: Colors.white,
                          bold: true,
                          size: 20,
                          maxLines: 3,
                        ),
                        SizedBox(
                          height: height * .003,
                        ),
                        Divider(
                          height: height * .15,
                        ),
                        SizedBox(
                          height: height * .003,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BuildText(
                                text: 'HIGH',
                                color: Colors.white,
                                bold: true,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: height * .15,
                        ),
                        SizedBox(
                          height: height * .003,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BuildText(
                                text: 'Wind',
                                color: Colors.white,
                                bold: true,
                                size: 20,
                              ),
                              SizedBox(
                                height: height * .1,
                                width: width * .25,
                                child: Center(
                                  child: BuildText(
                                    text:
                                        '${cubit.marineWeather!['forecast']['forecastday'][0]['hour'][0]['wind_kph'].toString()} KM h',
                                    color: Colors.white,
                                    bold: true,
                                    size: 20,
                                    maxLines: 3,
                                    letterSpacing: 1,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: height * .15,
                        ),
                        SizedBox(
                          height: height * .003,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BuildText(
                                text: 'LOW',
                                color: Colors.white,
                                bold: true,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * .1,
                        ),
                        BuildText(
                          text: '22 AUGUST',
                          color: Colors.white,
                          bold: true,
                          size: 20,
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    child: SizedBox(
                      height: height * .3,
                      width: width,
                      child: firstTide['tide_type'] == "HIGH"
                          ? CustomPaint(
                              painter: WavePainter(
                              height: height * .3,
                              color: Colors.lightBlueAccent.withOpacity(.65),
                              waveAmplitude: 25,
                              // Adjust this value to change the height of the wave
                              waveFrequency: 10,
                              number:
                                  -1, // Adjust this value to change the number of waves
                            ))
                          : CustomPaint(
                              painter: WavePainter(
                              height: height * .3,
                              color: Colors.lightBlueAccent.withOpacity(.65),
                              waveAmplitude: 25,
                              // Adjust this value to change the height of the wave
                              waveFrequency: 10,
                              number:
                                  2.5, // Adjust this value to change the number of waves
                            )),
                    ))
              ],
            );
          },
        ));
      },
    );
  }
}
