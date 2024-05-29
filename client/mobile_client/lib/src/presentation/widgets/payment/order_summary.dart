import 'package:flutter/material.dart';
import '../../../logic/shipping_strategy.dart';
import 'order_summary_row.dart';

class OrderSummary extends StatelessWidget {
  final double subTotal;
  final IShippingCostsStrategy shippingCostsStrategy;

  const OrderSummary({
    required this.subTotal,
    required this.shippingCostsStrategy,
  });

  double get shippingPrice => shippingCostsStrategy.calculate(subTotal);
  double get total => subTotal + shippingPrice;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Divider(),
            OrderSummaryRow(
              fontFamily: 'Roboto',
              label: 'Subtotal',
              value: subTotal,
            ),
            const SizedBox(height: 8.0),
            OrderSummaryRow(
              fontFamily: 'Roboto',
              label: 'Shipping',
              value: shippingPrice,
            ),
            const Divider(),
            OrderSummaryRow(
              fontFamily: 'RobotoMedium',
              label: 'Order total',
              value: total,
            ),
          ],
        ),
      ),
    );
  }
}
