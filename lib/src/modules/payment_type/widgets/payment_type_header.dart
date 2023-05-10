// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../core/ui/widgets/base_header.dart';
import '../payment_type_store.dart';

class PaymentTypeHeader extends StatefulWidget {
  final PaymentTypeStore controller;
  const PaymentTypeHeader({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<PaymentTypeHeader> createState() => _PaymentTypeHeaderState();
}

class _PaymentTypeHeaderState extends State<PaymentTypeHeader> {
  @override
  Widget build(BuildContext context) {
    bool? enabled;
    return BaseHeader(
      title: 'ADMINISTRAR FORMAS DE PAGAMENTOS',
      buttonLabel: 'ADICIONAR',
      buttonPressed: () {
        widget.controller.addPayment();
      },
      filterWidget: DropdownButton<bool>(
        value: enabled,
        onChanged: (value) {
          setState(() {
            enabled = value;
            widget.controller.changeFilter(value);
          });
        },
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
