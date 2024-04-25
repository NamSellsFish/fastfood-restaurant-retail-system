import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/injection_container.dart';
import '../bloc/line_items/line_item_entity_bloc.dart';
import '../bloc/line_items/line_item_entity_event.dart';

// HINT: A table of line items and a total price
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [], child: Container());
  }
}
