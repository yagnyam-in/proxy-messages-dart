import 'package:json_annotation/json_annotation.dart';
import 'package:proxy_core/core.dart';

part 'subject_details.g.dart';

enum SubjectIdTypeEnum {
  IN_AADHAAR,
}

enum SubjectFieldEnum {
  subjectIdType,
  nationality,
  aadhaarNumber,
  name,
  gender,
  age,
  is18Plus,
  dateOfBirth,
}

@JsonSerializable()
class SubjectDetails extends ProxyBaseObject with ProxyUtils {
  @JsonKey(nullable: true)
  final SubjectIdTypeEnum subjectIdType;

  @JsonKey(nullable: true)
  final String nationality;

  @JsonKey(nullable: true)
  final String aadhaarNumber;

  @JsonKey(nullable: true)
  final String name;

  // Already 50+. Better to be a String
  @JsonKey(nullable: true)
  final String gender;

  @JsonKey(nullable: true)
  final int age;

  @JsonKey(nullable: true)
  final bool is18Plus;

  @JsonKey(nullable: true)
  final DateTime dateOfBirth;

  SubjectDetails({
    this.subjectIdType,
    this.nationality,
    this.aadhaarNumber,
    this.name,
    this.gender,
    this.age,
    this.is18Plus,
    this.dateOfBirth,
  }) {
    assertValid();
  }

  @override
  bool isValid() {
    return true;
  }

  @override
  void assertValid() {}

  static SubjectDetails fromJson(Map json) => _$SubjectDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectDetailsToJson(this);
}
