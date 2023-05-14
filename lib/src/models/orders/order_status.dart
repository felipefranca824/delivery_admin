import 'package:flutter/material.dart';

enum OrderStatus {
  pending('Pendente', 'P', Colors.blue),
  confirmed('Confirmado', 'C', Colors.green),
  cancel('Cancelado', 'R', Colors.red),
  finalized('Finalizado', 'D', Colors.black);

  final String name;
  final String acronym;
  final Color color;

  const OrderStatus(this.name, this.acronym, this.color);

  static OrderStatus parse(String acronym) {
    return values.firstWhere((element) => element.acronym == acronym);
  }
}
