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

  static String m4(count) => "${count} slots available";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "Dentist": MessageLookupByLibrary.simpleMessage("Dentist"),
    "Doctors": MessageLookupByLibrary.simpleMessage("Doctors"),
    "afternoonSlots": m0,
    "appointment": MessageLookupByLibrary.simpleMessage("Appointment"),
    "appointmentDetails": m1,
    "appointmentSuccessful": MessageLookupByLibrary.simpleMessage(
      "Your Appointment Successful",
    ),
    "availableTime": MessageLookupByLibrary.simpleMessage("Available Time"),
    "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
    "contactClinic": MessageLookupByLibrary.simpleMessage("Contact Clinic"),
    "continueButton": MessageLookupByLibrary.simpleMessage("Continue"),
    "done": MessageLookupByLibrary.simpleMessage("Done"),
    "editYourAppointment": MessageLookupByLibrary.simpleMessage(
      "Edit your appointment",
    ),
    "eveningSlots": m2,
    "favouriteDoctor": MessageLookupByLibrary.simpleMessage(
      "Favourite Doctors",
    ),
    "featuredDoctors": MessageLookupByLibrary.simpleMessage("Featured Doctors"),
    "minute": MessageLookupByLibrary.simpleMessage("Minute"),
    "nextAvailabilityOn": m3,
    "noSlotsAvailable": MessageLookupByLibrary.simpleMessage(
      "No slots available",
    ),
    "or": MessageLookupByLibrary.simpleMessage("OR"),
    "reminderMeBefore": MessageLookupByLibrary.simpleMessage(
      "Reminder Me Before",
    ),
    "selectTime": MessageLookupByLibrary.simpleMessage("Select Time"),
    "slotsAvailable": m4,
    "thankYou": MessageLookupByLibrary.simpleMessage("Thank You!"),
  };
}
