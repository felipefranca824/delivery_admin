import 'package:flutter/material.dart';

import '../../../core/ui/widgets/base_header.dart';
import '../../../models/orders/order_status.dart';
import '../order_controller.dart';

class OrderHeader extends StatefulWidget {
  final OrderController controller;
  const OrderHeader({super.key, required this.controller});

  @override
  State<OrderHeader> createState() => _OrderHeaderState();
}

class _OrderHeaderState extends State<OrderHeader> {
  OrderStatus? statusSelected;

  @override
  Widget build(BuildContext context) {
    return BaseHeader(
      title: 'ADMINISTRAR PEDIDIOS',
      addButton: false,
      filterWidget: DropdownButton<OrderStatus>(
        value: statusSelected,
        onChanged: (value) {
          setState(() {
            statusSelected = value;
            widget.controller.changeFilterStatus(value);
          });
        },
        items: [
          const DropdownMenuItem(
            value: null,
            child: Text('Todos'),
          ),
          ...OrderStatus.values
              .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
              .toList(),
        ],
      ),
    );
  }
}
