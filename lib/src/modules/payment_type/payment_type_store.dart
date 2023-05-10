import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../models/payment_type_model.dart';
import '../../repositories/payment_type/payment_type_repository.dart';
part 'payment_type_store.g.dart';

enum PaymentTypeStatus {
  initial,
  loading,
  loaded,
  error,
}

class PaymentTypeStore = PaymentTypeStoreBase with _$PaymentTypeStore;

abstract class PaymentTypeStoreBase with Store {
  final PaymentTypeRepository _paymentTypeRepository;

  @readonly
  var _status = PaymentTypeStatus.initial;

  @readonly
  var _paymentTypes = <PaymentTypeModel>[];

  @readonly
  String? _errorMessage;

  PaymentTypeStoreBase(this._paymentTypeRepository);

  @action
  Future<void> loadPayments() async {
    try {
      _status = PaymentTypeStatus.loading;

      _paymentTypes = await _paymentTypeRepository.findAll(null);

      _status = PaymentTypeStatus.loaded;
    } catch (e, s) {
      _status = PaymentTypeStatus.error;
      log('Erro ao carregar formas de pagamento', error: e, stackTrace: s);

      _errorMessage = 'Erro ao carregar formas de pagamento';
    }
  }
}
