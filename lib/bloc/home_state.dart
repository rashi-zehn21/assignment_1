part of 'home_bloc.dart';

@immutable
abstract class HomeDetailState extends Equatable {
  const HomeDetailState();
}

class HomeDetailInitail extends HomeDetailState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeDetailLoading extends HomeDetailState {
  HomeDetailLoading();

  @override
  List<Object?> get props => [];
}

class HomeDetailSuccess extends HomeDetailState {
  final item;

  HomeDetailSuccess({required this.item});
  //String? password;

  @override
  List<Object> get props => [item];
  // final result;
  // VideoSuccess({this.result});
  // VideoSuccess copyWith({var result}) {
  //   return VideoSuccess(result: result ?? this.result);
  // }

  // @override
  // TODO: implement props
  // List<Object?> get props => [];
}

class HomeDetailError extends HomeDetailState {
  String err;
  HomeDetailError({required this.
  err});
  // HomeDetailError copyWith({var err}) {
  //   return HomeDetailError(err: err ?? this.err);
  // }

  @override
  List<Object> get props => [err];
}
