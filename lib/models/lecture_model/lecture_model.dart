import 'package:equatable/equatable.dart';

import 'course.dart';
import 'lecture_hall.dart';
import 'section_hall.dart';

class LectureModel extends Equatable {
  final int? id;
  final int? courseId;
  final String? term;
  final String? year;
  final int? doctorId;
  final int? lectureHallId;
  final int? isLectureAttendanceOpen;
  final String? lectureDay;
  final String? lectureStartHour;
  final String? lectureEndHour;
  final int? assistantId;
  final int? sectionHallId;
  final int? isSectionAttendanceOpen;
  final String? sectionDay;
  final String? sectionStartHour;
  final String? sectionEndHour;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Course? course;
  final LectureHall? lectureHall;
  final SectionHall? sectionHall;

  const LectureModel({
    this.id,
    this.courseId,
    this.term,
    this.year,
    this.doctorId,
    this.lectureHallId,
    this.isLectureAttendanceOpen,
    this.lectureDay,
    this.lectureStartHour,
    this.lectureEndHour,
    this.assistantId,
    this.sectionHallId,
    this.isSectionAttendanceOpen,
    this.sectionDay,
    this.sectionStartHour,
    this.sectionEndHour,
    this.createdAt,
    this.updatedAt,
    this.course,
    this.lectureHall,
    this.sectionHall,
  });

  factory LectureModel.fromJson(Map<String, dynamic> json) => LectureModel(
        id: json['id'] as int?,
        courseId: json['course_id'] as int?,
        term: json['term'] as String?,
        year: json['year'] as String?,
        doctorId: json['doctor_id'] as int?,
        lectureHallId: json['lecture_hall_id'] as int?,
        isLectureAttendanceOpen: json['is_lecture_attendance_open'] as int?,
        lectureDay: json['lecture_day'] as String?,
        lectureStartHour: json['lecture_start_hour'] as String?,
        lectureEndHour: json['lecture_end_hour'] as String?,
        assistantId: json['assistant_id'] as int?,
        sectionHallId: json['section_hall_id'] as int?,
        isSectionAttendanceOpen: json['is_section_attendance_open'] as int?,
        sectionDay: json['section_day'] as String?,
        sectionStartHour: json['section_start_hour'] as String?,
        sectionEndHour: json['section_end_hour'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        course: json['course'] == null
            ? null
            : Course.fromJson(json['course'] as Map<String, dynamic>),
        lectureHall: json['lecture_hall'] == null
            ? null
            : LectureHall.fromJson(
                json['lecture_hall'] as Map<String, dynamic>),
        sectionHall: json['section_hall'] == null
            ? null
            : SectionHall.fromJson(
                json['section_hall'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'course_id': courseId,
        'term': term,
        'year': year,
        'doctor_id': doctorId,
        'lecture_hall_id': lectureHallId,
        'is_lecture_attendance_open': isLectureAttendanceOpen,
        'lecture_day': lectureDay,
        'lecture_start_hour': lectureStartHour,
        'lecture_end_hour': lectureEndHour,
        'assistant_id': assistantId,
        'section_hall_id': sectionHallId,
        'is_section_attendance_open': isSectionAttendanceOpen,
        'section_day': sectionDay,
        'section_start_hour': sectionStartHour,
        'section_end_hour': sectionEndHour,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'course': course?.toJson(),
        'lecture_hall': lectureHall?.toJson(),
        'section_hall': sectionHall?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      courseId,
      term,
      year,
      doctorId,
      lectureHallId,
      isLectureAttendanceOpen,
      lectureDay,
      lectureStartHour,
      lectureEndHour,
      assistantId,
      sectionHallId,
      isSectionAttendanceOpen,
      sectionDay,
      sectionStartHour,
      sectionEndHour,
      createdAt,
      updatedAt,
      course,
      lectureHall,
      sectionHall,
    ];
  }
}
