import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/line_items/line_items_bloc.dart';
import '../bloc/line_items/line_items_event.dart';
import '../widgets/line_item_table.dart';

// HINT: A table of line items and a total price
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LineItemsBloc>(
          create: (context) => LineItemsBloc(),
        ),
      ],
      child: const Scaffold(
        body: Row(
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: LineItemTable(),
            ),
          ],
        ),
      ),
    );
  }
}
