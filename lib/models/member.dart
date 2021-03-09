class Members {
  String MembershipId;
  String MemberType;
  String MainMemberId;
  String FirstName;
  String MiddleName;
  String LastGautra;
  String Mobile1;
  String Mobile2;
  String Mobile3;
  String Photo;
  String Education, OtherEducationName;
  String BloodGroup;
  String EmailId;
  String DOB;
  String Relation;
  String ProfessionId, ProfessionName;
  String NativeId;

  Members({
    this.MembershipId,
    this.FirstName,
    this.MiddleName,
    this.LastGautra,
    this.Mobile1,
    this.Photo,
    this.Education,
    this.OtherEducationName,
    this.BloodGroup,
    this.EmailId,
    this.DOB,
    this.MemberType,
    this.MainMemberId,
    this.Relation,
    this.Mobile2,
    this.Mobile3,
    this.ProfessionId,
    this.ProfessionName,
    this.NativeId,
  });

  factory Members.fromJson(Map<String, dynamic> json) {
    return Members(
      MembershipId: json['MembershipId'],
      Relation: json['Relation'],
      FirstName: json['FirstName'],
      MiddleName: json['MiddleName'],
      LastGautra: json['LastGautra'],
      Mobile1: json['Mobile1'],
      Photo: json['Photo'],
      Education: json['EducationName'],
      OtherEducationName: json['OtherEducationName'],
      BloodGroup: json['BloodGroup'],
      EmailId: json['Emaild'],
      DOB: json['DOB'],
      MemberType: json['MemberType'],
      MainMemberId: json['MainMemberId'],
      Mobile2: json['Mobile2'],
      Mobile3: json['Mobile3'],
      ProfessionId: json['ProfessionId'],
      ProfessionName: json['ProfessionName'],
      NativeId: json['NativeId'],
    );
  }
}
