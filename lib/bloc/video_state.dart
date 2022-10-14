part of 'video_bloc.dart';

abstract class VideoState {
  VideoState();
}

class VideoInitail extends VideoState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class VideoLoading extends VideoState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class VideoSuccess extends VideoState {
  final result;
  VideoSuccess({this.result});
  VideoSuccess copyWith({var result}) {
    return VideoSuccess(result: result ?? this.result);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class VideoError extends VideoState {
  final err;
  VideoError({this.err});
  VideoError copyWith({var err}) {
    return VideoError(err: err ?? this.err);
  }

  @override
  List<Object> get props => [err];
}
