import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectEntity {
  final String? id;
  final String? title;
  final String? description;
  final String? features;
  final String? logo;
  final String? thumbnail;
  final String? apkLink;
  final String? googlePlayLink;
  final String? appStoreLink;
  final String? videoLink;
  final String? codeSourceLink;
  final DateTime? createdAt;
  final String? technologies;

  final String? imgSplash;
  final String? imgRegisterLight;
  final String? imgLoginLight;
  final String? imgRegisterDark;
  final String? imgLoginDark;

  final List<String>? lightImages;
  final List<String>? darkImages;

  ProjectEntity({
    this.id,
    this.title,
    this.description,
    this.features,
    this.logo,
    this.thumbnail,
    this.apkLink,
    this.googlePlayLink,
    this.appStoreLink,
    this.videoLink,
    this.codeSourceLink,
    this.createdAt,
    this.technologies,
    this.imgSplash,
    this.imgRegisterLight,
    this.imgLoginLight,
    this.imgRegisterDark,
    this.imgLoginDark,
    this.lightImages,
    this.darkImages,
  });

  factory ProjectEntity.fromJson(Map<String, dynamic> json) {
    return ProjectEntity(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      features: json['features'],
      logo: json['logo'],
      thumbnail: json['thumbnail'],
      apkLink: json['apkLink'],
      googlePlayLink: json['googlePlayLink'],
      appStoreLink: json['appStoreLink'],
      videoLink: json['videoLink'],
      codeSourceLink: json['codeSourceLink'],
      createdAt: json['createdAt'] != null
          ? (json['createdAt'] is Timestamp
              ? (json['createdAt'] as Timestamp).toDate()
              : json['createdAt'] is DateTime
                  ? json['createdAt'] as DateTime
                  : DateTime.tryParse(json['createdAt'].toString()))
          : null,
      technologies: json['technologies'],
      imgSplash: json['imgSplash'],
      imgRegisterLight: json['imgRegisterLight'],
      imgLoginLight: json['imgLoginLight'],
      imgRegisterDark: json['imgRegisterDark'],
      imgLoginDark: json['imgLoginDark'],
      lightImages: json['lightImages'] != null ? List<String>.from(json['lightImages']) : null,
      darkImages: json['darkImages'] != null ? List<String>.from(json['darkImages']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'features': features,
      'logo': logo,
      'thumbnail': thumbnail,
      'apkLink': apkLink,
      'googlePlayLink': googlePlayLink,
      'appStoreLink': appStoreLink,
      'videoLink': videoLink,
      'codeSourceLink': codeSourceLink,
      'createdAt': createdAt != null ? Timestamp.fromDate(createdAt!) : null,
      'technologies': technologies,
      'imgSplash': imgSplash,
      'imgRegisterLight': imgRegisterLight,
      'imgLoginLight': imgLoginLight,
      'imgRegisterDark': imgRegisterDark,
      'imgLoginDark': imgLoginDark,
      'lightImages': lightImages,
      'darkImages': darkImages,
    };
  }
}