// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count) => "Afternoon ${count} slots";

  static String m1(doctorName, date, time) =>
      "You booked an appointment with Dr. ${doctorName} on ${date}, at ${time}.";

  static String m2(count) => "Evening ${count} slots";

  static String m3(nextTime) => "Next availability on ${nextTime}";

  static String m4(count) => "${count} Patient Stories";

  static String m5(count) => "${count}% Positive Reviews";

  static String m6(count) => "${count} slots available";

  static String m7(userName) => "Hi ${userName}!";

  static String m8(count) => "${count} Years experience";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accountStatus": MessageLookupByLibrary.simpleMessage("Account Status"),
    "active": MessageLookupByLibrary.simpleMessage("Active"),
    "activeDoctors": MessageLookupByLibrary.simpleMessage("Active Doctors"),
    "active_Available": MessageLookupByLibrary.simpleMessage(
      "Active & Available",
    ),
    "addDoctor": MessageLookupByLibrary.simpleMessage("Add Doctor"),
    "addPhoto": MessageLookupByLibrary.simpleMessage("Add Photo"),
    "admin": MessageLookupByLibrary.simpleMessage("Admin"),
    "adminDescription": MessageLookupByLibrary.simpleMessage(
      "Manage doctors, appointments,\nusers, and the platform.",
    ),
    "afternoonSlots": m0,
    "alreadyHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "Already have an account?",
    ),
    "appName": MessageLookupByLibrary.simpleMessage("Doctor Hunt"),
    "appointment": MessageLookupByLibrary.simpleMessage("Appointment"),
    "appointmentDetails": m1,
    "appointmentReminder": MessageLookupByLibrary.simpleMessage(
      "That’s why some of appointment reminder system.",
    ),
    "appointmentSuccessful": MessageLookupByLibrary.simpleMessage(
      "Your Appointment Successful",
    ),
    "areYouSureYouWantToDeleteThisDoctor": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this doctor?",
    ),
    "availableTime": MessageLookupByLibrary.simpleMessage("Available Time"),
    "bookNow": MessageLookupByLibrary.simpleMessage("Book now"),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "chooseYourRole": MessageLookupByLibrary.simpleMessage("Choose your role"),
    "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
    "confirmPassword": MessageLookupByLibrary.simpleMessage("Confirm Password"),
    "contactClinic": MessageLookupByLibrary.simpleMessage("Contact Clinic"),
    "continueButton": MessageLookupByLibrary.simpleMessage("Continue"),
    "createDoctor": MessageLookupByLibrary.simpleMessage("Create Doctor"),
    "createDoctorButton": MessageLookupByLibrary.simpleMessage("Create Doctor"),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "deleteDoctor": MessageLookupByLibrary.simpleMessage("Delete Doctor"),
    "deleteDoctorDialogContent": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this doctor?",
    ),
    "dentist": MessageLookupByLibrary.simpleMessage("Dentist"),
    "doctor": MessageLookupByLibrary.simpleMessage("Doctor"),
    "doctorCreatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Doctor Created Successfully",
    ),
    "doctorDetails": MessageLookupByLibrary.simpleMessage("Doctor Details"),
    "doctorName": MessageLookupByLibrary.simpleMessage("Doctor Name"),
    "doctorNameHint": MessageLookupByLibrary.simpleMessage(
      "e.g. Dr. Ahmed Ali",
    ),
    "doctorPhotoMustBeAdded": MessageLookupByLibrary.simpleMessage(
      "Doctor\'s photo must be added",
    ),
    "doctorSpeciality": MessageLookupByLibrary.simpleMessage(
      "Doctor Speciality",
    ),
    "doctorStatus": MessageLookupByLibrary.simpleMessage("Doctor Status"),
    "doctorUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Doctor Updated Successfully",
    ),
    "doctors": MessageLookupByLibrary.simpleMessage("Doctors"),
    "done": MessageLookupByLibrary.simpleMessage("Done"),
    "editDoctor": MessageLookupByLibrary.simpleMessage("Edit Doctor"),
    "editYourAppointment": MessageLookupByLibrary.simpleMessage(
      "Edit your appointment",
    ),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "enterEmail": MessageLookupByLibrary.simpleMessage(
      "Enter your email for the verification process",
    ),
    "eveningSlots": m2,
    "favouriteDoctor": MessageLookupByLibrary.simpleMessage(
      "Favourite Doctors",
    ),
    "featureDoctor": MessageLookupByLibrary.simpleMessage("Feature Doctor"),
    "featuredDoctors": MessageLookupByLibrary.simpleMessage("Featured Doctors"),
    "findDoctors": MessageLookupByLibrary.simpleMessage("Find Doctors"),
    "findYourDoctor": MessageLookupByLibrary.simpleMessage("Find Your Doctor"),
    "forgotPassword": MessageLookupByLibrary.simpleMessage("Forgot password?"),
    "forgotPasswordTitle": MessageLookupByLibrary.simpleMessage(
      "Forgot Password",
    ),
    "frustrating": MessageLookupByLibrary.simpleMessage(
      "If you run your practiceyou know how frustrating.",
    ),
    "getStarted": MessageLookupByLibrary.simpleMessage("Get Started"),
    "google": MessageLookupByLibrary.simpleMessage("Google"),
    "haveAnAccount": MessageLookupByLibrary.simpleMessage(
      "Don’t have an account? ",
    ),
    "inactive": MessageLookupByLibrary.simpleMessage("Inactive"),
    "joinUs": MessageLookupByLibrary.simpleMessage("Join us"),
    "live": MessageLookupByLibrary.simpleMessage("LIVE"),
    "liveDoctors": MessageLookupByLibrary.simpleMessage("Live Doctors"),
    "logIn": MessageLookupByLibrary.simpleMessage("Log in"),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "medicalSpecialty": MessageLookupByLibrary.simpleMessage(
      "Medical Specialty",
    ),
    "minute": MessageLookupByLibrary.simpleMessage("Minute"),
    "name": MessageLookupByLibrary.simpleMessage("Name"),
    "newPassword": MessageLookupByLibrary.simpleMessage("New Password"),
    "nextAvailabilityOn": m3,
    "nextAvailable": MessageLookupByLibrary.simpleMessage("Next Available"),
    "noCancel": MessageLookupByLibrary.simpleMessage("No, Cancel"),
    "noDoctorsFound": MessageLookupByLibrary.simpleMessage("No Doctors Found"),
    "noDoctorsRegistered": MessageLookupByLibrary.simpleMessage(
      "There are currently no doctors registered on Doctor Hunt. Add your first doctor to get started.",
    ),
    "noSlotsAvailable": MessageLookupByLibrary.simpleMessage(
      "No slots available",
    ),
    "onBoardingSubTitle1": MessageLookupByLibrary.simpleMessage(
      "Find trusted doctors and specialists near you with just a few taps.",
    ),
    "onBoardingSubTitle2": MessageLookupByLibrary.simpleMessage(
      "Explore specialties, ratings, and patient reviews to find the right doctor for you.",
    ),
    "onBoardingSubTitle3": MessageLookupByLibrary.simpleMessage(
      "Choose your preferred time and book your appointment quickly and easily.",
    ),
    "onBoardingTitle1": MessageLookupByLibrary.simpleMessage(
      "Find Trusted Doctors",
    ),
    "onBoardingTitle2": MessageLookupByLibrary.simpleMessage(
      "Choose the Best Doctor",
    ),
    "onBoardingTitle3": MessageLookupByLibrary.simpleMessage(
      "Book Your Appointment",
    ),
    "onGoing": MessageLookupByLibrary.simpleMessage("On going"),
    "or": MessageLookupByLibrary.simpleMessage("OR"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordResetCodeSent": MessageLookupByLibrary.simpleMessage(
      "Password reset code sent successfully",
    ),
    "patient": MessageLookupByLibrary.simpleMessage("Patient"),
    "patientCare": MessageLookupByLibrary.simpleMessage(
      " Patient care should be the number one priority.",
    ),
    "patientStories": m4,
    "popularDoctors": MessageLookupByLibrary.simpleMessage("Popular Doctors"),
    "positiveReviews": m5,
    "reEnterPassword": MessageLookupByLibrary.simpleMessage(
      "Re-enter Password",
    ),
    "reminderMeBefore": MessageLookupByLibrary.simpleMessage(
      "Reminder Me Before",
    ),
    "roleSelectionSubtitle": MessageLookupByLibrary.simpleMessage(
      "Find doctors, book\nappointments,\nand manage your medical\nrecords.",
    ),
    "roleSelectionTitle": MessageLookupByLibrary.simpleMessage(
      "The selected role determines the experience and available features.",
    ),
    "running": MessageLookupByLibrary.simpleMessage("Running"),
    "saveChanges": MessageLookupByLibrary.simpleMessage("Save Changes"),
    "searchDoctors": MessageLookupByLibrary.simpleMessage("Search doctors..."),
    "searchHint": MessageLookupByLibrary.simpleMessage("Search..... "),
    "seeAll": MessageLookupByLibrary.simpleMessage("See all"),
    "selectTime": MessageLookupByLibrary.simpleMessage("Select Time"),
    "send": MessageLookupByLibrary.simpleMessage("Send"),
    "services": MessageLookupByLibrary.simpleMessage("Services"),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "signUp": MessageLookupByLibrary.simpleMessage("Sign up"),
    "signUpSubTitle": MessageLookupByLibrary.simpleMessage(
      "You can search course, apply course and find scholarship for abroad studies",
    ),
    "signUpTitle": MessageLookupByLibrary.simpleMessage(
      "Join us to start searching",
    ),
    "skip": MessageLookupByLibrary.simpleMessage("Skip"),
    "slotsAvailable": m6,
    "speciality": MessageLookupByLibrary.simpleMessage("Speciality"),
    "specialtyHint": MessageLookupByLibrary.simpleMessage("e.g. Dentist"),
    "tapPhotoToChange": MessageLookupByLibrary.simpleMessage(
      "Tap photo to change",
    ),
    "termsAndPrivacy": MessageLookupByLibrary.simpleMessage(
      "I agree with the Terms of Service & Privacy Policy",
    ),
    "thankYou": MessageLookupByLibrary.simpleMessage("Thank You!"),
    "totalDoctors": MessageLookupByLibrary.simpleMessage("Total Doctors"),
    "updateDoctorButton": MessageLookupByLibrary.simpleMessage("Update Doctor"),
    "welcomeBack": MessageLookupByLibrary.simpleMessage("Welcome back"),
    "welcomeMessage": m7,
    "yearsExperience": m8,
    "yesDelete": MessageLookupByLibrary.simpleMessage("Yes, Delete"),
    "youCanSearchCourse": MessageLookupByLibrary.simpleMessage(
      "You can search course, apply course and find scholarship for abroad studies",
    ),
  };
}
