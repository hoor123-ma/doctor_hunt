// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Select Time`
  String get selectTime {
    return Intl.message('Select Time', name: 'selectTime', desc: '', args: []);
  }

  /// `Appointment`
  String get appointment {
    return Intl.message('Appointment', name: 'appointment', desc: '', args: []);
  }

  /// `Available Time`
  String get availableTime {
    return Intl.message(
      'Available Time',
      name: 'availableTime',
      desc: '',
      args: [],
    );
  }

  /// `Reminder Me Before`
  String get reminderMeBefore {
    return Intl.message(
      'Reminder Me Before',
      name: 'reminderMeBefore',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Thank You!`
  String get thankYou {
    return Intl.message('Thank You!', name: 'thankYou', desc: '', args: []);
  }

  /// `Your Appointment Successful`
  String get appointmentSuccessful {
    return Intl.message(
      'Your Appointment Successful',
      name: 'appointmentSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `You booked an appointment with Dr. {doctorName} on {date}, at {time}.`
  String appointmentDetails(Object doctorName, Object date, Object time) {
    return Intl.message(
      'You booked an appointment with Dr. $doctorName on $date, at $time.',
      name: 'appointmentDetails',
      desc: '',
      args: [doctorName, date, time],
    );
  }

  /// `Done`
  String get done {
    return Intl.message('Done', name: 'done', desc: '', args: []);
  }

  /// `Edit your appointment`
  String get editYourAppointment {
    return Intl.message(
      'Edit your appointment',
      name: 'editYourAppointment',
      desc: '',
      args: [],
    );
  }

  /// `Minute`
  String get minute {
    return Intl.message('Minute', name: 'minute', desc: '', args: []);
  }

  /// `Afternoon {count} slots`
  String afternoonSlots(Object count) {
    return Intl.message(
      'Afternoon $count slots',
      name: 'afternoonSlots',
      desc: '',
      args: [count],
    );
  }

  /// `Evening {count} slots`
  String eveningSlots(Object count) {
    return Intl.message(
      'Evening $count slots',
      name: 'eveningSlots',
      desc: '',
      args: [count],
    );
  }

  /// `Continue`
  String get continueButton {
    return Intl.message('Continue', name: 'continueButton', desc: '', args: []);
  }

  /// `No slots available`
  String get noSlotsAvailable {
    return Intl.message(
      'No slots available',
      name: 'noSlotsAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Next availability on {nextTime}`
  String nextAvailabilityOn(Object nextTime) {
    return Intl.message(
      'Next availability on $nextTime',
      name: 'nextAvailabilityOn',
      desc: '',
      args: [nextTime],
    );
  }

  /// `OR`
  String get or {
    return Intl.message('OR', name: 'or', desc: '', args: []);
  }

  /// `Contact Clinic`
  String get contactClinic {
    return Intl.message(
      'Contact Clinic',
      name: 'contactClinic',
      desc: '',
      args: [],
    );
  }

  /// `{count} slots available`
  String slotsAvailable(Object count) {
    return Intl.message(
      '$count slots available',
      name: 'slotsAvailable',
      desc: '',
      args: [count],
    );
  }

  /// `Favourite Doctors`
  String get favouriteDoctor {
    return Intl.message(
      'Favourite Doctors',
      name: 'favouriteDoctor',
      desc: '',
      args: [],
    );
  }

  /// `Dentist`
  String get Dentist {
    return Intl.message('Dentist', name: 'Dentist', desc: '', args: []);
  }

  /// `Featured Doctors`
  String get featuredDoctors {
    return Intl.message(
      'Featured Doctors',
      name: 'featuredDoctors',
      desc: '',
      args: [],
    );
  }

  /// `Doctors`
  String get Doctors {
    return Intl.message('Doctors', name: 'Doctors', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
