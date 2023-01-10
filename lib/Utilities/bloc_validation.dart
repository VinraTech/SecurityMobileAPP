import 'dart:async';
import 'package:rxdart/rxdart.dart';

class ValidationBloc {
  final _phoneNumber = BehaviorSubject<String>.seeded('');
  final _password = BehaviorSubject<String>.seeded('');
  final _forgotPassword = BehaviorSubject<String>.seeded("");
  final _confirmPassword = BehaviorSubject<String>.seeded("");
  final _fullName = BehaviorSubject<String>.seeded('');
  final _cityName = BehaviorSubject<String>.seeded('');
  final _email = BehaviorSubject<String>.seeded('');
  final _emailAndPhone = BehaviorSubject<String>.seeded('');
  final _address = BehaviorSubject<String>.seeded('');
  final _firmName = BehaviorSubject<String>.seeded('');
  final _oldPassword = BehaviorSubject<String>.seeded('');
  final _url = BehaviorSubject<String>.seeded('');

  Stream<String> get firmName => _firmName.stream.transform(validateEntry);

  Sink<String> get sinkFirmName => _firmName.sink;

  Stream<String> get address => _address.stream.transform(validateEntry);

  Sink<String> get sinkAddress => _address.sink;

  Stream<String> get cityName => _cityName.stream.transform(validateName);

  Sink<String> get sinkCityName => _cityName.sink;

  Stream<String> get fullName => _fullName.stream.transform(validateFullName);

  Sink<String> get sinkName => _fullName.sink;

  Stream<String> get phoneNo => _phoneNumber.stream.transform(validatePhoneNo);

  Sink<String> get sinkPhoneNo => _phoneNumber.sink;

  Stream<String> get forgotPassword =>
      _forgotPassword.stream.transform(validatePhoneNo);

  Sink<String> get sinkForgot => _forgotPassword.sink;

  Stream<String> get password => _password.stream.transform(validatePassword);

  Sink<String> get sinkPassword => _password.sink;

  Stream<String> get oldPassword =>
      _oldPassword.stream.transform(validatePassword);

  Sink<String> get sinkoldPassword => _oldPassword.sink;

  Stream<String> get confirmPassword =>
      _confirmPassword.stream.transform(validatePassword);

  Sink<String> get sinkConfirmPassword => _confirmPassword.sink;

  Stream<String> get email => _email.stream.transform(validateEmail);

  Sink<String> get sinkEmail => _email.sink;

  Stream<String> get emailAndMobile =>
      _emailAndPhone.stream.transform(validateEmailAndPhone);

  Sink<String> get sinkEmailAndPhone => _emailAndPhone.sink;

  Stream<String> get url => _url.stream.transform(validateEntry);

  Sink<String> get sinkUrl => _url.sink;

  Stream<bool> get checkPhoneValidate =>
      Rx.combineLatest({emailAndMobile}, (values) => true);

  Stream<bool> get checkResetPasswordValidate =>
      Rx.combineLatest2(password, confirmPassword, (a, b) => true);

  Stream<bool> get registerUser => Rx.combineLatest4(
      fullName, email, phoneNo, password, (a, b, c, d) => true);

  Stream<bool> get registerRetailerUser => Rx.combineLatest5(
      fullName, email, phoneNo, password, url, (a, b, c, d, e) => true);

  Stream<bool> get checkUserInfoValidate =>
      Rx.combineLatest2(email, phoneNo, (a, b) => true);

  Stream<bool> get checkUserInfoRetailerValidate =>
      Rx.combineLatest3(email, phoneNo, url, (a, b, c) => true);

  Stream<bool> get submitValid =>
      Rx.combineLatest2(emailAndMobile, password, (e, p) => true);

  Stream<bool> get validateCustomerEditProfile =>
      Rx.combineLatest3(fullName, phoneNo, email, (a, b, c) => true);

  Stream<bool> get validateRetailerEditProfile =>
      Rx.combineLatest4(fullName, phoneNo, email, url, (a, b, c, d) => true);

  final validateBudget =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.length > 0) {
      isRupees(value)
          ? sink.add(value)
          : sink.addError('Please fill the budget');
    }
  });

  static bool isRupees(String rupees) {
    String value = r'(?=.*?\d)^\$?(([1-9]\d{0,2}(,\d{3})*)|\d+)?(\.\d{1,2})?$';
    RegExp regExp = RegExp(value);
    return regExp.hasMatch(rupees);
  }

  final validateDescription =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    value.length > 10
        ? sink.add(value)
        : sink.addError("Description must be in 10 characters");
  });

  final validateText =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    value.length > 10 ? sink.add(value) : sink.addError("Too Short");
  });

  final validateEntry =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
        if(value.length > 0){
          value.length > 5 ? sink.add(value) : sink.addError("Too Short");
        }
  });

  static bool isName(String name) {
    String value = r'(^[a-zA-Z ]*$)';
    RegExp regExp = RegExp(value);
    return regExp.hasMatch(name);
  }

  final validateName =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.length > 0) {
      isName(value)
          ? sink.add(value)
          : sink.addError('Name must be a-z and A-Z');
    }
  });

  final validateFullName =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.length > 0) {
      isFullName(value)
          ? value.length >= 2
              ? sink.add(value)
              : sink.addError('Name should be atleast 2 character')
          : sink.addError('Name must be a-z and A-Z');
    }
  });

  static bool isFullName(String name) {
    String value = r'(^[a-zA-Z ]*$)';
    RegExp regExp = RegExp(value);
    return regExp.hasMatch(name);
  }

  final validateLastName =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.length > 0) {
      isFullName(value)
          ? value.length >= 2
              ? sink.add(value)
              : sink.addError('Name should be atleast 2 character')
          : sink.addError('Name must be a-z and A-Z');
    }
  });

  static bool isLastName(String name) {
    String value = r'(^[a-zA-Z ]*$)';
    RegExp regExp = RegExp(value);
    return regExp.hasMatch(name);
  }

  static bool isEmail(email) {
    String value =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(value);
    return regExp.hasMatch(email);
  }

  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.length != 0) {
      isEmail(value)
          ? sink.add(value)
          : sink.addError("Please enter a valid email address");
    }
  });

  final validateEmailAndPhone =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.length != 0) {
      if (!isEmail(value) && !isPhone(value)) {
        return sink.addError("Please enter a valid email or phone number.");
      } else if (value.length < 10) {
        return sink.addError("Please enter a valid email or phone number.");
      } else {
        return sink.add(value);
      }
    }
  });

  static bool isPhone(String phoneNo) {
    String value = r'(^[0-9]*$)';
    RegExp regExp = RegExp(value);
    return regExp.hasMatch(phoneNo);
  }

  final validatePhoneNo =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.length > 0) {
      isPhone(value)
          ? value.length == 10
              ? sink.add(value)
              : sink.addError('Mobile Number must be 10 digits')
          : sink.addError('Mobile Number must be digits');
    }
  });

  static bool isPassword(String password) {
    String value = r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(value);
    return regExp.hasMatch(password);
  }

  final validatePassword =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.length != 0) {
      isPassword(value)
          ? sink.add(value)
          : sink.addError(
              'Password must be at least 8 characters long, include 1 uppercase letter, include 1 lowercase letter, 1 number and 1 special character.');
    }
  });

  final validateDropDown =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    value.length != 0
        ? sink.add(value)
        : sink.addError("Please select the value.");
  });

  void closeStream() {
    _phoneNumber.close();
    _password.close();
    _forgotPassword.close();
    _confirmPassword.close();
    _cityName.close();
    _fullName.close();
    _email.close();
    _address.close();
    _firmName.close();
    _emailAndPhone.close();
    _oldPassword.close();
    _url.close();
  }
}
