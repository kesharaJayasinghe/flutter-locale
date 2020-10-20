// To parse this JSON data, do
//
//     final langEn = langEnFromJson(jsonString);

import 'dart:convert';

List<LangEn> langEnFromJson(String str) =>
    List<LangEn>.from(json.decode(str).map((x) => LangEn.fromJson(x)));

String langEnToJson(List<LangEn> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LangEn {
  LangEn({
    this.homePage,
    this.addInformation,
    this.name,
    this.nameHint,
    this.email,
    this.emailHint,
    this.dateOfBirth,
    this.requiredField,
    this.proceed,
    this.aboutUs,
    this.settings,
    this.changeLanguage,
    this.about,
  });

  String homePage;
  String addInformation;
  String name;
  String nameHint;
  String email;
  String emailHint;
  String dateOfBirth;
  String requiredField;
  String proceed;
  String aboutUs;
  String settings;
  String changeLanguage;
  String about;

  factory LangEn.fromJson(Map<String, dynamic> json) => LangEn(
        homePage: json["home_page"],
        addInformation: json["add_information"],
        name: json["name"],
        nameHint: json["name_hint"],
        email: json["email"],
        emailHint: json["email_hint"],
        dateOfBirth: json["date_of_birth"],
        requiredField: json["required_field"],
        proceed: json["proceed"],
        aboutUs: json["about_us"],
        settings: json["settings"],
        changeLanguage: json["change_language"],
        about: json["about"],
      );

  Map<String, dynamic> toJson() => {
        "home_page": homePage,
        "add_information": addInformation,
        "name": name,
        "name_hint": nameHint,
        "email": email,
        "email_hint": emailHint,
        "date_of_birth": dateOfBirth,
        "required_field": requiredField,
        "proceed": proceed,
        "about_us": aboutUs,
        "settings": settings,
        "change_language": changeLanguage,
        "about": about,
      };
}
