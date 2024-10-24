int calculateAge(String birthDateString) {
  // 문자열을 년, 월, 일로 분리하여 DateTime으로 변환
  List<String> parts = birthDateString.split('.');
  int year = int.parse(parts[0]);
  int month = int.parse(parts[1]);
  int day = int.parse(parts[2]);
  DateTime birthDate = DateTime(year, month, day);
  DateTime today = DateTime.now();

  // 나이 계산
  int age = today.year - birthDate.year;
  if (today.month < birthDate.month ||
      (today.month == birthDate.month && today.day < birthDate.day)) {
    age--;
  }

  return age;
}
