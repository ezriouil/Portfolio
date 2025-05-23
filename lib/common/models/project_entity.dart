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
  final String? createAt;
  final String? technologies;
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
    this.createAt,
    this.technologies,
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
      createAt: json['createAt'],
      technologies: json['technologies'],
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
      'createAt': createAt,
      'technologies': technologies,
      'lightImages': lightImages,
      'darkImages': darkImages,
    };
  }
}