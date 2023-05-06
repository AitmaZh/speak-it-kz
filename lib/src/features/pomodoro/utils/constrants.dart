import 'package:flutter/material.dart';
import '../../../../assets/my_colors.dart';
import '../domain/models/pomodoro_status.dart';

const pomodoroTotalTime = 25 * 60;
const shortBreakTime = 5 * 60;
const longBreakTime = 15 * 60;
const pomodoroPerSet = 4;

const Map<PomodoroStatus, String> statusDescription = {
  PomodoroStatus.runningPomodoro: 'Time to focus',
  PomodoroStatus.pausedPomodoro: 'Timer: Paused',
  PomodoroStatus.runningShortBreak: 'Short Break: Time to relax',
  PomodoroStatus.pausedShortBreak: 'Short Break: Paused',
  PomodoroStatus.runningLongBreak: 'Long Break: Time to relax',
  PomodoroStatus.pausedLongBreak: 'Long Break: Paused',
  PomodoroStatus.setFinished: 'The set is finished! Ready to start new one?',
};

Map<PomodoroStatus, Color> statusColor = {
  PomodoroStatus.runningPomodoro: IndicatorColors.runningTimerColor,
  PomodoroStatus.pausedPomodoro: IndicatorColors.pausedStatusColor,
  PomodoroStatus.runningShortBreak: IndicatorColors.runningBreakColor,
  PomodoroStatus.pausedShortBreak: IndicatorColors.pausedStatusColor,
  PomodoroStatus.runningLongBreak: IndicatorColors.runningBreakColor,
  PomodoroStatus.pausedLongBreak: IndicatorColors.pausedStatusColor,
  PomodoroStatus.setFinished: IndicatorColors.runningTimerColor,
};
