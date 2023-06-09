class Craftsman {
 final String imagePath;
 final String fullName;
 final String bio;
 final String about;
 final bool isDarkMode;

 const Craftsman({
    required this.imagePath,
    required this.fullName,
    required this.bio,
    required this.about,
    required this.isDarkMode,
  });

  Craftsman copy ({
    String? imagePath,
    String? fullName,
    String? bio,
    String? about,
    bool? isDarkMode
  }) =>
  Craftsman(
    imagePath: imagePath ?? this.imagePath,
    fullName: fullName ?? this.fullName,
    bio: bio ?? this.bio,
    about: about ?? this.about,
    isDarkMode: isDarkMode ?? this.isDarkMode,
  );

  static Craftsman fromJson(Map<String, dynamic> json) => Craftsman(
    imagePath: json['imagePath'],
    fullName: json['fullName'],
    bio: json['bio'],
    about: json['about'],
    isDarkMode: json['isDarkMode'],
  );

  Map<String, dynamic> toJson() => {
        'imagePath': imagePath,
        'fullName': fullName,
        'bio': bio,
        'about': about,
        'isDarkMode': isDarkMode,
      };
}
