// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../core/extensions/formatter_extensions.dart';
import '../../../core/ui/helpers/size_extensions.dart';
import '../../../core/ui/styles/text_styles.dart';
import '../../../dto/order/order_dto.dart';
import '../order_controller.dart';
import 'widgets/order_bottom_bar.dart';
import 'widgets/order_info_tile.dart';
import 'widgets/order_product_item.dart';

class OrderDetailModal extends StatefulWidget {
  final OrderController controller;
  final OrderDto orderDto;
  const OrderDetailModal({
    Key? key,
    required this.controller,
    required this.orderDto,
  }) : super(key: key);

  @override
  State<OrderDetailModal> createState() => _OrderDetailModalState();
}

class _OrderDetailModalState extends State<OrderDetailModal> {
  void _closeModal() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    return Material(
      color: Colors.black26,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.white,
        elevation: 10,
        child: Container(
          width: screenWidth * (screenWidth > 1200 ? .5 : .7),
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Detalhe do Pedido',
                        style: context.textStyles.textTitle,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () => _closeModal(),
                        icon: const Icon(Icons.close),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Nome do cliente: ',
                      style: context.textStyles.textBold,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      widget.orderDto.user.name,
                      style: context.textStyles.textRegular,
                    ),
                  ],
                ),
                const Divider(),
                ...widget.orderDto.orderProducts
                    .map((e) => OrderProductItem(orderProduct: e))
                    .toList(),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total do Pedido',
                        style: context.textStyles.textExtraBold
                            .copyWith(fontSize: 18),
                      ),
                      Text(
                        widget.orderDto.orderProducts
                            .fold<double>(
                              0.0,
                              (previousValue, p) =>
                                  previousValue + p.totalPrice,
                            )
                            .currentPTBR,
                        style: context.textStyles.textExtraBold
                            .copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                OrderInfoTile(
                  label: 'Endereço de entrega:',
                  info: widget.orderDto.address,
                ),
                OrderInfoTile(
                  label: 'Forma de Pagamento:',
                  info: widget.orderDto.paymentTypeModel.name,
                ),
                const SizedBox(
                  height: 10,
                ),
                const OrderBottomBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
