import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:speak_it_kz/assets/my_colors.dart';
import 'package:speak_it_kz/src/features/pomodoro/utils/constrants.dart';

import '../widgets/progess_icons.dart';
import '../widgets/custom_buttons.dart';
import '../../domain/models/pomodoro_status.dart';

class PomodoroScreen extends StatefulWidget {
  const PomodoroScreen({super.key});

  @override
  State<PomodoroScreen> createState() => _PomodoroScreenState();
}

const _btnTextStart = 'START';
const _btnTextPause = 'PAUSE';
const _btnTextResume = 'RESUME';
const _btnTextStartNewSet = 'NEW SET';

class _PomodoroScreenState extends State<PomodoroScreen> {
  int remainingTime = pomodoroTotalTime;
  String mainButtonText = _btnTextStart;
  PomodoroStatus pomodoroStatus = PomodoroStatus.pausedPomodoro;
  late Timer _timer;
  int pomodoroNum = 0;
  int setNum = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 25),
            child: Text(
              'Pomodoro Timer',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Number: $pomodoroNum',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                'Set: $setNum',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ----------------- CIRCULAR INDICATOR -----------------
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: CircularPercentIndicator(
                  backgroundColor: IndicatorColors.backgroundColor,
                  circularStrokeCap: CircularStrokeCap.round,
                  radius: 120.0,
                  lineWidth: 15.0,
                  percent: _getPomodoroPercentage(),
                  center: Text(
                    _secondsToFormatedMinutes(remainingTime),
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  progressColor: statusColor[pomodoroStatus],
                ),
              ),
              // ----------------- PROGRESS ICONS -----------------
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: ProgressIcons(
                  total: pomodoroPerSet,
                  done: pomodoroNum - (setNum * pomodoroPerSet),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 20,
                ),
                child: Text(
                  statusDescription[pomodoroStatus]!,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              // ----------------- BUTTONS -----------------
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                      onTap: () => _resetButtonPressed, text: 'Reset'),
                  const SizedBox(
                    width: 60,
                  ),
                  CustomButton(
                      onTap: () => _mainBtnPressed, text: mainButtonText),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  _secondsToFormatedMinutes(int seconds) {
    int roundedMinutes = seconds ~/ 60;
    int remainingSeconds = seconds - (roundedMinutes * 60);
    String remainingSecondsFormated = '';

    if (remainingSeconds < 10) {
      remainingSecondsFormated = '0$remainingSeconds';
    } else {
      remainingSecondsFormated = remainingSeconds.toString();
    }

    return '$roundedMinutes:$remainingSecondsFormated';
  }

  _getPomodoroPercentage() {
    int totalTime;

    switch (pomodoroStatus) {
      case PomodoroStatus.runningPomodoro:
        totalTime = pomodoroTotalTime;
        break;
      case PomodoroStatus.pausedPomodoro:
        totalTime = pomodoroTotalTime;
        break;
      case PomodoroStatus.runningShortBreak:
        totalTime = shortBreakTime;
        break;
      case PomodoroStatus.pausedShortBreak:
        totalTime = shortBreakTime;
        break;
      case PomodoroStatus.runningLongBreak:
        totalTime = longBreakTime;
        break;
      case PomodoroStatus.pausedLongBreak:
        totalTime = longBreakTime;
        break;
      case PomodoroStatus.setFinished:
        totalTime = pomodoroTotalTime;
        break;
    }

    double percentage = (totalTime - remainingTime) / totalTime;
    return percentage;
  }

  _mainBtnPressed() {
    switch (pomodoroStatus) {
      case PomodoroStatus.runningPomodoro:
        _pausePomodoroCountdown();
        break;
      case PomodoroStatus.pausedPomodoro:
        _startPomodoroCountdown();
        break;
      case PomodoroStatus.runningShortBreak:
        _pauseShortBreakCountdown();
        break;
      case PomodoroStatus.pausedShortBreak:
        _startShortBreakCountdown();
        break;
      case PomodoroStatus.runningLongBreak:
        _pauseLongBreakCountdown();
        break;
      case PomodoroStatus.pausedLongBreak:
        _startLongBreakCountdown();
        break;
      case PomodoroStatus.setFinished:
        setNum++;
        _startLongBreakCountdown();
        break;
    }
  }

  _startPomodoroCountdown() {
    pomodoroStatus = PomodoroStatus.runningPomodoro;
    _cancelTimer;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
          mainButtonText = _btnTextPause;
        });
      } else {
        // playSound();
        pomodoroNum++;
        _cancelTimer;
        if (pomodoroNum % pomodoroPerSet == 0) {
          pomodoroStatus = PomodoroStatus.pausedLongBreak;
          setState(() {
            remainingTime = longBreakTime;
            mainButtonText = _btnTextStart;
          });
        } else {
          pomodoroStatus = PomodoroStatus.pausedShortBreak;
          setState(() {
            remainingTime = shortBreakTime;
            mainButtonText = _btnTextStart;
          });
        }
      }
    });
  }

  _cancelTimer() {
    if (_timer != null) {
      _timer.cancel();
    }
  }

  _pausePomodoroCountdown() {
    pomodoroStatus = PomodoroStatus.pausedPomodoro;
    _cancelTimer();
    setState(() {
      mainButtonText = _btnTextResume;
    });
  }

  _resetButtonPressed() {
    pomodoroNum = 0;
    setNum = 0;
    _stopCountdown();
    _cancelTimer();
  }

  _stopCountdown() {
    pomodoroStatus = PomodoroStatus.pausedPomodoro;
    setState(() {
      mainButtonText = _btnTextStart;
      remainingTime = pomodoroTotalTime;
    });
  }

  _pauseBreakCountdown() {
    _cancelTimer();
    setState(() {
      mainButtonText = _btnTextResume;
    });
  }

  _pauseShortBreakCountdown() {
    pomodoroStatus = PomodoroStatus.pausedShortBreak;
    _pauseBreakCountdown();
  }

  _pauseLongBreakCountdown() {
    pomodoroStatus = PomodoroStatus.pausedLongBreak;
    _pauseBreakCountdown();
  }

  _startShortBreakCountdown() {
    pomodoroStatus = PomodoroStatus.runningShortBreak;
    setState(() {
      mainButtonText = _btnTextPause;
    });
    _cancelTimer();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        remainingTime = pomodoroTotalTime;
        _cancelTimer();
        pomodoroStatus = PomodoroStatus.pausedPomodoro;
        setState(() {
          mainButtonText = _btnTextStart;
        });
      }
    });
  }

  _startLongBreakCountdown() {
    pomodoroStatus = PomodoroStatus.runningLongBreak;
    setState(() {
      mainButtonText = _btnTextPause;
    });
    _cancelTimer();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        remainingTime = pomodoroTotalTime;
        _cancelTimer();
        pomodoroStatus = PomodoroStatus.setFinished;
        setState(() {
          mainButtonText = _btnTextStartNewSet;
        });
      }
    });
  }
}
