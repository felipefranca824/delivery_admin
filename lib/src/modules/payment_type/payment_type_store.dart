import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../models/payment_type_model.dart';
import '../../repositories/payment_type/payment_type_repository.dart';
part 'payment_type_store.g.dart';

enum PaymentTypeStatus { initial, loading, loaded, error, addOrUpdatePayment }

class PaymentTypeStore = PaymentTypeStoreBase with _$PaymentTypeStore;

abstract class PaymentTypeStoreBase with Store {
  final PaymentTypeRepository _paymentTypeRepository;

  @readonly
  var _status = PaymentTypeStatus.initial;

  @readonly
  var _paymentTypes = <PaymentTypeModel>[];

  @readonly
  String? _errorMessage;

  @readonly
  PaymentTypeModel? _paymentTypeSelected;

  @readonly
  bool? _filterEnabled;

  PaymentTypeStoreBase(this._paymentTypeRepository);

  @action
  void changeFilter(bool? enabled) => _filterEnabled = enabled;

  @action
  Future<void> loadPayments() async {
    try {
      _status = PaymentTypeStatus.loading;

      _paymentTypes = await _paymentTypeRepository.findAll(_filterEnabled);

      _status = PaymentTypeStatus.loaded;
    } catch (e, s) {
      _status = PaymentTypeStatus.error;
      log('Erro ao carregar formas de pagamento', error: e, stackTrace: s);

      _errorMessage = 'Erro ao carregar formas de pagamento';
    }
  }

  Future<void> addPayment() async {
    _status = PaymentTypeStatus.loading;

    await Future.delayed(Duration.zero);

    _paymentTypeSelected = null;

    _status = PaymentTypeStatus.addOrUpdatePayment;
  }

  Future<void> editPayment(PaymentTypeModel? paymentType) async {
    _status = PaymentTypeStatus.loading;

    await Future.delayed(Duration.zero);

    _paymentTypeSelected = paymentType;

    _status = PaymentTypeStatus.addOrUpdatePayment;
  }
}
