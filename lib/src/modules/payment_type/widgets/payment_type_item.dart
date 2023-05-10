// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../core/ui/styles/text_styles.dart';
import '../../../models/payment_type_model.dart';

class PaymentTypeItem extends StatelessWidget {
  final PaymentTypeModel paymentTypeModel;
  const PaymentTypeItem({
    super.key,
    required this.paymentTypeModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Image.asset(
              'assets/images/icons/payment_${paymentTypeModel.acronym}_icon.png',
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/icons/payment_notfound_icon.png',
                );
              },
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Forma de Pagamento',
                  style: context.textStyles.textRegular,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  paymentTypeModel.name,
                  style: context.textStyles.textTitle,
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Editar'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
