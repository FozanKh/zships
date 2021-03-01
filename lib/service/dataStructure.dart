import 'package:cloud_firestore/cloud_firestore.dart';

Map<String, dynamic> userStructure({String name, String email, Timestamp currentTimeStamp, bool isAnonymous, String gender, String uid}) {
  return {
    'name': name,
    'email': email,
    'gender': gender,
    'isAnonymous': isAnonymous ?? true,
    'uid': uid,
  };
}

Map<String, dynamic> emailStructure({String emailAdders, bool isVerified, Timestamp lastUpdated}) {
  return {
    'emails': [
      {
        "address": emailAdders ?? '',
        "isVerified": isVerified ?? false,
        "lastUpdated": lastUpdated ?? lastUpdated,
      }
    ]
  };
}

Map<String, dynamic> nameStructure({String firstName, String lastName}) {
  return {
    'firstName': firstName,
    'lastName': lastName,
  };
}

Map<String, dynamic> genderStructure({String gender}) {
  return {
    'gender': gender ?? '',
  };
}

Map<String, dynamic> academicDetailsStructure({String newMajorId, String newUniversityId}) {
  Map<String, dynamic> userAcademicDetails = Map<String, dynamic>();
  userAcademicDetails['majorId'] = newMajorId;
  newUniversityId != null ? userAcademicDetails['universityId'] = newUniversityId : null;

  return {
    "academicDetails": userAcademicDetails,
  };
}

Map<String, dynamic> feedBackStructure({List<String> categories, String comment, String uid}) {
  return {"categories": categories, "comment": comment, "platform": "Flutter", "uid": uid};
}
