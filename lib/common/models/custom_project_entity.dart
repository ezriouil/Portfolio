class CustomProjectEntity {

  final String? id;
  final String? title;
  final String? description;
  final String? logo;
  final String? thumbnail;
  final String? apkLink;
  final String? googlePlayLink;
  final String? appStoreLink;
  final String? videoLink;
  final String? codeSourceLink;
  final String? createAt;
  final List<String>? technologiesUsed;
  final Map<String, dynamic>? images;

  CustomProjectEntity({
    this.id,
    this.title,
    this.description,
    this.logo,
    this.thumbnail,
    this.apkLink,
    this.googlePlayLink,
    this.appStoreLink,
    this.videoLink,
    this.codeSourceLink,
    this.createAt,
    this.technologiesUsed,
    this.images,
  });

  factory CustomProjectEntity.fromJson(Map<String, dynamic> json) {
    return CustomProjectEntity(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      logo: json['logo'],
      thumbnail: json['thumbnail'],
      apkLink: json['apkLink'],
      googlePlayLink: json['googlePlayLink'],
      appStoreLink: json['appStoreLink'],
      videoLink: json['videoLink'],
      codeSourceLink: json['codeSourceLink'],
      createAt: json['createAt'],
      technologiesUsed: json['technologiesUsed'] != null ? List<String>.from(json['technologiesUsed']) : null,
      images: json['images'] != null ? Map<String, dynamic>.from(json['images']) : null,
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
      'appStoreLink': appStoreLink,
      'videoLink': videoLink,
      'codeSourceLink': codeSourceLink,
      'createAt': createAt,
      'technologiesUsed': technologiesUsed,
      'images': images,
    };
  }
}