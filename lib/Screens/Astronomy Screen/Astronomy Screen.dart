import 'package:flutter/material.dart';

import '../../components/Text.dart';

class AstronomyScreen extends StatelessWidget {
  const AstronomyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TextEditingController controller = TextEditingController();
    List <String> icons = [
      'https://cdn-icons-png.flaticon.com/512/1146/1146885.png',
      'https://cdn-icons-png.flaticon.com/512/365/365239.png',
      'https://cdn-icons-png.flaticon.com/512/6635/6635590.png',

      'https://cdn.iconscout.com/icon/premium/png-256-thumb/moonrise-3026268-2519001.png?f=webp',
      'https://static.vecteezy.com/system/resources/previews/001/193/165/original/moon-phase-icon-png.png',
      'https://www.freepnglogos.com/uploads/moon-png/moon-transparent-png-and-clip-art-images-icons-and-13.png'
    ];



    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 55.0, right: 15, left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * .0725,
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
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: height*.7,
                width: width,
                child: GridView.builder(
                  itemCount: 6,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 2 ,childAspectRatio:1),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17.5),
                              color:const Color(0xff090122)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: height*.01,
                              ),
                              SizedBox(
                                  height: height*.125,
                                  child:  Image(
                                      fit: BoxFit.contain,
                                      image: NetworkImage(
                                        icons[index],
                                          ))),
                              BuildText(
                                text: 'Sunrise',
                                size: 22.5,
                                bold: true,
                                color: Colors.white,
                                letterSpacing: .35,

                              ),
                              BuildText(
                                text: '6:11 AM',
                                size: 22.5,
                                color: Colors.white,
                                letterSpacing: .35,
                              ),
                              SizedBox(
                                height: height*.01,
                              ),

                            ],
                          ),
                        ),
                      );
                    },),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
