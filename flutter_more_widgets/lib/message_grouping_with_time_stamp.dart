import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageGroupingWithTimeStamp extends StatefulWidget {
  const MessageGroupingWithTimeStamp({Key? key}) : super(key: key);

  @override
  State<MessageGroupingWithTimeStamp> createState() => _MessageGroupingWithTimeStampState();
}

class _MessageGroupingWithTimeStampState extends State<MessageGroupingWithTimeStamp> {
  final messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<MessageModel> messagesList = [
    MessageModel(timeStamp: DateTime.now().microsecondsSinceEpoch, message: 'Hello Today Message and testing long thread for this i hope this will work', isMe: true),
    MessageModel(timeStamp: DateTime.now().microsecondsSinceEpoch, message: 'Hello Today Message', isMe: false),
    MessageModel(timeStamp: DateTime.now().microsecondsSinceEpoch, message: 'Hello Today Message', isMe: true),
    MessageModel(timeStamp: DateTime.now().microsecondsSinceEpoch, message: 'Hello Today Message', isMe: false),
    MessageModel(timeStamp: DateTime.now().microsecondsSinceEpoch, message: 'Hello Today Message', isMe: true),
    MessageModel(timeStamp: DateTime.now().microsecondsSinceEpoch, message: 'Hello Today Message', isMe: false),
    MessageModel(timeStamp: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 1, 11, 30).microsecondsSinceEpoch, message: 'Yesterday Message', isMe: true),
    MessageModel(timeStamp: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 1, 11, 30).microsecondsSinceEpoch, message: 'Yesterday Message', isMe: false),
    MessageModel(timeStamp: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 1, 11, 30).microsecondsSinceEpoch, message: 'Yesterday Message', isMe: true),
    MessageModel(timeStamp: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 1, 14, 30).microsecondsSinceEpoch, message: 'Yesterday Message', isMe: false),
    MessageModel(timeStamp: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 1, 14, 30).microsecondsSinceEpoch, message: 'Yesterday Message', isMe: true),
    MessageModel(timeStamp: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 1, 14, 30).microsecondsSinceEpoch, message: 'Yesterday Message', isMe: false),
    MessageModel(timeStamp: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 2, 14, 30).microsecondsSinceEpoch, message: 'Some Message', isMe: true),
    MessageModel(timeStamp: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 2, 14, 30).microsecondsSinceEpoch, message: 'Some Message', isMe: false),
    MessageModel(timeStamp: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 2, 14, 30).microsecondsSinceEpoch, message: 'Some Message', isMe: true),
    MessageModel(timeStamp: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 2, 14, 30).microsecondsSinceEpoch, message: 'Some Message', isMe: false),
    MessageModel(timeStamp: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 2, 14, 30).microsecondsSinceEpoch, message: 'Some Message', isMe: true),
    MessageModel(timeStamp: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 3, 14, 30).microsecondsSinceEpoch, message: 'Some Message', isMe: false),
    MessageModel(timeStamp: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 3, 14, 30).microsecondsSinceEpoch, message: 'Some Message', isMe: true),
    MessageModel(timeStamp: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 3, 14, 30).microsecondsSinceEpoch, message: 'Some Message', isMe: false),
    MessageModel(timeStamp: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 3, 14, 30).microsecondsSinceEpoch, message: 'Some Message', isMe: true),
    MessageModel(timeStamp: DateTime(2023, 02, 08, 15, 20).microsecondsSinceEpoch, message: 'Feb 8th Message', isMe: true),
    MessageModel(timeStamp: DateTime(2023, 02, 08, 15, 20).microsecondsSinceEpoch, message: 'Feb 8th Message', isMe: false),
    MessageModel(timeStamp: DateTime(2023, 02, 08, 15, 20).microsecondsSinceEpoch, message: 'Feb 8th Message', isMe: true),
    MessageModel(timeStamp: DateTime(2023, 01, 20, 15, 20).microsecondsSinceEpoch, message: '20 Jan Message', isMe: true),
    MessageModel(timeStamp: DateTime(2023, 01, 20, 15, 20).microsecondsSinceEpoch, message: '20 Jan Message', isMe: false),
    MessageModel(timeStamp: DateTime(2023, 01, 20, 15, 20).microsecondsSinceEpoch, message: '20 Jan Message', isMe: true),
    MessageModel(timeStamp: DateTime(2023, 01, 20, 15, 20).microsecondsSinceEpoch, message: '20 Jan Message', isMe: false),
  ];

  static DateTime returnDateAndTimeFormat(String time) {
    var dt = DateTime.fromMicrosecondsSinceEpoch(int.parse(time));
    return DateTime(dt.year, dt.month, dt.day);
  }

  static String messageTime(String time) {
    var dt = DateTime.fromMicrosecondsSinceEpoch(int.parse(time));
    return DateFormat('jm').format(dt);
  }

  static String groupMessageDateAndTime(String time) {
    var dt = DateTime.fromMicrosecondsSinceEpoch(int.parse(time));
    final todayDate = DateTime.now();
    final today = DateTime(todayDate.year, todayDate.month, todayDate.day);
    final yesterday = DateTime(todayDate.year, todayDate.month, todayDate.day - 1);
    final aDate = DateTime(dt.year, dt.month, dt.day);

    if (aDate == today) {
      return "Today";
    } else if (aDate == yesterday) {
      return "Yesterday";
    } else {
      return DateFormat.yMMMd().format(dt);
    }
  }

  @override
  void dispose() {
    messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.purple,
        scaffoldBackgroundColor: Colors.transparent,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Roboto'),
          bodySmall: TextStyle(fontSize: 12, color: Colors.white70, fontFamily: 'Roboto'),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white.withOpacity(0.1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.purpleAccent, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                AppBar(
                  title: const Text('Chat'),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  titleTextStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Roboto',
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: ListView.builder(
                      controller: _scrollController,
                      reverse: true,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) {
                        bool isSameDate = false;
                        String? newDate = '';

                        final DateTime date = returnDateAndTimeFormat(messagesList[index].timeStamp.toString());

                        if (index == 0 && messagesList.length == 1) {
                          newDate = groupMessageDateAndTime(messagesList[index].timeStamp.toString());
                        } else if (index == messagesList.length - 1) {
                          newDate = groupMessageDateAndTime(messagesList[index].timeStamp.toString());
                        } else {
                          final DateTime prevDate = returnDateAndTimeFormat(messagesList[index + 1].timeStamp.toString());
                          isSameDate = date.isAtSameMomentAs(prevDate);
                          newDate = isSameDate ? '' : groupMessageDateAndTime(messagesList[index].timeStamp.toString());
                        }

                        return AnimatedSlide(
                          offset: Offset(0, index == 0 ? 0.2 : 0),
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeOut,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Column(
                              crossAxisAlignment: messagesList[index].isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                              children: [
                                if (newDate.isNotEmpty)
                                  Center(
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(vertical: 12),
                                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(color: Colors.white.withOpacity(0.2)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.2),
                                            blurRadius: 6,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        newDate,
                                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white.withOpacity(0.8),
                                            ),
                                      ),
                                    ),
                                  ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: CustomPaint(
                                    painter: MessageBubble(
                                      color: messagesList[index].isMe ? const Color(0xFF6D2077) : const Color(0xFF1E88E5),
                                      alignment: messagesList[index].isMe ? Alignment.topRight : Alignment.topLeft,
                                      tail: true,
                                    ),
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth: MediaQuery.of(context).size.width * 0.75,
                                      ),
                                      margin: messagesList[index].isMe
                                          ? const EdgeInsets.fromLTRB(10, 10, 20, 10)
                                          : const EdgeInsets.fromLTRB(20, 10, 10, 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.3),
                                            blurRadius: 8,
                                            offset: const Offset(2, 2),
                                          ),
                                          BoxShadow(
                                            color: Colors.white.withOpacity(0.1),
                                            blurRadius: 8,
                                            offset: const Offset(-2, -2),
                                          ),
                                        ],
                                        gradient: LinearGradient(
                                          colors: messagesList[index].isMe
                                              ? [const Color(0xFF8E24AA), const Color(0xFF6D2077)]
                                              : [const Color(0xFF42A5F5), const Color(0xFF1E88E5)],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 20),
                                            child: Text(
                                              messagesList[index].message,
                                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                    color: Colors.white,
                                                  ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 4,
                                            right: 8,
                                            child: Text(
                                              messageTime(messagesList[index].timeStamp.toString()),
                                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                    color: Colors.white.withOpacity(0.7),
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: messageController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 4,
                          minLines: 1,
                          decoration: InputDecoration(
                            hintText: 'Type a message...',
                            suffixIcon: Icon(Icons.mic, color: Colors.white.withOpacity(0.7)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          if (messageController.text.trim().isNotEmpty) {
                            MessageModel model = MessageModel(
                              timeStamp: DateTime.now().microsecondsSinceEpoch,
                              message: messageController.text.trim(),
                              isMe: true,
                            );
                            messagesList.insert(0, model);
                            messageController.clear();
                            setState(() {});
                            _scrollController.animateTo(
                              _scrollController.position.minScrollExtent,
                              curve: Curves.easeOut,
                              duration: const Duration(milliseconds: 500),
                            );
                          }
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.purpleAccent,
                          child: const Icon(Icons.send, color: Colors.white, size: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MessageModel {
  int timeStamp;
  String message;
  bool isMe;
  MessageModel({required this.timeStamp, required this.message, required this.isMe});
}

class MessageBubble extends CustomPainter {
  final Color color;
  final Alignment alignment;
  final bool tail;

  MessageBubble({
    required this.color,
    required this.alignment,
    required this.tail,
  });

  final double _radius = 15.0;

  @override
  void paint(Canvas canvas, Size size) {
    var h = size.height;
    var w = size.width;
    if (alignment == Alignment.topRight) {
      if (tail) {
        var path = Path();
        path.moveTo(_radius * 2, 0);
        path.quadraticBezierTo(0, 0, 0, _radius * 1.5);
        path.lineTo(0, h - _radius * 1.5);
        path.quadraticBezierTo(0, h, _radius * 2, h);
        path.lineTo(w - _radius * 3, h);
        path.quadraticBezierTo(w - _radius * 1.5, h, w - _radius * 1.5, h - _radius * 0.6);
        path.quadraticBezierTo(w - _radius * 1, h, w, h);
        path.quadraticBezierTo(w - _radius * 0.8, h, w - _radius, h - _radius * 1.5);
        path.lineTo(w - _radius, _radius * 1.5);
        path.quadraticBezierTo(w - _radius, 0, w - _radius * 3, 0);
        canvas.clipPath(path);
        canvas.drawRRect(
          RRect.fromLTRBR(0, 0, w, h, Radius.zero),
          Paint()..color = color..style = PaintingStyle.fill,
        );
      } else {
        var path = Path();
        path.moveTo(_radius * 2, 0);
        path.quadraticBezierTo(0, 0, 0, _radius * 1.5);
        path.lineTo(0, h - _radius * 1.5);
        path.quadraticBezierTo(0, h, _radius * 2, h);
        path.lineTo(w - _radius * 3, h);
        path.quadraticBezierTo(w - _radius, h, w - _radius, h - _radius * 1.5);
        path.lineTo(w - _radius, _radius * 1.5);
        path.quadraticBezierTo(w - _radius, 0, w - _radius * 3, 0);
        canvas.clipPath(path);
        canvas.drawRRect(
          RRect.fromLTRBR(0, 0, w, h, Radius.zero),
          Paint()..color = color..style = PaintingStyle.fill,
        );
      }
    } else {
      if (tail) {
        var path = Path();
        path.moveTo(_radius * 3, 0);
        path.quadraticBezierTo(_radius, 0, _radius, _radius * 1.5);
        path.lineTo(_radius, h - _radius * 1.5);
        path.quadraticBezierTo(_radius * .8, h, 0, h);
        path.quadraticBezierTo(_radius * 1, h, _radius * 1.5, h - _radius * 0.6);
        path.quadraticBezierTo(_radius * 1.5, h, _radius * 3, h);
        path.lineTo(w - _radius * 2, h);
        path.quadraticBezierTo(w, h, w, h - _radius * 1.5);
        path.lineTo(w, _radius * 1.5);
        path.quadraticBezierTo(w, 0, w - _radius * 2, 0);
        canvas.clipPath(path);
        canvas.drawRRect(
          RRect.fromLTRBR(0, 0, w, h, Radius.zero),
          Paint()..color = color..style = PaintingStyle.fill,
        );
      } else {
        var path = Path();
        path.moveTo(_radius * 3, 0);
        path.quadraticBezierTo(_radius, 0, _radius, _radius * 1.5);
        path.lineTo(_radius, h - _radius * 1.5);
        path.quadraticBezierTo(_radius, h, _radius * 3, h);
        path.lineTo(w - _radius * 2, h);
        path.quadraticBezierTo(w, h, w, h - _radius * 1.5);
        path.lineTo(w, _radius * 1.5);
        path.quadraticBezierTo(w, 0, w - _radius * 2, 0);
        canvas.clipPath(path);
        canvas.drawRRect(
          RRect.fromLTRBR(0, 0, w, h, Radius.zero),
          Paint()..color = color..style = PaintingStyle.fill,
        );
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class CustomRectTween extends RectTween {
  CustomRectTween({required Rect begin, required Rect end}) : super(begin: begin, end: end);

  @override
  Rect lerp(double t) {
    final elasticCurveValue = Curves.easeOut.transform(t);
    return Rect.fromLTRB(
      lerpDouble(begin!.left, end!.left, elasticCurveValue)!,
      lerpDouble(begin!.top, end!.top, elasticCurveValue)!,
      lerpDouble(begin!.right, end!.right, elasticCurveValue)!,
      lerpDouble(begin!.bottom, end!.bottom, elasticCurveValue)!,
    );
  }
}