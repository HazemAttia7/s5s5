import 'dart:async';
import 'package:flutter/material.dart';

class TimerBar extends StatefulWidget {
  final Duration startFrom;

  const TimerBar({super.key, this.startFrom = const Duration(seconds: 0)});

  @override
  State<TimerBar> createState() => _TimerBarState();
}

class _TimerBarState extends State<TimerBar> {
  late Duration elapsed;
  Timer? timer;
  bool isPaused = false;

  @override
  void initState() {
    super.initState();
    elapsed = widget.startFrom;
    startTimer();
  }

  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!isPaused) {
        setState(() => elapsed += const Duration(seconds: 1));
      }
    });
  }

  void resetTimer() {
    setState(() {
      elapsed = widget.startFrom;
      isPaused = false;
    });
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  String formatTime() {
    final minutes = elapsed.inMinutes.toString().padLeft(2, "0");
    final seconds = elapsed.inSeconds.remainder(60).toString().padLeft(2, "0");
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 450,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF262330),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              setState(() => isPaused = !isPaused);
            },
            child: Icon(
              isPaused ? Icons.play_arrow : Icons.pause,
              color: Colors.white,
              size: 40,
            ),
          ),
          Text(
            formatTime(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 34,
              letterSpacing: 2,
            ),
          ),
          InkWell(
            onTap: resetTimer,
            child: const Icon(Icons.refresh, color: Colors.white, size: 38),
          ),
        ],
      ),
    );
  }
}
