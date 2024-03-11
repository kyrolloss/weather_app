import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:weather_app/components/Text.dart';
import '../../cubits/app_cubit.dart';
import 'package:intl/intl.dart';

class FutureScreen extends StatefulWidget {
  const FutureScreen({super.key});

  @override
  State<FutureScreen> createState() => _FutureScreenState();
}

class _FutureScreenState extends State<FutureScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var height = MediaQuery.of(context).size.height;
        var width = MediaQuery.of(context).size.width;

        DateTime? _selectedDate = DateTime.tryParse('yyyy-MM-dd');
        int? year;
        int? month;
        int? day;

        Future<void> _showCalendar(BuildContext context) async {
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
          );
          if (picked != null && picked != _selectedDate) {
            setState(() {
              _selectedDate = picked;
              year = _selectedDate!.year;
              month = _selectedDate!.month;
              day = _selectedDate!.day;
            });
          }
        }

        var cubit = AppCubit.get(context);
        if (state is FutureWeatherLoading && cubit.futureWeather == null) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return Scaffold(
            body: Container(
          decoration: cubit.futureWeather!['forecast']['forecastday'][0]["day"]
                      ['avgtemp_c'] >
                  26.5
              ? BoxDecoration(
                  gradient: RadialGradient(colors: [
                  Colors.deepOrange.withOpacity(.7),
                  Colors.deepOrange.withOpacity(.875),
                  Colors.white
                ], center: Alignment.topRight, radius: 1.5))
              : cubit.futureWeather!['forecast']['forecastday'][0]["day"]
                          ['avgtemp_c'] <
                      19
                  ? BoxDecoration(
                      gradient: RadialGradient(colors: [
                      Colors.blue.withOpacity(.7),
                      Colors.blue.withOpacity(.875),
                      Colors.blueAccent.withOpacity(.875),
                      Colors.white
                    ], center: Alignment.topRight, radius: 1.5))
                  : BoxDecoration(
                      gradient: RadialGradient(colors: [
                      Colors.lightGreenAccent.withOpacity(.875),
                      Colors.lightGreenAccent.withOpacity(.875),
                      Colors.white
                    ], center: Alignment.topRight, radius: 1.5)),
          child: Padding(
            padding: const EdgeInsets.all(17.5),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BuildText(
                          text: cubit.futureWeather!['forecast']['forecastday']
                              [0]['date'],
                          size: 25,
                          color: Colors.black,
                          bold: true,
                        ),
                        IconButton(
                          onPressed: () async {
                            await _showCalendar(context);

                            if (_selectedDate != null) {
                              String month2;
                              String day2;
                              month! < 10
                                  ? month2 = '0$month'
                                  : month2 = month.toString();
                              day! < 10
                                  ? day2 = '0$day'
                                  : day2 = day.toString();

                              String date = '${year.toString()}-$month2-$day2';
                              await cubit.getFutureWeather(
                                  city: cubit.country, date: date);
                            }
                          },
                          icon: const Icon(
                            Icons.calendar_today,
                            // Use a more appropriate calendar icon
                            size: 30,
                          ),
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  BuildText(
                    text:
                        'Date should be between 14 days and 300 days from today in the future.',
                    size: 17.5,
                    color: Colors.black,
                    bold: true,
                    maxLines: 3,
                  ),
                  SizedBox(
                    height: height * .3,
                  ),
                  SizedBox(
                    height: height * .125,
                    child: Row(
                      children: [
                        Text(
                            cubit.futureWeather!['forecast']['forecastday'][0]
                                    ["day"]['avgtemp_c']
                                .toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: 80,
                                height: .5)),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(12.5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.arrow_upward_rounded),
                                  BuildText(
                                    text: cubit.futureWeather!['forecast']
                                            ['forecastday'][0]["day"]
                                            ['maxtemp_c']
                                        .toString(),
                                    size: 15,
                                    color: Colors.black,
                                    bold: true,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  const Icon(Icons.arrow_upward_rounded),
                                  BuildText(
                                    text: cubit.futureWeather!['forecast']
                                            ['forecastday'][0]["day"]
                                            ['mintemp_c']
                                        .toString(),
                                    size: 15,
                                    color: Colors.black,
                                    bold: true,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: height * .05,
                    thickness: 6,
                    color: Colors.black,
                  ),
                  BuildText(
                    text: cubit.futureWeather!['forecast']['forecastday'][0]
                            ["day"]['condition']['text']
                        .toString(),
                    size: 25,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  SizedBox(
                    height: height * .2,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        String variable = cubit.futureWeather!['forecast']
                            ['forecastday'][0]["hour"][index]['time'];
                        DateTime dateTime = DateTime.parse(variable);
                        String time = DateFormat.jm().format(dateTime);
                        return SizedBox(
                          height: height * .05,
                          width: width * .2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              BuildText(
                                text: cubit.futureWeather!['forecast']
                                        ['forecastday'][0]["hour"][index]
                                        ['temp_c']
                                    .toString(),
                                size: 15,
                                color: Colors.black,
                                bold: true,
                              ),
                              index < 3
                                  ? const Icon(
                                      Icons.sunny,
                                      size: 37.5,
                                    )
                                  : const Icon(
                                      Icons.cloudy_snowing,
                                      size: 37.5,
                                    ),
                              BuildText(
                                text: time,
                                size: 12.5,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}
