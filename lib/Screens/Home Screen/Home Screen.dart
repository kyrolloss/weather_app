import 'package:flutter/material.dart';
import 'package:weather_app/components/Text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xff090122),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 55.0, right: 15, left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * .07,
                    width: width * .9,
                    child: Center(
                      child: TextFormField(
                        controller: controller,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            fillColor: Colors.grey,
                            filled: true,
                            hintText: 'Search For Country ...',
                            hintStyle: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17.5),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none),
                            prefixIcon: const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Icon(
                                Icons.search,
                                size: 30,
                              ),
                            ),
                            counterStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * .1,
              width: width * .5,
              child: Center(
                child: BuildText(
                  text: 'Egypt , Cairo',
                  size: 25,
                  bold: true,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
                height: height * .2,
                width: width * .4,
                child: const Image(
                  image: NetworkImage(
                      'https://i.pinimg.com/originals/53/22/c2/5322c2cad533e12e552d0dfdc89b4c25.png'),
                  fit: BoxFit.contain,
                )),
            SizedBox(
              height: height * .1,
              width: width * .5,
              child: Center(
                child: BuildText(
                  text: '29 C',
                  size: 40,
                  bold: true,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: height * .005,
            ),
            SizedBox(
              height: height * .03,
              width: width * .5,
              child: Center(
                child: BuildText(
                  text: 'Expected high rein today',
                  size: 17.5,
                  bold: true,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: height * .03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.air,
                      color: Colors.white,
                    ),
                    BuildText(
                      text: ' 11 KM / hr',
                      size: 15,
                      bold: true,
                      color: Colors.white,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.water_drop_outlined,
                      color: Colors.white,
                    ),
                    BuildText(
                      text: ' 0 2%',
                      size: 17.5,
                      bold: true,
                      color: Colors.white,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.sunny,
                      color: Colors.white,
                    ),
                    BuildText(
                      text: ' 8 hr',
                      size: 17.5,
                      bold: true,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: height * .02),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.watch_later_outlined,
                    color: Colors.white,
                  ),
                  BuildText(
                    text: ' Hourly Forecast',
                    size: 22.5,
                    bold: true,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * .2,
              width: width * .9,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height * .1,
                      width: width * .3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17.5),
                          color: Colors.white.withOpacity(.3)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height*.1,
                              child: const Image(
                                fit: BoxFit.contain,
                                  image: NetworkImage(
                                      'https://cdn-icons-png.flaticon.com/512/11166/11166805.png'))),
                          BuildText(
                            text: ' Now',
                            size: 22.5,
                            bold: true,
                            color: Colors.white,
                          ),
                          BuildText(
                            text: ' 28',
                            size: 22.5,
                            bold: true,
                            color: Colors.white,
                          ),

                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}