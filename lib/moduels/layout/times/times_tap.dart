import 'package:flutter/material.dart';
import 'package:adhan/adhan.dart';
import 'package:intl/intl.dart';
import 'package:again_islami/core/theme/app_color.dart';

class TimesTap extends StatefulWidget {
  const TimesTap({super.key});

  @override
  State<TimesTap> createState() => _PrayerTimesScreenState();
}

class _PrayerTimesScreenState extends State<TimesTap> {
  DateTime selectedDate = DateTime.now();
  late PrayerTimes prayerTimes;

  final Coordinates cairoCoordinates = Coordinates(30.0444, 31.2357);
  final params = CalculationMethod.egyptian.getParameters();

  @override
  void initState() {
    super.initState();
    _updatePrayerTimes();
  }

  void _updatePrayerTimes() {
    final date = DateComponents.from(selectedDate);
    prayerTimes = PrayerTimes(cairoCoordinates, date, params);
    setState(() {});
  }

  void _changeDay(int offset) {
    setState(() {
      selectedDate = selectedDate.add(Duration(days: offset));
      _updatePrayerTimes();
    });
  }

  String formatTime(DateTime time) {
    return DateFormat.jm().format(time);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double fontSize = screenWidth * 0.045;
    double buttonFontSize = screenWidth * 0.045;
    double buttonWidth = screenWidth * 0.35;
    double dateFontSize = screenWidth * 0.045;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Background_t.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'مواقيت الصلاة - القاهرة',
            style: TextStyle(
              color: AppColor.primary,
              fontWeight: FontWeight.bold,
              fontSize: fontSize + 2,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: buttonWidth,
                    child: ElevatedButton(
                      onPressed: () => _changeDay(-1),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primary,
                      ),
                      child: Text(
                        "اليوم السابق",
                        style: TextStyle(
                          color: AppColor.whites,
                          fontWeight: FontWeight.bold,
                          fontSize: buttonFontSize,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        DateFormat.yMMMMEEEEd('ar').format(selectedDate),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: dateFontSize,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: buttonWidth,
                    child: ElevatedButton(
                      onPressed: () => _changeDay(1),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primary,
                      ),
                      child: Text(
                        "اليوم التالي",
                        style: TextStyle(
                          color: AppColor.whites,
                          fontWeight: FontWeight.bold,
                          fontSize: buttonFontSize,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              prayerRow("الفجر", prayerTimes.fajr, fontSize),
              prayerRow("الشروق", prayerTimes.sunrise, fontSize),
              prayerRow("الظهر", prayerTimes.dhuhr, fontSize),
              prayerRow("العصر", prayerTimes.asr, fontSize),
              prayerRow("المغرب", prayerTimes.maghrib, fontSize),
              prayerRow("العشاء", prayerTimes.isha, fontSize),
            ],
          ),
        ),
      ),
    );
  }

  Widget prayerRow(String name, DateTime time, double fontSize) {
    return ListTile(
      leading: Icon(
        Icons.access_time,
        color: AppColor.primary,
        size: fontSize + 4,
      ),
      title: Text(
        name,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: AppColor.primary,
        ),
      ),
      trailing: Text(
        formatTime(time),
        style: TextStyle(
          fontSize: fontSize - 2,
          color: AppColor.primary,
        ),
      ),
    );
  }
}
