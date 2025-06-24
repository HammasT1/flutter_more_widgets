import 'package:flutter/material.dart';
// import 'package:flutter_more_widgets/image_compressor_widget.dart';
import 'package:flutter_more_widgets/interactive_viewer_widget.dart';
// import 'package:flutter_more_widgets/date_and_time_widget.dart';
// import 'package:flutter_more_widgets/message_grouping_with_time_stamp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: InteractiveViewerWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

