class FormatTimeFacade {
  static String getDisplayTime(DateTime? dateTime) {
    if (dateTime != null) {
      return '${_addZero(dateTime.day)}/${_addZero(dateTime.month)}/${dateTime.year} ${_addZero(dateTime.hour)}:${_addZero(dateTime.minute)}';
    }
    return '';
  }

  static String _addZero(int num){
    if (num >= 10) {
      return num.toString();
    }
    else {
      return '0$num';
    }
  }
}