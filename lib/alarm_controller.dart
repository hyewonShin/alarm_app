import 'package:flutter_application_1/alarm_model.dart';
import 'package:get/get.dart';

class AlarmController extends GetxController {
  int hour = 0;
  int minute = 0;

  bool isEditMode = false;

  List<AlarmModel> alarmList = [];

  void setHour(int hour) {
    this.hour = hour;
    update();
  }

  void setMinute(int minute) {
    this.minute = minute;
    update();
  }

  void saveAlarm() {
    alarmList.add(AlarmModel(hour: hour, minute: minute));
    update();
  }

  void toggleEditMode() {
    isEditMode = !isEditMode;
    update();
  }
}
