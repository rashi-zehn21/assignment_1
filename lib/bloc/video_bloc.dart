import 'dart:convert';
import 'dart:math';
import 'package:assignment_1/bloc/video_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../models/detail.dart';
part 'video_state.dart';
//import 'package:equatable/equatable.dart';

// import 'package:login_page/auth/login/auth_repository.dart';
// part 'login_event.dart';
// part 'login_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  VideoBloc() : super(VideoInitail());
  VideoState get initialState => VideoInitail();
  @override
  Stream<VideoState> mapEventToState(VideoEvent event) async* {
    List<DetailResp>? detailList = [];
    try {
      if (event is VideoScreenPressed) {
        yield VideoLoading();
        detailList = await getUsers();
        print(detailList![0].address);
        // if (detailList.) {
        //   yield VideoSuccess();
        // } else {
        //   yield VideoError(err: flag.toString());
        // }
      }
    } catch (e) {
      yield VideoError();
      print("ERROR");
      // yield
    }
  }

  Future<List<DetailResp>?> getUsers() async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<DetailResp> _model = detailRespFromJson(response.body);
        return _model;
      }
    } catch (e) {}
  }

  // Future<List<VideoBloc>?> getUsers() async {
  // try {
  //   //print("------------EMIAL , PASSWORD" + password + email);
  // var response = await http.get(
  //     Uri.parse("ApiConstants.baseUrl + ApiConstants.usersEndpoint"),
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //   //   body: jsonEncode({
  //   //     "email": "eve.holt@reqres.in",
  //   //     "password": "cityslicka"
  //   //     "email": "${email}",
  //   //     "password": "${password}"
  //   // }),
  //   );
  //  //final body = jsonDecode(response.body);
  //   if (response.statusCode == 200) {
  //     // List<VideoBloc> _model = userModelFromJson(response.body);
  //     // return _model;
  //     //return true;
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
  // }
}
