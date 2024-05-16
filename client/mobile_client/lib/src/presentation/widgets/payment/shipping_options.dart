import 'package:flutter/material.dart';

import '../../../logic/shipping_strategy.dart';

// HINT: Shipping strategy context
class ShippingOptions extends StatelessWidget {
  final List<IShippingCostsStrategy> shippingOptions;
  final int selectedIndex;
  final ValueChanged<int?> onChanged;

  const ShippingOptions({
    super.key,
    required this.shippingOptions,
    required this.selectedIndex,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            for (final (i, option) in shippingOptions.indexed)
              RadioListTile<int>(
                title: Text(option.label),
                value: i,
                groupValue: selectedIndex,
                // HINT: Đây là chỗ nhận hàm setStrategy
                onChanged: onChanged,
                dense: true,
                activeColor: Colors.black,
              ),
          ],
        ),
      ),
    );
  }
}
