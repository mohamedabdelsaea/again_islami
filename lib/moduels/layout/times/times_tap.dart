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
                fontSize: 22),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () => _changeDay(-1),
                    child: Text("اليوم السابق" ,
                      style: TextStyle(
                        color: AppColor.whites,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),),
                    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(AppColor.primary)),
                  ),
                  Text(
                    DateFormat.yMMMMEEEEd('ar').format(selectedDate),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primary,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _changeDay(1),
                    child:  Text("اليوم التالي",
                      style: TextStyle(
                        color: AppColor.whites,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),),
                    style: ButtonStyle( backgroundColor: WidgetStateProperty.all(AppColor.primary)),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              prayerRow("الفجر", prayerTimes.fajr),
              prayerRow("الشروق", prayerTimes.sunrise),
              prayerRow("الظهر", prayerTimes.dhuhr),
              prayerRow("العصر", prayerTimes.asr),
              prayerRow("المغرب", prayerTimes.maghrib),
              prayerRow("العشاء", prayerTimes.isha),
            ],
          ),
        ),
      ),
    );
  }

  Widget prayerRow(String name, DateTime time) {
    return ListTile(
      leading: Icon(
        Icons.access_time,
        color: AppColor.primary,
      ),
      title: Text(
        name,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColor.primary,
        ),
      ),
      trailing: Text(
        formatTime(time),
        style: TextStyle(
          fontSize: 16,
          color: AppColor.primary,
        ),
      ),
    );
  }
}
