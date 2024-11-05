import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../Ticker.dart';

part 'timer_events.dart';
part 'timer_states.dart';


class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker _ticker;
  static const int _initialDuration = 60;
  static int _duration = _initialDuration;

  StreamSubscription<int>? _tickerSubscription;
    TimerBloc({required Ticker ticker})
    : _ticker = ticker,
    super(TimerInitial(duration: _duration)) {
    on<TimerStarted>(_onStarted);
    on<TimerPaused>(_onPaused);
    on<TimerResumed>(_onResumed);
    on<TimerReset>(_onReset);
    on<_TimerTicked>(_onTicked);
    on<TimerIncremented>(_onIncrement);
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onStarted(TimerStarted event, Emitter<TimerState> emit) {
    emit(TimerRunInProgress(duration: event.duration));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: event.duration)
        .listen((duration) => add(_TimerTicked(duration: duration)));
  }

  void _onIncrement(TimerIncremented event, Emitter<TimerState> emit){
      if (state is TimerRunInProgress){
        _tickerSubscription?.cancel();
        _ticker.tick(ticks: state.duration + 60).listen((duration) => add(_TimerTicked(duration: duration)));
        emit(TimerRunInProgress(duration: state.duration + 60));
      }
      else if (state is TimerRunPause){
        state.duration += 60;
        _tickerSubscription?.cancel();
        _ticker.tick(ticks: state.duration + 60).listen((duration) => add(_TimerTicked(duration: duration)));
        emit(TimerRunPause(duration: state.duration + 60));
      }
      else {
        //_tickerSubscription?.cancel();
        //_ticker.tick(ticks: state.duration + 60).listen((duration) => add(_TimerTicked(duration: duration)));
        state.duration += 60;
        emit(TimerInitial(duration: _duration));
      }
  }

  void _onTicked(_TimerTicked event, Emitter<TimerState> emit) {
    emit(event.duration > 0
        ? TimerRunInProgress(duration: event.duration)
        : TimerRunComplete());
  }

  void _onPaused(TimerEvent event, Emitter<TimerState> emit) {
    if (state is TimerRunInProgress) {
      _tickerSubscription?.pause();
      emit(TimerRunPause(duration: state.duration));
    }
  }

  void _onResumed(TimerResumed resume, Emitter<TimerState> emit) {
    if (state is TimerRunPause) {
      _tickerSubscription?.resume();
      emit(TimerRunInProgress(duration: state.duration));
    }
  }

  void _onReset(TimerReset event, Emitter<TimerState> emit) {
    _tickerSubscription?.cancel();
    emit(TimerInitial(duration: _initialDuration));
  }

}