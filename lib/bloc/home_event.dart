part of 'home_bloc.dart';

@immutable
abstract class HomeDetailEvent {
  const HomeDetailEvent();
}

class VideoScreenPressed extends HomeDetailEvent {
  // final int result;

  const VideoScreenPressed();
  @override
  String toString() => ' VideoScreenPressed { url: }';

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
