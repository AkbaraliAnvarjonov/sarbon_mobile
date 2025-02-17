part of 'extension.dart';

extension ParseString on DateTime {
  String get formatDate => DateFormat('dd.MM.yyyy', localSource.localeName).format(this);

  String get formatDateTime => DateFormat("yyyy-MM-dd'T'HH:mm:ss'.263Z'", localSource.localeName).format(this);

  String get formatDateHour => DateFormat('dd.MM.yyyy HH:mm', localSource.localeName).format(this);

  String timeZone() {
    var date = toIso8601String().split('.')[0];
    if (timeZoneOffset.isNegative) {
      date += '-';
    } else {
      date += '+';
    }
    final timeZoneSplit = timeZoneOffset.toString().split(':');

    final hour = int.parse(timeZoneSplit[0]);
    if (hour < 10) {
      date += '0${timeZoneSplit[0]}';
    }
    date += ':${timeZoneSplit[1]}';
    return date;
  }
}

extension ParseExtension on String {
  String Function() get date => () {
        if (isEmpty) return '';
        final int duration = DateTime.now().hour - DateTime.now().toUtc().hour;
        final DateTime date = DateFormat('yyyy-MM-ddTHH:mm:ssZ', localSource.localeName).parse(this);
        return DateFormat('dd.MM.yyyy', localSource.localeName).format(
          date.add(Duration(hours: duration)),
        );
      };

  String Function() get dateTime => () {
        if (isEmpty) return '';
        final int duration = DateTime.now().hour - DateTime.now().toUtc().hour;
        final DateTime date = DateFormat('yyyy-MM-ddTHH:mm:ssZ', localSource.localeName).parse(this);
        return DateFormat('dd.MM.yyyy HH:mm', localSource.localeName).format(
          date.add(Duration(hours: duration)),
        );
      };

  String Function() get timeParseHourMinute => () {
        if (isEmpty) return '';
        final DateTime date = DateFormat('yyyy-MM-ddTHH:mm:ssZ', localSource.localeName).parse(this);
        return DateFormat('HH:mm', localSource.localeName).format(
          date.toLocal(),
        );
      };

  String dateMoth() {
    if (isEmpty) return '';
    final int duration = DateTime.now().hour - DateTime.now().toUtc().hour;
    final DateTime date = DateFormat('yyyy-MM-ddTHH:mm:ssZ', localSource.localeName).parse(this);
    return DateFormat('dd-MMMM', localSource.localeName).format(
      date.add(Duration(hours: duration)),
    );
  }

  String dateMoth2() {
    if (isEmpty) return '';
    final int duration = DateTime.now().hour - DateTime.now().toUtc().hour;
    final DateTime date = DateFormat('dd.MM.yyyy HH:mm', localSource.localeName).parse(this);
    return DateFormat('dd-MMMM', localSource.localeName).format(
      date.add(Duration(hours: duration)),
    );
  }

  String dateMothWeek() {
    if (isEmpty) return '';
    final int duration = DateTime.now().hour - DateTime.now().toUtc().hour;
    final DateTime date = DateFormat('yyyy-MM-ddTHH:mm:ssZ', localSource.localeName).parse(this);
    return DateFormat('dd MMM, E', localSource.localeName).format(
      date.add(Duration(hours: duration)),
    );
  }

  String day() {
    if (isEmpty) return '';
    final int duration = DateTime.now().hour - DateTime.now().toUtc().hour;
    final DateTime date = DateFormat('yyyy-MM-ddTHH:mm:ssZ', localSource.localeName).parse(this);
    return DateFormat('dd-', localSource.localeName).format(
      date.add(Duration(hours: duration)),
    );
  }

  String dateTime1() {
    if (isEmpty) return '';
    final int duration = DateTime.now().hour - DateTime.now().toUtc().hour;
    final DateTime date = DateFormat('yyyy-MM-ddTHH:mm:ssZ', localSource.localeName).parse(this);
    return DateFormat('dd.MM.yyyy', localSource.localeName).format(
      date.add(Duration(hours: duration)),
    );
  }

  String dateTime2() {
    if (isEmpty) return '';
    final int duration = DateTime.now().hour - DateTime.now().toUtc().hour;
    final DateTime date = DateFormat('MM.dd.yyyy', localSource.localeName).parse(this);
    return DateFormat('dd MMMM, yyyy', localSource.localeName).format(
      date.add(Duration(hours: duration)),
    );
  }

  String time1() {
    if (isEmpty) return '';
    final int duration = DateTime.now().hour - DateTime.now().toUtc().hour;
    final DateTime date = DateFormat('HH:mm', localSource.localeName).parse(this);
    return DateFormat('HH:mm', localSource.localeName).format(
      date.add(Duration(hours: duration)),
    );
  }

  String time() {
    if (isEmpty) return '';
    final int duration = DateTime.now().hour - DateTime.now().toUtc().hour;
    final DateTime date = DateFormat('yyyy-MM-ddTHH:mm:ssZ', localSource.localeName).parse(this);
    return DateFormat('HH:mm', localSource.localeName).format(
      date.add(Duration(hours: duration)),
    );
  }

  String get htmlToText => Bidi.stripHtmlIfNeeded(this);
}
