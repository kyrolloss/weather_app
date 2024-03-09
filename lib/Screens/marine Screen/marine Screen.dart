import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/components/Text.dart';

import '../../components/wave Container.dart';

class MarineScreen extends StatelessWidget {
  const MarineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: PageView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Container(
              height: height ,
              width: width,
              decoration: const BoxDecoration(
                color: Color(0xff5b9aaf),
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
                      text: '07:00  19:10',
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
                            child: BuildText(
                              text: '6 KM/H  NE',
                              color: Colors.white,
                              bold: true,
                              size: 20,
                              maxLines: 3,
                              letterSpacing: 3.5,
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
                child:SizedBox(
                  height: height*.3,
                  width: width,
                  child: CustomPaint(
                    painter: WavePainter(height: height*.3,
                      color: const Color(0xff60c5c0).withOpacity(.65),
                      waveAmplitude: 25, // Adjust this value to change the height of the wave
                      waveFrequency: 10, // Adjust this value to change the number of waves
                    )
                  ),
                ))

          ],
        );
      },
    ));
  }


}
