import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone_bloc/src/utils/constants/constants.dart';

abstract class ShippingFeeCalculator {
  const ShippingFeeCalculator();
  // HINT: Template method
  double calculate(double subTotal) {
    return _calculateShippingInsurance(subTotal) +
        calculateShippingFeeByDistance(subTotal) +
        calculateShippingFeeByWeight(subTotal) +
        calculateShippingFeeByPriority(subTotal);
  }

  // HINT: Private step
  double _calculateShippingInsurance(double subTotal) {
    return sqrt(subTotal);
  }

  // HINT: Hook step
  @protected
  double calculateShippingFeeByWeight(subTotal) {
    return 0;
  }

  @protected
  double calculateShippingFeeByDistance(double subTotal) {
    return 0;
  }

  // HINT: Abstract step. Time sẽ thể hiện độ priority của đơn hàng
  @protected
  double calculateShippingFeeByPriority(double subTotal);
}

class InStorePickupShippingFeeCalculator extends ShippingFeeCalculator {
  const InStorePickupShippingFeeCalculator();

  @override
  double calculateShippingFeeByPriority(double subTotal) {
    // HINT: Sau giờ đóng cửa vẫn cho lấy, nhưng tính thêm phí
    int pickupTime = DateTime.now().hour;
    return pickupTime > 22 || pickupTime < 7
        ? subTotal * pickupTime * Constants.shippingRateByTime
        : 0;
  }
}

class ParcelTerminalShippingFeeCalculator extends ShippingFeeCalculator {
  const ParcelTerminalShippingFeeCalculator();

  @override
  double calculateShippingFeeByDistance(subTotal) {
    double mockShippingDistance = Random().nextDouble() * 100;
    return mockShippingDistance * Constants.shippingRateByDistance;
  }

  @override
  double calculateShippingFeeByWeight(subTotal) {
    double mockOrderWeight = Random().nextDouble() * 5;
    return mockOrderWeight * Constants.shippingRateByDistance;
  }

  @override
  double calculateShippingFeeByPriority(double subTotal) {
    // HINT: Giao vào giờ cao điểm tính thêm phí
    int pickupTime = DateTime.now().hour;
    return pickupTime >= 17 && pickupTime <= 19
        ? subTotal * pickupTime * Constants.shippingRateByTime
        : 0;
  }
}

class PriorityShippingFeeCalculator extends ShippingFeeCalculator {
  const PriorityShippingFeeCalculator();

  @override
  double calculateShippingFeeByPriority(double subTotal) {
    // HINT: Ship hỏa tốc càng sớm càng tốt 50% giá trị đơn hàng
    return subTotal * 0.5;
  }
}
