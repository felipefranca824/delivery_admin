import 'package:flutter/material.dart';

import '../../../core/ui/widgets/base_header.dart';
import '../payment_type_store.dart';

class PaymentTypeHeader extends StatelessWidget {
  final PaymentTypeStore controller;
  const PaymentTypeHeader({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BaseHeader(
      title: 'ADMINISTRAR FORMAS DE PAGAMENTOS',
      buttonLabel: 'ADICIONAR',
      buttonPressed: () {
        controller.addPayment();
      },
      filterWidget: DropdownButton<bool>(
        value: true,
        onChanged: (value) {},
        items: const [
          DropdownMenuItem(
            value: null,
            child: Text('Todos'),
          ),
          DropdownMenuItem(
            value: true,
            child: Text('Ativos'),
          ),
          DropdownMenuItem(
            value: false,
            child: Text('Inativos'),
          )
        ],
      ),
    );
  }
}
