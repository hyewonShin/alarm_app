class AlarmModel {
  int hour;
  int minute;
  bool isOn;

  AlarmModel({
    required this.hour,
    required this.minute,
    this.isOn = true,
  });
}
