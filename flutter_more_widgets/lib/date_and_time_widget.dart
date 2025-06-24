import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatesAndTimeWidget extends StatefulWidget {
  const DatesAndTimeWidget({Key? key}) : super(key: key);

  @override
  State<DatesAndTimeWidget> createState() => _DatesAndTimeWidgetState();
}

class _DatesAndTimeWidgetState extends State<DatesAndTimeWidget> {
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.blueAccent,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black54,
          ),
        ),
        cardTheme: CardThemeData(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        dividerColor: Colors.grey.shade300,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Date & Time'),
          backgroundColor: Colors.blueAccent,
          elevation: 2,
          titleTextStyle: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionCard(
                    context,
                    title: 'Date Formats',
                    children: [
                      TextWidget(
                        title: 'Current Date & Time',
                        date: now.toString(),
                        icon: Icons.calendar_today,
                      ),
                      const Divider(),
                      const Text('Custom Date Formats', style: TextStyle(fontWeight: FontWeight.w600)),
                      TextWidget(
                        title: 'Y-M-D, H:M',
                        date: DatesUtils().dateFormatYMDKKMM(),
                        icon: Icons.date_range,
                      ),
                      TextWidget(
                        title: 'Y:M:D',
                        date: "${DateFormat.y().format(now)}:${DateFormat.M().format(now)}:${DateFormat.d().format(now)}",
                        icon: Icons.date_range,
                      ),
                      TextWidget(
                        title: 'Y-M-D',
                        date: "${DateFormat.y().format(now)}-${DateFormat.M().format(now)}-${DateFormat.d().format(now)}",
                        icon: Icons.date_range,
                      ),
                      TextWidget(
                        title: 'Y/M/D',
                        date: "${DateFormat.y().format(now)}/${DateFormat.M().format(now)}/${DateFormat.d().format(now)}",
                        icon: Icons.date_range,
                      ),
                      TextWidget(
                        title: 'D/M/Y',
                        date: "${DateFormat.d().format(now)}/${DateFormat.M().format(now)}/${DateFormat.y().format(now)}",
                        icon: Icons.date_range,
                      ),
                    ],
                  ),
                  _buildSectionCard(
                    context,
                    title: 'Day Information',
                    children: [
                      TextWidget(
                        title: 'Day',
                        date: DateFormat.d().format(DateTime.now()),
                        icon: Icons.today,
                      ),
                      TextWidget(
                        title: 'Day Name',
                        date: DateFormat.EEEE().format(DateTime.now()),
                        icon: Icons.event,
                      ),
                      TextWidget(
                        title: 'Short Day Name',
                        date: DateFormat.E().format(DateTime.now()),
                        icon: Icons.event_note,
                      ),
                    ],
                  ),
                  _buildSectionCard(
                    context,
                    title: 'Month Information',
                    children: [
                      TextWidget(
                        title: 'Month',
                        date: DateFormat.M().format(DateTime.now()),
                        icon: Icons.calendar_view_month,
                      ),
                      TextWidget(
                        title: 'Month Name',
                        date: DateFormat.LLLL().format(DateTime.now()),
                        icon: Icons.calendar_view_month,
                      ),
                      TextWidget(
                        title: 'Short Month Name',
                        date: DateFormat.LLL().format(DateTime.now()),
                        icon: Icons.calendar_view_month,
                      ),
                    ],
                  ),
                  _buildSectionCard(
                    context,
                    title: 'Year Information',
                    children: [
                      TextWidget(
                        title: 'Year',
                        date: DateFormat.y().format(DateTime.now()),
                        icon: Icons.date_range,
                      ),
                    ],
                  ),
                  _buildSectionCard(
                    context,
                    title: 'Time Information',
                    children: [
                      TextWidget(
                        title: 'Hour',
                        date: DateFormat.H().format(DateTime.now()),
                        icon: Icons.access_time,
                      ),
                      TextWidget(
                        title: '24-Hour Format',
                        date: DateFormat.Hm().format(DateTime.now()),
                        icon: Icons.timer,
                      ),
                      TextWidget(
                        title: 'Time in AM',
                        date: DateFormat.jm().format(DateTime.now().copyWith(hour: 10)),
                        icon: Icons.wb_sunny,
                      ),
                      TextWidget(
                        title: 'Time in PM',
                        date: DateFormat.jm().format(DateTime.now()),
                        icon: Icons.nightlight_round,
                      ),
                    ],
                  ),
                  _buildSectionCard(
                    context,
                    title: 'Days Ago',
                    children: [
                      const Text('Days Ago:', style: TextStyle(fontWeight: FontWeight.w600)),
                      Text(
                        "${DatesUtils().daysAgo(DateTime.now().microsecondsSinceEpoch.toString())}, "
                        "${DatesUtils().daysAgo(DateTime(now.year, now.month, now.day - 1).microsecondsSinceEpoch.toString())}, "
                        "${DatesUtils().daysAgo(DateTime(now.year, now.month, now.day - 2).microsecondsSinceEpoch.toString())}, "
                        "${DatesUtils().daysAgo(DateTime(now.year, now.month, now.day - 3).microsecondsSinceEpoch.toString())}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  _buildSectionCard(
                    context,
                    title: 'Minutes, Hours & Weeks Ago',
                    children: [
                      const Text('Minutes, Hours & Weeks Ago:', style: TextStyle(fontWeight: FontWeight.w600)),
                      Text(
                        "${DatesUtils().timesAndMinutesAgo(DateTime(2023, 06, 18, 15, 20).microsecondsSinceEpoch.toString())}, "
                        "${DatesUtils().timesAndMinutesAgo(DateTime(2023, 06, 18, 10, 20).microsecondsSinceEpoch.toString())}, "
                        "${DatesUtils().timesAndMinutesAgo(DateTime(2023, 06, 12, 15, 20).microsecondsSinceEpoch.toString())}, "
                        "${DatesUtils().timesAndMinutesAgo(DateTime(2023, 06, 01, 15, 20).microsecondsSinceEpoch.toString())}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  _buildSectionCard(
                    context,
                    title: 'Date Comparison',
                    children: [
                      const Text('Previous Date Comparison:', style: TextStyle(fontWeight: FontWeight.w600)),
                      TextWidget(
                        title: 'Today',
                        date: DatesUtils().compareTimesForSevenDays(DateTime.now().microsecondsSinceEpoch.toString()),
                        icon: Icons.today,
                      ),
                      TextWidget(
                        title: 'Yesterday',
                        date: DatesUtils().compareTimesForSevenDays(DateTime(now.year, now.month, now.day - 1).microsecondsSinceEpoch.toString()),
                        icon: Icons.calendar_today,
                      ),
                      TextWidget(
                        date: DatesUtils().compareTimesForSevenDays(DateTime(2023, 06, 16).microsecondsSinceEpoch.toString()),
                        icon: Icons.calendar_today,
                      ),
                      TextWidget(
                        date: DatesUtils().compareTimesForSevenDays(DateTime(2023, 06, 15).microsecondsSinceEpoch.toString()),
                        icon: Icons.calendar_today,
                      ),
                      TextWidget(
                        date: DatesUtils().compareTimesForSevenDays(DateTime(2023, 06, 14).microsecondsSinceEpoch.toString()),
                        icon: Icons.calendar_today,
                      ),
                      TextWidget(
                        date: DatesUtils().compareTimesForSevenDays(DateTime(2023, 06, 13).microsecondsSinceEpoch.toString()),
                        icon: Icons.calendar_today,
                      ),
                      TextWidget(
                        date: DatesUtils().compareTimesForSevenDays(DateTime(2023, 06, 12).microsecondsSinceEpoch.toString()),
                        icon: Icons.calendar_today,
                      ),
                      TextWidget(
                        date: DatesUtils().compareTimesForSevenDays(DateTime(2023, 06, 11).microsecondsSinceEpoch.toString()),
                        icon: Icons.calendar_today,
                      ),
                      TextWidget(
                        date: DatesUtils().compareTimesForSevenDays(DateTime(2023, 06, 10).microsecondsSinceEpoch.toString()),
                        icon: Icons.calendar_today,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionCard(BuildContext context, {required String title, required List<Widget> children}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            ...children,
          ],
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  final String title, date;
  final IconData? icon;

  const TextWidget({Key? key, required this.date, this.title = '', this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Icon(icon, size: 20, color: Colors.blueAccent),
                const SizedBox(width: 8),
              ],
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Flexible(
            child: Text(
              date,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}

class DatesUtils {
  String dateFormatYMDKKMM() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd , hh:mm').format(now);
    return formattedDate;
  }

  String compareTimesForSevenDays(String date) {
    DateTime dt = DateTime.fromMicrosecondsSinceEpoch(int.parse(date.toString())).toLocal();
    final todayDate = DateTime.now();
    final today = DateTime(todayDate.year, todayDate.month, todayDate.day);
    final yesterday = DateTime(todayDate.year, todayDate.month, todayDate.day - 1);
    final dayBeforeYesterday = DateTime(todayDate.year, todayDate.month, todayDate.day - 2);
    String difference = '';
    final aDate = DateTime(dt.year, dt.month, dt.day);

    if (aDate == today) {
      return 'Today';
    } else if (aDate == yesterday) {
      difference = "Yesterday";
    } else if (aDate == dayBeforeYesterday) {
      difference = DateFormat('E').format(dt).toString();
    } else if (todayDate.difference(dt).inDays >= 3 && todayDate.difference(dt).inDays < 4) {
      difference = DateFormat('E').format(dt).toString();
    } else if (todayDate.difference(dt).inDays >= 4 && todayDate.difference(dt).inDays < 5) {
      difference = DateFormat('E').format(dt).toString();
    } else if (todayDate.difference(dt).inDays >= 5 && todayDate.difference(dt).inDays < 6) {
      difference = DateFormat('E').format(dt).toString();
    } else if (todayDate.difference(dt).inDays >= 6 && todayDate.difference(dt).inDays < 7) {
      difference = DateFormat('E').format(dt).toString();
    } else {
      difference = "${DateFormat.d().format(dt)} ${DateFormat.MMM().format(dt)} ${DateFormat.y().format(dt)}";
    }
    return difference;
  }

  String daysAgo(String date) {
    DateTime dt = DateTime.fromMicrosecondsSinceEpoch(int.parse(date.toString())).toLocal();
    final todayDate = DateTime.now();
    final today = DateTime(todayDate.year, todayDate.month, todayDate.day);
    final yesterday = DateTime(todayDate.year, todayDate.month, todayDate.day - 1);
    final dayBeforeYesterday = DateTime(todayDate.year, todayDate.month, todayDate.day - 2);
    String difference = '';
    final aDate = DateTime(dt.year, dt.month, dt.day);

    if (aDate == today) {
      return 'Today';
    } else if (aDate == yesterday) {
      difference = "1d ago";
    } else if (aDate == dayBeforeYesterday) {
      difference = '2d ago';
    } else if (todayDate.difference(dt).inDays >= 3 && todayDate.difference(dt).inDays < 4) {
      difference = '3d ago';
    } else if (todayDate.difference(dt).inDays >= 4 && todayDate.difference(dt).inDays < 5) {
      difference = '4d ago';
    } else if (todayDate.difference(dt).inDays >= 5 && todayDate.difference(dt).inDays < 6) {
      difference = '5d ago';
    } else if (todayDate.difference(dt).inDays >= 6 && todayDate.difference(dt).inDays < 7) {
      difference = '6d ago';
    } else {
      difference = "${DateFormat.d().format(dt)} ${DateFormat.MMM().format(dt)} ${DateFormat.y().format(dt)}";
    }
    return difference;
  }

  String timesAndMinutesAgo(String timestamp) {
    var now = DateTime.now();
    var date = DateTime.fromMicrosecondsSinceEpoch(int.parse(timestamp));
    var diff = now.difference(date);
    var time = '';

    if (diff.inHours <= 1) {
      time = "${diff.inMinutes}m ago";
    } else if (diff.inHours <= 24) {
      time = "${diff.inHours}h ago";
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      time = diff.inDays == 1 ? '1 DAY AGO' : '${diff.inDays} DAYS AGO';
    } else {
      time = diff.inDays == 7
          ? '1 WEEK AGO'
          : '${(diff.inDays / 7).floor()} WEEKS AGO';
    }

    return time;
  }
}