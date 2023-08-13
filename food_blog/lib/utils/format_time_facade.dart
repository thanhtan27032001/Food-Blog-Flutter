class FormatTimeFacade {
  static String getDisplayTime (DateTime? dateTime) {
    if (dateTime != null) {
      return '${dateTime.day}-${dateTime.month}-${dateTime.year} ${dateTime.hour}:${dateTime.minute}';
    }
    return '';
  }
}