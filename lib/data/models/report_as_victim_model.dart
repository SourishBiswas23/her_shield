class ReportAsVictimModel {
  ReportAsVictimModel({
    required this.userId,
    required this.userName,
    required this.userPhoneNumber,
    required this.userEmail,
    required this.contactNumber,
    required this.userDesignation,
    required this.userAdhaarNumber,
    required this.organisationName,
    required this.organisationPhone,
    required this.organisationEmail,
    required this.organisationHead,
    required this.organisationState,
    required this.organisationDistrict,
    required this.organisationAddress,
    required this.offendersName,
    required this.offendersDesignation,
    required this.offendersWorkingRelationship,
  });

  final String userId;
  final String contactNumber;
  final String userName;
  final String userPhoneNumber;
  final String userEmail;
  final String userDesignation;
  final String userAdhaarNumber;
  final String organisationName;
  final String organisationPhone;
  final String organisationEmail;
  final String organisationHead;
  final String organisationState;
  final String organisationDistrict;
  final String organisationAddress;
  final String offendersName;
  final String offendersDesignation;
  final String offendersWorkingRelationship;
}
