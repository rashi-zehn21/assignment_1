import 'dart:convert';

import 'dart:math';
//import 'package:assignment_1/bloc/video_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../models/detail.dart';
part 'video_state.dart';
part 'video_event.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  VideoBloc() : super(VideoInitail());

  VideoState get initialState => VideoInitail();
  @override
  Stream<VideoState> mapEventToState(VideoEvent event) async* {
    List<Training>? TrainingList = [];
    try {
      if (event is VideoScreenPressed) {
        yield VideoLoading();
        TrainingList = await (TrainingList);
        print(TrainingList![0].Training_name);
        if (TrainingList.length > 0) {
          yield VideoSuccess();
        } else {
          yield VideoError(err: " ERROR");
        }
      }
    } catch (e) {
      yield VideoError();
      print("ERROR");
      // yield
    }
  }
  
   Future<List<Training>> getTrainig() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "YOUR API KEY FROM YUMMLY API",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Training.recipesFromSnapshot(_temp);
  }
}

//  Future<List<VideoBloc>?> get() async {
//     try {
//       var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
//       var response = await http.get(url);
//       if (response.statusCode == 200) {
//         List<Training> _model = Trainig_nameJson(response.body);
//         return _model;
//       }
//     } catch (e) {}
//   }
  

  // Future<List<VideoBloc>?> getUsers() async {
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
  // List<VideoBloc> _model = userModelFromJson(response.body);
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
   

