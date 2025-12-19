import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectEntity {
  final String? id;
  final String? title;
  final String? description;
  final String? logo;
  final String? thumbnail;
  final String? apkLink;
  final String? websiteLink;
  final String? googlePlayLink;
  final String? appStoreLink;
  final String? videoLink;
  final String? codeSourceLink;
  final DateTime? createdAt;

  ProjectEntity({
    this.id,
    this.title,
    this.description,
    this.logo,
    this.thumbnail,
    this.apkLink,
    this.googlePlayLink,
    this.appStoreLink,
    this.videoLink,
    this.websiteLink,
    this.codeSourceLink,
    this.createdAt,
  });

  factory ProjectEntity.fromJson(Map<String, dynamic> json) {
    return ProjectEntity(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      logo: json['logo'],
      thumbnail: json['thumbnail'],
      apkLink: json['apkLink'],
      googlePlayLink: json['googlePlayLink'],
      appStoreLink: json['appStoreLink'],
      videoLink: json['videoLink'],
      websiteLink: json['websiteLink'],
      codeSourceLink: json['codeSourceLink'],
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
      'id': id,
      'title': title,
      'description': description,
      'logo': logo,
      'thumbnail': thumbnail,
      'apkLink': apkLink,
      'googlePlayLink': googlePlayLink,
      'websiteLink': websiteLink,
      'appStoreLink': appStoreLink,
      'videoLink': videoLink,
      'codeSourceLink': codeSourceLink,
      'createdAt': createdAt != null ? Timestamp.fromDate(createdAt!) : null,
    };
  }
}