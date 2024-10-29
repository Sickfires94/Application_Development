import 'dart:convert';

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'LaunchBloc.dart';
import 'launch_model.dart';

abstract class ShowMoreEvent {}
class ShowMore extends ShowMoreEvent{}
class ShowLess extends ShowMoreEvent{}

abstract class DescriptionState{}
class DescriptionInitial extends DescriptionState{}
class DescriptionTrimmed extends DescriptionState{
  final String description;
  DescriptionTrimmed({required this.description});
}
class DescriptionShowed extends DescriptionState{
  final String description;
  DescriptionShowed({required this.description});
}


class DescriptionError extends DescriptionState{
  final String error;
  DescriptionError(this.error);
}

class LaunchDescriptionBloc extends Bloc<ShowMoreEvent, DescriptionState>{
  LaunchDescriptionBloc(String description) : super(DescriptionInitial()){
    on<ShowMore>((event, emit) => emit(DescriptionShowed(description: description)));
    on<ShowLess>((event, emit) => emit(DescriptionTrimmed(description: description)));
  }
}
