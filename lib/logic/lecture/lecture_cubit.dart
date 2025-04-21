import 'package:bloc/bloc.dart';
import 'package:d_m_u_attendance_app/apis/lecture_info_api.dart';
import 'package:d_m_u_attendance_app/models/lecture_model/lecture_model.dart';
import 'lecture_state.dart';

class LectureCubit extends Cubit<LectureState> {
  LectureCubit(this.lectureInfoApi) : super(LectureInitial());

  final LectureInfoApi lectureInfoApi;

  Future<void> getLecInfo() async {
    emit(LectureLoading());
    try {
      var res = await lectureInfoApi.getLecInfo();
      List<LectureModel> lectures = [];

      for (var i = 0; i < res.length; i++) {
        lectures.add(LectureModel.fromJson(res[i]));
      }
      emit(LectureSuccess(lectures: lectures));
    } catch (e) {
      emit(LectureFailure(message: e.toString()));
    }
  }
}
