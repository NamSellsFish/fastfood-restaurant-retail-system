import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_client/src/presentation/bloc/line_items/line_items_bloc.dart';
import 'package:mobile_client/src/presentation/bloc/line_items/line_items_event.dart';

import '../../domain/entities/line_item.dart';
import '../bloc/line_items/line_items_state.dart';

class LineItemTable extends StatelessWidget {
  const LineItemTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LineItemsBloc, LineItemsState>(
      builder: (_, state) {
        if (state is LineItemsDone) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: DataTable(
              columnSpacing: 20.0,
              showCheckboxColumn: true,
              columns: const <DataColumn>[
                DataColumn(label: Text('Product')),
                DataColumn(label: Text('Quantity')),
                DataColumn(label: Text('Size')),
                DataColumn(label: Text('Price')),
                DataColumn(label: Text('Total')),
              ],
              rows: state.lineItems!
                  .map((lineItem) => DataRow(
                          selected: lineItem.status!,
                          onSelectChanged: (_) => {},
                          cells: [
                            DataCell(Text(lineItem.product!.name!)),
                            DataCell(Text(lineItem.quantity.toString())),
                            DataCell(Text(lineItem.size!)),
                            DataCell(Text(lineItem.product!.price.toString())),
                            DataCell(Text(
                                (lineItem.quantity! * lineItem.product!.price!)
                                    .toStringAsFixed(2))),
                          ]))
                  .toList(),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  // void Function(bool?) _onUpdateLineItemStatus(
  //     BuildContext context, LineItemEntity lineItem) {
  //   return (bool? selected) {
  //       context.read<LineItemsBloc>().add(UpdateLineItemStatus(lineItem, selected));
  //   };
  // }
}
