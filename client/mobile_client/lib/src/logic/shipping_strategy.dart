// HINT: Implementation of shipping using strategy pattern
import 'package:flutter_amazon_clone_bloc/src/logic/shipping_template_method.dart';

abstract interface class IShippingCostsStrategy {
  late String label;
  double calculate(double subTotal);
}

/// TODO: Thay thuật toán phức tạp hơn vào
class InStorePickupStrategy implements IShippingCostsStrategy {
  @override
  String label = 'In-store pickup';

  @override
  double calculate(double subTotal) =>
      const InStorePickupShippingFeeCalculator().calculate(subTotal);
}

class ParcelTerminalShippingStrategy implements IShippingCostsStrategy {
  @override
  String label = 'Parcel terminal shipping';

  @override
  double calculate(double subTotal) =>
      const ParcelTerminalShippingFeeCalculator().calculate(subTotal);
}

class PriorityShippingStrategy implements IShippingCostsStrategy {
  @override
  String label = 'Priority shipping';

  @override
  double calculate(double subTotal) =>
      const PriorityShippingFeeCalculator().calculate(subTotal);
}
