import 'package:d_m_u_attendance_app/models/lecture_model/lecture_model.dart';
import 'package:equatable/equatable.dart';

abstract class LectureState extends Equatable {
  const LectureState();
  @override
  List<Object?> get props => [];
}

class LectureInitial extends LectureState {}

class LectureLoading extends LectureState {}

class LectureSuccess extends LectureState {
  final List<LectureModel> lectures;

  const LectureSuccess({required this.lectures});
}

class LectureFailure extends LectureState {
  final String message;

  const LectureFailure({required this.message});
}
