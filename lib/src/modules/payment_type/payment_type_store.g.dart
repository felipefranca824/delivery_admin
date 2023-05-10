// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_type_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaymentTypeStore on PaymentTypeStoreBase, Store {
  late final _$_statusAtom =
      Atom(name: 'PaymentTypeStoreBase._status', context: context);

  PaymentTypeStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  PaymentTypeStatus get _status => status;

  @override
  set _status(PaymentTypeStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_paymentTypesAtom =
      Atom(name: 'PaymentTypeStoreBase._paymentTypes', context: context);

  List<PaymentTypeModel> get paymentTypes {
    _$_paymentTypesAtom.reportRead();
    return super._paymentTypes;
  }

  @override
  List<PaymentTypeModel> get _paymentTypes => paymentTypes;

  @override
  set _paymentTypes(List<PaymentTypeModel> value) {
    _$_paymentTypesAtom.reportWrite(value, super._paymentTypes, () {
      super._paymentTypes = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'PaymentTypeStoreBase._errorMessage', context: context);

  String? get errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  String? get _errorMessage => errorMessage;

  @override
  set _errorMessage(String? value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  late final _$loadPaymentsAsyncAction =
      AsyncAction('PaymentTypeStoreBase.loadPayments', context: context);

  @override
  Future<void> loadPayments() {
    return _$loadPaymentsAsyncAction.run(() => super.loadPayments());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}