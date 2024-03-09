import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/components/Text.dart';
import 'package:weather_app/components/components.dart';

import '../mainLayout.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imageList = [
      'images/SplashScreen2.jpg',
      'images/SplashScreen1.jpg',
      'images/SplashScreen3.jpg',
    ];
    List<String> texts = [
      'Plan your day wisely, follow the weather forecast!',
      'Get accurate weather forecasts instantly and accurately',
      "Weather or not, we've got you covered"
    ];
    List<Color> colors = [Colors.white,Colors.black , Colors.white];
    List<Color> colors2 = [ Colors.black,Colors.white ,Colors.black];

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imageList[index]), fit: BoxFit.cover)),
            child: Padding(
              padding:  EdgeInsets.only(top: height*.75),
              child: SizedBox(
                height: height*.2,
                width: width*.8,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BuildText(


                        text: texts[index],
                        color: colors[index],
                        size: 25,
                        bold: true,
                        maxLines: 2,
                        letterSpacing: .5,
                      ),
                      SizedBox(
                        height: height*.02,

                      ),
                      GestureDetector(
                        onTap: (){
                          navigateToToFinish(context,  MainLayout());
                        },
                        child: Container(
                          height: height*.065,
                          width: width*.3,
                          decoration: BoxDecoration(
                            color: colors[index],
                            borderRadius: BorderRadius.circular(25)
                          ),
                          child: Center(child: BuildText(text: 'Start',color: colors2[index],bold: true,size: 20,)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
