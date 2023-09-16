extension FormattedMonthYear on DateTime {
  String formatMonthYear() {
    final monthNames = [
      'enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio',
      'julio', 'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre'
    ];
    final monthName = monthNames[month - 1];
    final year = this.year.toString();
    return '$monthName-$year';
  }
}