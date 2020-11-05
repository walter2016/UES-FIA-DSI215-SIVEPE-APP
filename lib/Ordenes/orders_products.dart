import 'package:com_app_tienda/Ordenes/OrderListItemWidget.dart';
import 'package:com_app_tienda/Ordenes/order.dart';
import 'package:flutter/material.dart';

import 'EmptyOrdersProductsWidget.dart';

class OrdersProductsWidget extends StatefulWidget {
  List<Order> ordersList;

  @override
  _OrdersProductsWidgetState createState() => _OrdersProductsWidgetState();

  OrdersProductsWidget({Key key, this.ordersList}) : super(key: key);
}

class _OrdersProductsWidgetState extends State<OrdersProductsWidget> {
  String layout = 'list';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Offstage(
            offstage: widget.ordersList.isEmpty,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                leading: Icon(
                  Icons.inbox,
                  color: Theme.of(context).hintColor,
                ),
                title: Text(
                  'Lista de Ordenes',
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        setState(() {
                          this.layout = 'list';
                        });
                      },
                      icon: Icon(
                        Icons.format_list_bulleted,
                        color: this.layout == 'list'
                            ? Color(0xFFFF9800)
                            : Theme.of(context).focusColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Offstage(
            offstage: this.layout != 'list' || widget.ordersList.isEmpty,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              primary: false,
              itemCount: widget.ordersList.length,
              separatorBuilder: (context, index) {
                return SizedBox(height: 10);
              },
              itemBuilder: (context, index) {
                return OrderListItemWidget(
                  heroTag: 'orders_list',
                  order: widget.ordersList.elementAt(index),
                  onDismissed: () {
                    setState(() {
                      widget.ordersList.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),
          Offstage(
            offstage: widget.ordersList.isNotEmpty,
            child: EmptyOrdersProductsWidget(),
          )
        ],
      ),
    );
  }
}
