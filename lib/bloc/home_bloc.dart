import 'dart:convert';
import 'dart:async';
import 'dart:math';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        print("11111111111------------------------000000000001");
        Future<List<dynamic>> response = await getResponse();
        print(response);
        if (response != null) {
          print("jsonStringValues");
          print(response);
          yield HomeDetailSuccess(item: response);
        } else {
          yield HomeDetailError(err: e);
        }
      }
    } catch (e) {
      print(e);
      yield HomeDetailError();
      print("ERROR");
      // yield
    }
  }

// class HomeDetailBloc extends Bloc<HomeDetailEvent, HomeDetailState> implements BaseBloc {

//   Future<List> TrainingList;
  // @override
//   HomeDetailBloc() : super(HomeDetailInitail()) {
//     on<HomeDetailEvent>((event, emit) => {

//     try {

//         emit(LoginLoading());

//         TrainingList message = await readJson();

//         emit(LoginSuccess(message: message.toString()));

//       } catch (error) {

//         emit(LoginFailure(error: error.toString()));

//       }
  // try {
  //   if (event is VideoScreenPressed) {
  //     yield HomeDetailLoading(message: 'Loading state');
  //     print(TrainingList);
  //     if (TrainingList != null) {
  //       yield HomeDetailSuccess(item: TrainingList);
  //     } else {
  //       yield HomeDetailError(err: " ERROR");
  //     }
  //   }
  // } catch (e) {
  //   yield HomeDetailError();
  //   print("ERROR");
  // yield
  // }
  // });

// }
  static Future<dynamic> getResponse() async {
    print("--------------------------------");
    var res = await rootBundle.loadString('assets/home.json');
    print("11111111111111111");
    print(res);
    final data = await json.decode(res);
    print("data------------$data");
    return data;
  }
// Fetch content from the json file
//   Future<List> readJson() async {
  // final String response =
  //     await rootBundle.loadString('assets/homeDetail.json');
  // final data = await json.decode(response);
  // return data;
//     String jsonStringValues =
//         await rootBundle.loadString('lib/assets/homeDetail.json');
//     final data = await json.decode(jsonStringValues); // add .json at the end

  // Map<String, dynamic> mappedJson = jsonDecode(jsonStringValues);
  // final a = mappedJson.map((key, value) => MapEntry(key, value.toString()));
  // print(a);
//     return data;
//   }
}

  

// abstract class BaseBloc {
//   void dispose();
// }
// Future<HomeDetail>? getDetail() async {
//   try {
  // var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
//     final data = await json.decode(response);
//     if (response.statusCode == 200) {
//       HomeDetail data = homeDetailFromJson((response.body));
//       return data;
//     }
//   } catch (e) {
//     print('error');
//   }
// }

  // Future<List<HomeDetailBloc>?> getUsers() async {
  // try {
  //print("------------EMIAL , PASSWORD" + password + email);
  // var response = await http.get(
  //     Uri.parse("ApiConstants.baseUrl + ApiConstants.usersEndpoint"),
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //   body: jsonEncode({
  //     "email": "eve.holt@reqres.in",
  //     "password": "cityslicka"
  //     "email": "${email}",
  //     "password": "${password}"
  // }),
  //   );
  //final body = jsonDecode(response.body);
  //   if (response.statusCode == 200) {
  // List<HomeDetailBloc> _model = userModelFromJson(response.body);
  // return _model;
  //return true;
  //   }
  //   if (response.statusCode == 400) {

  //     throw (["message"]);
  //   } else {
  //     throw ("Something went wrong");
  //   }
  // } catch (e) {
  //   print(e.toString().contains("Failed host lookup"));
  //   if (e.toString().contains("Failed host lookup")) {
  //     print("inside ifff");
  //     throw ("Please check your Internet Connection.");
  //   } else {
  //     throw (e);
  //   }


