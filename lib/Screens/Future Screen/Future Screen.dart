import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/components/Text.dart';

import '../../cubits/app_cubit.dart';

class FutureScreen extends StatelessWidget {
  const FutureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    var cubit = AppCubit.get(context);
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: RadialGradient(
              colors: [
            Colors.deepOrange.withOpacity(.7),
            Colors.deepOrange.withOpacity(.875),
            Colors.white
          ],
              center: Alignment.topRight,
              radius: 1.5)),
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
                      text: 'Fir Jan 4',
                      size: 25,
                      color: Colors.black,
                      bold: true,
                    ),
                    IconButton(
                      onPressed: () {
                        cubit.getCurrentWeather(city: 'cairo');
                        print(cubit.currentWeather);
                      },
                      icon: const Icon(Icons.menu , size: 30,),
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * .3,
              ),
              SizedBox(
                height: height * .125,
                child: Row(
                  children: [
                    const Text('28 C',
                        style: TextStyle(
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
                                text: '32 C',
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
                                text: '21 C',
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
                text: 'Clear and sunny',
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
                    return SizedBox(
                      height: height * .05,
                      width: width * .2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BuildText(
                            text: '21 C',
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
                            text: '7 am',
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
