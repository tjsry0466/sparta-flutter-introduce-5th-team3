class UserProfile {
  final String name;
  final String role;
  final String location;
  final String interests;
  final String profileImage;
  final String description;
  final String birth;
  final String gender;
  final String mbti;
  final String position;
  final List<String> badges;
  final Map<String, double> capabilities;
  final Map<String, double> skills;

  const UserProfile({
    required this.name,
    required this.role,
    required this.location,
    required this.interests,
    required this.profileImage,
    required this.description,
    required this.birth,
    required this.gender,
    required this.mbti,
    required this.position,
    required this.badges,
    required this.capabilities,
    required this.skills,
  });

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      name: map['name'] as String,
      role: map['role'] as String,
      location: map['location'] as String,
      interests: map['interests'] as String,
      profileImage: map['profileImage'] as String,
      description: map['description'] as String,
      birth: map['birth'] as String,
      gender: map['gender'] as String,
      mbti: map['mbti'] as String,
      position: map['position'] as String,
      badges: List<String>.from(map['badges']),
      capabilities: Map<String, double>.from(map['capabilities']),
      skills: Map<String, double>.from(map['skills']),
    );
  }
}
