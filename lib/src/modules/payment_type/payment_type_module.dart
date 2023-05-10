import 'package:flutter_modular/flutter_modular.dart';

import 'payment_type_page.dart';
import 'payment_type_store.dart';

class PaymentTypeModule extends Module {
  @override
  List<Bind> get binds => [Bind.lazySingleton((i) => PaymentTypeStore(i()))];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (context, args) => const PaymentTypePage())];
}
