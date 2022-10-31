import 'dart:convert';
import 'dart:async';
//import 'dart:math';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeDetailBloc extends Bloc<HomeDetailEvent, HomeDetailState> {
  HomeDetailBloc() : super(HomeDetailInitail());
  HomeDetailState get initialState => HomeDetailInitail();
  @override
  Stream<HomeDetailState> mapEventToState(HomeDetailEvent event) async* {
    try {
      if (event is VideoScreenPressed) {
        yield HomeDetailLoading();
        final response = await getResponse();
        // items = await readJson();

        // print('$response');
        if (response != null) {
          print("jsonStringValues");
          print(response);
          yield HomeDetailSuccess(item: response);
        } else {
          yield HomeDetailError(err: 'Error');
        }
      }
    } catch (e) {
      print(e);
      yield HomeDetailError(err: "Error");
      print("ERROR");
      // yield
    }
  }

// }
  static getResponse() async {
    try {
      dynamic res = await rootBundle.loadString('assets/home.json');
      final data = await json.decode(res);
      // final listData = ResponseModel(data: data);
      return data;
    } catch (e) {
      print(e);
    }
  }

  // Future<List> readJson() async {
  //   final String response = await rootBundle.loadString('assets/home.json');
  //   final data = await json.decode(response);
  //   return data;
  //   // ...
  // }
}

class ResponseModel extends Equatable {
  final data;

  ResponseModel({this.data});

  List<Object?> get props => [data];
}
