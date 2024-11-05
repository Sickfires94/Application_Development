part of 'timer_bloc.dart';

sealed class TimerState extends Equatable {
  TimerState({required this.duration});
  int duration;

  @override
  List<Object> get props => [duration];
}

final class TimerInitial extends TimerState {
  TimerInitial({required super.duration});

  @override
  String toString() => 'TimerInitial { duration: $duration }';
}

final class TimerRunPause extends TimerState {
  TimerRunPause({required super.duration});

  @override
  String toString() => 'TimerRunPause { duration: $duration }';
}

final class TimerRunInProgress extends TimerState {
  TimerRunInProgress({required super.duration});

  @override
  String toString() => 'TimerRunInProgress { duration: $duration }';
}

final class TimerRunComplete extends TimerState {
  TimerRunComplete() : super(duration: 0);
}