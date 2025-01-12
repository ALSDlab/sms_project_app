class UserDataDto {
  final int? id;
  final String? signUpDate;
  final String? email;
  final bool? deleted;
  final String? signOutDate;

//<editor-fold desc="Data Methods">
  const UserDataDto({
    this.id,
    this.signUpDate,
    this.email,
    this.deleted,
    this.signOutDate,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserDataDto &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          signUpDate == other.signUpDate &&
          email == other.email &&
          deleted == other.deleted &&
          signOutDate == other.signOutDate);

  @override
  int get hashCode =>
      id.hashCode ^
      signUpDate.hashCode ^
      email.hashCode ^
      deleted.hashCode ^
      signOutDate.hashCode;

  @override
  String toString() {
    return 'UserDataDto{ id: $id, signUpDate: $signUpDate, email: $email, deleted: $deleted, signOutDate: $signOutDate,}';
  }

  UserDataDto copyWith({
    int? id,
    String? signUpDate,
    String? email,
    bool? deleted,
    String? signOutDate,
  }) {
    return UserDataDto(
      id: id ?? this.id,
      signUpDate: signUpDate ?? this.signUpDate,
      email: email ?? this.email,
      deleted: deleted ?? this.deleted,
      signOutDate: signOutDate ?? this.signOutDate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'signUpDate': signUpDate,
      'email': email,
      'deleted': deleted,
      'signOutDate': signOutDate,
    };
  }

  factory UserDataDto.fromJson(Map<String, dynamic> map) {
    return UserDataDto(
      id: map['id'] as int,
      signUpDate: map['signUpDate'] as String,
      email: map['email'] as String,
      deleted: map['deleted'] as bool,
      signOutDate: map['signOutDate'] as String,
    );
  }

//</editor-fold>
}
