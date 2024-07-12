// ignore_for_file: constant_identifier_names

enum Gender { male, female }

enum MaritalStatus { FirstMarrige, Divorced, Widowed, Married }

enum SwedishCounties {
  Aland, // Replace Åland with Aland
  Dalarnas,
  Gavleborg,
  Gotland,
  Halland,
  Jonkoping, // Replace Jönköping with Jonkoping
  Kalmar,
  Kronoberg,
  Norrbotten,
  Skane, // Replace Skåne with Skane
  Stockholm,
  Sodermanland, // Replace Södermanland with Sodermanland
  Uppsala,
  Varmland, // Replace Värmland with Varmland
  Vasterbotten, // Replace Västerbotten with Vasterbotten
  Vasternorrland, // Replace Västernorrland with Vasternorrland
  Vastmanland, // Replace Västmanland with Vastmanland
  Orebro, // Replace Örebro with Orebro
  Ostergotland, // Replace Östergötland with Ostergotland
}

enum SkinColor {
  white,
  wheatishWhitish,
  lightBrownToBrown,
  moderateBrown,
  darkBrown,
  black
}

enum Hijab { yes, no, NA } // New enum for hijab (Yes/No/Not Applicable)

enum Religion { Sunni, Shia } // New enum for religion

enum Frequency {
  yes,
  no,
  usually
} // New enum for frequently used options (Yes/No/Usually)

enum Education { MiddleSchool, HighSchool, Graduate, Doctorate, SelfStudy }


enum UserType { admin, verified, unverified, disabled, guest, blocked }

enum LikeStatus {
  pending,
  accepted,
  rejected,
  disabled, liked
}

enum MatchStatus { none, pending, accepted, rejected, disabled }
