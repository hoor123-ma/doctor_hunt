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
  String get dentist {
    return Intl.message('Dentist', name: 'dentist', desc: '', args: []);
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
  String get doctors {
    return Intl.message('Doctors', name: 'doctors', desc: '', args: []);
  }

  /// `Create Doctor`
  String get createDoctor {
    return Intl.message(
      'Create Doctor',
      name: 'createDoctor',
      desc: '',
      args: [],
    );
  }

  /// `Doctor Name`
  String get doctorName {
    return Intl.message('Doctor Name', name: 'doctorName', desc: '', args: []);
  }

  /// `Doctor Speciality`
  String get doctorSpeciality {
    return Intl.message(
      'Doctor Speciality',
      name: 'doctorSpeciality',
      desc: '',
      args: [],
    );
  }

  /// `Add Photo`
  String get addPhoto {
    return Intl.message('Add Photo', name: 'addPhoto', desc: '', args: []);
  }

  /// `e.g. Dr. Ahmed Ali`
  String get doctorNameHint {
    return Intl.message(
      'e.g. Dr. Ahmed Ali',
      name: 'doctorNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Medical Specialty`
  String get medicalSpecialty {
    return Intl.message(
      'Medical Specialty',
      name: 'medicalSpecialty',
      desc: '',
      args: [],
    );
  }

  /// `e.g. Dentist`
  String get specialtyHint {
    return Intl.message(
      'e.g. Dentist',
      name: 'specialtyHint',
      desc: '',
      args: [],
    );
  }

  /// `Create Doctor`
  String get createDoctorButton {
    return Intl.message(
      'Create Doctor',
      name: 'createDoctorButton',
      desc: '',
      args: [],
    );
  }

  /// `Doctor Created Successfully`
  String get doctorCreatedSuccessfully {
    return Intl.message(
      'Doctor Created Successfully',
      name: 'doctorCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get active {
    return Intl.message('Active', name: 'active', desc: '', args: []);
  }

  /// `Inactive`
  String get inactive {
    return Intl.message('Inactive', name: 'inactive', desc: '', args: []);
  }

  /// `Doctor's photo must be added`
  String get doctorPhotoMustBeAdded {
    return Intl.message(
      'Doctor\'s photo must be added',
      name: 'doctorPhotoMustBeAdded',
      desc: '',
      args: [],
    );
  }

  /// `Search doctors...`
  String get searchDoctors {
    return Intl.message(
      'Search doctors...',
      name: 'searchDoctors',
      desc: '',
      args: [],
    );
  }

  /// `No Doctors Found`
  String get noDoctorsFound {
    return Intl.message(
      'No Doctors Found',
      name: 'noDoctorsFound',
      desc: '',
      args: [],
    );
  }

  /// `There are currently no doctors registered on Doctor Hunt. Add your first doctor to get started.`
  String get noDoctorsRegistered {
    return Intl.message(
      'There are currently no doctors registered on Doctor Hunt. Add your first doctor to get started.',
      name: 'noDoctorsRegistered',
      desc: '',
      args: [],
    );
  }

  /// `Active Doctors`
  String get activeDoctors {
    return Intl.message(
      'Active Doctors',
      name: 'activeDoctors',
      desc: '',
      args: [],
    );
  }

  /// `Total Doctors`
  String get totalDoctors {
    return Intl.message(
      'Total Doctors',
      name: 'totalDoctors',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Doctor Details`
  String get doctorDetails {
    return Intl.message(
      'Doctor Details',
      name: 'doctorDetails',
      desc: '',
      args: [],
    );
  }

  /// `Tap photo to change`
  String get tapPhotoToChange {
    return Intl.message(
      'Tap photo to change',
      name: 'tapPhotoToChange',
      desc: '',
      args: [],
    );
  }

  /// `Edit Doctor`
  String get editDoctor {
    return Intl.message('Edit Doctor', name: 'editDoctor', desc: '', args: []);
  }

  /// `Save Changes`
  String get saveChanges {
    return Intl.message(
      'Save Changes',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Update Doctor`
  String get updateDoctorButton {
    return Intl.message(
      'Update Doctor',
      name: 'updateDoctorButton',
      desc: '',
      args: [],
    );
  }

  /// `Doctor Updated Successfully`
  String get doctorUpdatedSuccessfully {
    return Intl.message(
      'Doctor Updated Successfully',
      name: 'doctorUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Delete Doctor`
  String get deleteDoctor {
    return Intl.message(
      'Delete Doctor',
      name: 'deleteDoctor',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this doctor?`
  String get areYouSureYouWantToDeleteThisDoctor {
    return Intl.message(
      'Are you sure you want to delete this doctor?',
      name: 'areYouSureYouWantToDeleteThisDoctor',
      desc: '',
      args: [],
    );
  }

  /// `Yes, Delete`
  String get yesDelete {
    return Intl.message('Yes, Delete', name: 'yesDelete', desc: '', args: []);
  }

  /// `No, Cancel`
  String get noCancel {
    return Intl.message('No, Cancel', name: 'noCancel', desc: '', args: []);
  }

  /// `Doctor Status`
  String get doctorStatus {
    return Intl.message(
      'Doctor Status',
      name: 'doctorStatus',
      desc: '',
      args: [],
    );
  }

  /// `Active & Available`
  String get active_Available {
    return Intl.message(
      'Active & Available',
      name: 'active_Available',
      desc: '',
      args: [],
    );
  }

  /// `Find Doctors`
  String get findDoctors {
    return Intl.message(
      'Find Doctors',
      name: 'findDoctors',
      desc: '',
      args: [],
    );
  }

  /// `{count} Years experience`
  String yearsExperience(Object count) {
    return Intl.message(
      '$count Years experience',
      name: 'yearsExperience',
      desc: '',
      args: [count],
    );
  }

  /// `{count} Patient Stories`
  String patientStories(Object count) {
    return Intl.message(
      '$count Patient Stories',
      name: 'patientStories',
      desc: '',
      args: [count],
    );
  }

  /// `{count}% Positive Reviews`
  String positiveReviews(Object count) {
    return Intl.message(
      '$count% Positive Reviews',
      name: 'positiveReviews',
      desc: '',
      args: [count],
    );
  }

  /// `Next Available`
  String get nextAvailable {
    return Intl.message(
      'Next Available',
      name: 'nextAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Book now`
  String get bookNow {
    return Intl.message('Book now', name: 'bookNow', desc: '', args: []);
  }

  /// `Live Doctors`
  String get liveDoctors {
    return Intl.message(
      'Live Doctors',
      name: 'liveDoctors',
      desc: '',
      args: [],
    );
  }

  /// `Popular Doctors`
  String get popularDoctors {
    return Intl.message(
      'Popular Doctors',
      name: 'popularDoctors',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get seeAll {
    return Intl.message('See all', name: 'seeAll', desc: '', args: []);
  }

  /// `Feature Doctor`
  String get featureDoctor {
    return Intl.message(
      'Feature Doctor',
      name: 'featureDoctor',
      desc: '',
      args: [],
    );
  }

  /// `Patient`
  String get patient {
    return Intl.message('Patient', name: 'patient', desc: '', args: []);
  }

  /// `Doctor`
  String get doctor {
    return Intl.message('Doctor', name: 'doctor', desc: '', args: []);
  }

  /// `On going`
  String get onGoing {
    return Intl.message('On going', name: 'onGoing', desc: '', args: []);
  }

  /// `Running`
  String get running {
    return Intl.message('Running', name: 'running', desc: '', args: []);
  }

  /// `Services`
  String get services {
    return Intl.message('Services', name: 'services', desc: '', args: []);
  }

  /// ` Patient care should be the number one priority.`
  String get patientCare {
    return Intl.message(
      ' Patient care should be the number one priority.',
      name: 'patientCare',
      desc: '',
      args: [],
    );
  }

  /// `If you run your practiceyou know how frustrating.`
  String get frustrating {
    return Intl.message(
      'If you run your practiceyou know how frustrating.',
      name: 'frustrating',
      desc: '',
      args: [],
    );
  }

  /// `That’s why some of appointment reminder system.`
  String get appointmentReminder {
    return Intl.message(
      'That’s why some of appointment reminder system.',
      name: 'appointmentReminder',
      desc: '',
      args: [],
    );
  }

  /// `LIVE`
  String get live {
    return Intl.message('LIVE', name: 'live', desc: '', args: []);
  }

  /// `Find Your Doctor`
  String get findYourDoctor {
    return Intl.message(
      'Find Your Doctor',
      name: 'findYourDoctor',
      desc: '',
      args: [],
    );
  }

  /// `Search..... `
  String get searchHint {
    return Intl.message('Search..... ', name: 'searchHint', desc: '', args: []);
  }

  /// `Hi {userName}!`
  String welcomeMessage(Object userName) {
    return Intl.message(
      'Hi $userName!',
      name: 'welcomeMessage',
      desc: '',
      args: [userName],
    );
  }

  /// `Doctor Hunt`
  String get appName {
    return Intl.message('Doctor Hunt', name: 'appName', desc: '', args: []);
  }

  /// `Find Trusted Doctors`
  String get onBoardingTitle1 {
    return Intl.message(
      'Find Trusted Doctors',
      name: 'onBoardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Find trusted doctors and specialists near you with just a few taps.`
  String get onBoardingSubTitle1 {
    return Intl.message(
      'Find trusted doctors and specialists near you with just a few taps.',
      name: 'onBoardingSubTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Choose the Best Doctor`
  String get onBoardingTitle2 {
    return Intl.message(
      'Choose the Best Doctor',
      name: 'onBoardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Explore specialties, ratings, and patient reviews to find the right doctor for you.`
  String get onBoardingSubTitle2 {
    return Intl.message(
      'Explore specialties, ratings, and patient reviews to find the right doctor for you.',
      name: 'onBoardingSubTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Book Your Appointment`
  String get onBoardingTitle3 {
    return Intl.message(
      'Book Your Appointment',
      name: 'onBoardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Choose your preferred time and book your appointment quickly and easily.`
  String get onBoardingSubTitle3 {
    return Intl.message(
      'Choose your preferred time and book your appointment quickly and easily.',
      name: 'onBoardingSubTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Welcome back`
  String get welcomeBack {
    return Intl.message(
      'Welcome back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `You can search course, apply course and find scholarship for abroad studies`
  String get youCanSearchCourse {
    return Intl.message(
      'You can search course, apply course and find scholarship for abroad studies',
      name: 'youCanSearchCourse',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account? `
  String get haveAnAccount {
    return Intl.message(
      'Don’t have an account? ',
      name: 'haveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Join us`
  String get joinUs {
    return Intl.message('Join us', name: 'joinUs', desc: '', args: []);
  }

  /// `Choose your role`
  String get chooseYourRole {
    return Intl.message(
      'Choose your role',
      name: 'chooseYourRole',
      desc: '',
      args: [],
    );
  }

  /// `The selected role determines the experience and available features.`
  String get roleSelectionTitle {
    return Intl.message(
      'The selected role determines the experience and available features.',
      name: 'roleSelectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Find doctors, book\nappointments,\nand manage your medical\nrecords.`
  String get roleSelectionSubtitle {
    return Intl.message(
      'Find doctors, book\nappointments,\nand manage your medical\nrecords.',
      name: 'roleSelectionSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Admin`
  String get admin {
    return Intl.message('Admin', name: 'admin', desc: '', args: []);
  }

  /// `Manage doctors, appointments,\nusers, and the platform.`
  String get adminDescription {
    return Intl.message(
      'Manage doctors, appointments,\nusers, and the platform.',
      name: 'adminDescription',
      desc: '',
      args: [],
    );
  }

  /// `Join us to start searching`
  String get signUpTitle {
    return Intl.message(
      'Join us to start searching',
      name: 'signUpTitle',
      desc: '',
      args: [],
    );
  }

  /// `You can search course, apply course and find scholarship for abroad studies`
  String get signUpSubTitle {
    return Intl.message(
      'You can search course, apply course and find scholarship for abroad studies',
      name: 'signUpSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get logIn {
    return Intl.message('Log in', name: 'logIn', desc: '', args: []);
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `I agree with the Terms of Service & Privacy Policy`
  String get termsAndPrivacy {
    return Intl.message(
      'I agree with the Terms of Service & Privacy Policy',
      name: 'termsAndPrivacy',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message('Sign up', name: 'signUp', desc: '', args: []);
  }

  /// `Google`
  String get google {
    return Intl.message('Google', name: 'google', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Forgot password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password reset code sent successfully`
  String get passwordResetCodeSent {
    return Intl.message(
      'Password reset code sent successfully',
      name: 'passwordResetCodeSent',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgotPasswordTitle {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email for the verification process`
  String get enterEmail {
    return Intl.message(
      'Enter your email for the verification process',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message('Send', name: 'send', desc: '', args: []);
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Re-enter Password`
  String get reEnterPassword {
    return Intl.message(
      'Re-enter Password',
      name: 'reEnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Speciality`
  String get speciality {
    return Intl.message('Speciality', name: 'speciality', desc: '', args: []);
  }

  /// `Account Status`
  String get accountStatus {
    return Intl.message(
      'Account Status',
      name: 'accountStatus',
      desc: '',
      args: [],
    );
  }

  /// `Add Doctor`
  String get addDoctor {
    return Intl.message('Add Doctor', name: 'addDoctor', desc: '', args: []);
  }

  /// `Are you sure you want to delete this doctor?`
  String get deleteDoctorDialogContent {
    return Intl.message(
      'Are you sure you want to delete this doctor?',
      name: 'deleteDoctorDialogContent',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
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
