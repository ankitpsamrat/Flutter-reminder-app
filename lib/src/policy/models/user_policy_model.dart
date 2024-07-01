class UserPolicyModel {
  final int policyId;
  final String policyNumber;
  final DateTime policyCreateDate;
  final DateTime maturityDate;
  final double policyAmount;
  final DateTime premiumDueDate;
  final String docAttach;
  final List<ReminderDtoModel> reminderDTOs;

  UserPolicyModel({
    required this.policyId,
    required this.policyNumber,
    required this.policyCreateDate,
    required this.maturityDate,
    required this.policyAmount,
    required this.premiumDueDate,
    required this.docAttach,
    required this.reminderDTOs,
  });

  factory UserPolicyModel.fromJson(Map<String, dynamic> json) =>
      UserPolicyModel(
        policyId: json["policyId"],
        policyNumber: json["policyNumber"],
        policyCreateDate: DateTime.parse(json["policyCreateDate"]),
        maturityDate: DateTime.parse(json["maturityDate"]),
        policyAmount: json["policyAmount"],
        premiumDueDate: DateTime.parse(json["premiumDueDate"]),
        docAttach: json["docAttach"],
        reminderDTOs: List<ReminderDtoModel>.from(
          json["contactReminderDTOs"].map(
            (x) => ReminderDtoModel.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "policyId": policyId,
        "policyNumber": policyNumber,
        "policyCreateDate": policyCreateDate.toIso8601String(),
        "maturityDate": maturityDate.toIso8601String(),
        "policyAmount": policyAmount,
        "premiumDueDate": premiumDueDate.toIso8601String(),
        "docAttach": docAttach,
        "contactReminderDTOs": List<dynamic>.from(
          reminderDTOs.map((x) => x.toJson()),
        ),
      };
}

class ReminderDtoModel {
  final int contactReminderId;
  final String contactName;
  final String contactPhone;
  final String email;
  final bool enableSms;
  final bool enableEmail;
  final bool enableNotification;
  final bool enableWhatsapp;
  final dynamic reminderItemDtOs;

  ReminderDtoModel({
    required this.contactReminderId,
    required this.contactName,
    required this.contactPhone,
    required this.email,
    required this.enableSms,
    required this.enableEmail,
    required this.enableNotification,
    required this.enableWhatsapp,
    required this.reminderItemDtOs,
  });

  factory ReminderDtoModel.fromJson(Map<String, dynamic> json) =>
      ReminderDtoModel(
        contactReminderId: json["contactReminderId"],
        contactName: json["contactName"],
        contactPhone: json["contactPhone"],
        email: json["email"],
        enableSms: json["enableSms"],
        enableEmail: json["enableEmail"],
        enableNotification: json["enableNotification"],
        enableWhatsapp: json["enableWhatsapp"],
        reminderItemDtOs: json["reminderItemDTOs"],
      );

  Map<String, dynamic> toJson() => {
        "contactReminderId": contactReminderId,
        "contactName": contactName,
        "contactPhone": contactPhone,
        "email": email,
        "enableSms": enableSms,
        "enableEmail": enableEmail,
        "enableNotification": enableNotification,
        "enableWhatsapp": enableWhatsapp,
        "reminderItemDTOs": reminderItemDtOs,
      };
}
