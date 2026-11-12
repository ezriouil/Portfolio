import 'package:cloud_firestore/cloud_firestore.dart';

class ExperienceEntity {
  final String? fromDate;
  final String? toDate;
  final String? title;
  final String? description;
  final String? subTitle;
  final DateTime? createdAt;

  ExperienceEntity({
    this.fromDate,
    this.toDate,
    this.title,
    this.description,
    this.subTitle,
    this.createdAt,
  });

  factory ExperienceEntity.fromJson(Map<String, dynamic> json) {
    return ExperienceEntity(
      fromDate: json['fromDate'],
      toDate: json['toDate'],
      title: json['title'],
      description: json['description'],
      subTitle: json['subTitle'],
      createdAt: json['createdAt'] != null
          ? (json['createdAt'] is Timestamp
                ? (json['createdAt'] as Timestamp).toDate()
                : json['createdAt'] is DateTime
                ? json['createdAt'] as DateTime
                : DateTime.tryParse(json['createdAt'].toString()))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fromDate': fromDate,
      'toDate': toDate,
      'title': title,
      'description': description,
      'subTitle': subTitle,
      'createdAt': createdAt != null ? Timestamp.fromDate(createdAt!) : null,
    };
  }
}
