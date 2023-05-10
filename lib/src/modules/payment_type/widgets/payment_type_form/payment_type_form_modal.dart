// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../core/ui/helpers/size_extensions.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../../../../models/payment_type_model.dart';
import '../../payment_type_store.dart';

class PaymentTypeFormModal extends StatefulWidget {
  final PaymentTypeStore controller;
  final PaymentTypeModel? model;
  const PaymentTypeFormModal({
    Key? key,
    required this.controller,
    required this.model,
  }) : super(key: key);

  @override
  State<PaymentTypeFormModal> createState() => _PaymentTypeFormModalState();
}

class _PaymentTypeFormModalState extends State<PaymentTypeFormModal> {
  final nameEC = TextEditingController();
  final acronymEC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var enabled = false;

  void _closeModal() => Navigator.of(context).pop();

  @override
  void initState() {
    final paymentModel = widget.model;
    if (paymentModel != null) {
      nameEC.text = paymentModel.name;
      acronymEC.text = paymentModel.acronym;
      enabled = paymentModel.enabled;
    }
    super.initState();
  }

  @override
  void dispose() {
    nameEC.dispose();
    acronymEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(30),
        width: screenWidth * (screenWidth > 1200 ? .5 : .7),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${widget.model == null ? 'Adicionar' : 'Editar'} forma de pagamento',
                      textAlign: TextAlign.center,
                      style: context.textStyles.textTitle,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () => _closeModal(),
                      child: const Icon(Icons.close),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: nameEC,
                decoration: const InputDecoration(
                  label: Text('Nome'),
                ),
                validator: Validatorless.required('Nome obrigatório'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: acronymEC,
                decoration: const InputDecoration(
                  label: Text('Sigla'),
                ),
                validator: Validatorless.required('Sigla obrigatória'),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Ativo:',
                    style: context.textStyles.textRegular,
                  ),
                  Switch(
                    value: enabled,
                    onChanged: (value) {
                      setState(() {
                        enabled = value;
                      });
                    },
                  )
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 60,
                    child: OutlinedButton(
                      onPressed: _closeModal,
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      child: Text(
                        'Cancelar',
                        style: context.textStyles.textExtraBold
                            .copyWith(color: Colors.red),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 60,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        final valid = formKey.currentState?.validate() ?? false;

                        if (valid) {
                          final name = nameEC.text;
                          final acronym = acronymEC.text;

                          widget.controller.savePayment(
                            id: widget.model?.id,
                            name: name,
                            acronym: acronym,
                            enabled: enabled,
                          );
                        }
                      },
                      icon: const Icon(Icons.save),
                      label: const Text('Salvar'),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
