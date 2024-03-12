import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/Text.dart';
import '../../cubits/app_cubit.dart';

class AstronomyScreen extends StatefulWidget {
  const AstronomyScreen({super.key});

  @override
  State<AstronomyScreen> createState() => _AstronomyScreenState();
}

class _AstronomyScreenState extends State<AstronomyScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TextEditingController controller = TextEditingController();
    List<String> icons = [
      'https://cdn-icons-png.flaticon.com/512/1146/1146885.png',
      'https://cdn-icons-png.flaticon.com/512/365/365239.png',
      'https://cdn-icons-png.flaticon.com/512/6635/6635590.png',
      'https://cdn.iconscout.com/icon/premium/png-256-thumb/moonrise-3026268-2519001.png?f=webp',
      'https://static.vecteezy.com/system/resources/previews/001/193/165/original/moon-phase-icon-png.png',
      'https://www.freepnglogos.com/uploads/moon-png/moon-transparent-png-and-clip-art-images-icons-and-13.png'
    ];

    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        DateTime? selectedDate = DateTime.tryParse('yyyy-MM-dd');
        int? year;
        int? month;
        int? day;
        var cubit = AppCubit.get(context);
        Future<void> showCalendar(BuildContext context) async {
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
          );

          if (picked != null && picked != selectedDate) {
            setState(() {
              selectedDate = picked;
              year = selectedDate!.year;
              month = selectedDate!.month;
              day = selectedDate!.day;
            });
          }
        }

        if (state is AstronomyWeatherLoading ||
            cubit.astronomyWeather == null) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 55.0, right: 15, left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height * .065,
                        width: width * .9,
                        child: Center(
                          child: TextFormField(
                            controller: controller,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: IconButton(
                                    onPressed: () async {
                                      await showCalendar(context);
                                      if (selectedDate != null) {
                                        String month2;
                                        String day2;
                                        month! < 10
                                            ? month2 = '0$month'
                                            : month2 = month.toString();
                                        day! < 10
                                            ? day2 = '0$day'
                                            : day2 = day.toString();

                                        String date =
                                            '${year.toString()}-$month2-$day2';
                                        cubit.country = controller.text;
                                        await cubit.getAstronomyWeather(
                                            city: cubit.country, date: date);
                                      }
                                    },
                                    icon: const Icon(Icons.calendar_today),
                                    color: Colors.black,
                                    iconSize: 30,
                                  ),
                                ),
                                fillColor: Colors.grey,
                                filled: true,
                                hintText: 'Search For Country ...',
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.5),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    gapPadding: 20,
                                    borderSide: BorderSide.none),
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
                  height: height * .01,
                ),
                BuildText(
                  text: cubit.astronomyWeather!["location"]['name'],
                  size: 35,
                  bold: true,
                  color: const Color(0xff090122),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ),
                  child: SizedBox(
                    height: height * .65,
                    width: width,
                    child: GridView.builder(
                        itemCount: 6,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 0,
                                crossAxisSpacing: 1,
                                childAspectRatio: .8),
                        itemBuilder: (context, index) {
                          final astro =
                              cubit.astronomyWeather!['astronomy']['astro'];
                          final keys = astro.keys;
                          final values = astro.values;

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(17.5),
                                  color: const Color(0xff090122)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: height * .01,
                                  ),
                                  SizedBox(
                                      height: height * .125,
                                      child: Image(
                                          fit: BoxFit.contain,
                                          image: NetworkImage(
                                            icons[index],
                                          ))),
                                  BuildText(
                                    text: '${keys.elementAt(index)}',
                                    size: 22.5,
                                    bold: true,
                                    color: Colors.white,
                                    letterSpacing: .35,
                                  ),
                                  SizedBox(
                                    width: width * .3,
                                    child: Center(
                                      child: BuildText(
                                        text: '${values.elementAt(index)}',
                                        size: 22.5,
                                        color: Colors.white,
                                        letterSpacing: .35,
                                        maxLines: 2,
                                        center: true,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * .01,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
