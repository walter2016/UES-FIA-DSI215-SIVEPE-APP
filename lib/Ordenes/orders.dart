import 'package:com_app_tienda/Ordenes/order.dart';
import 'package:com_app_tienda/Ordenes/orders_products.dart';
import 'package:com_app_tienda/body/DrawerWidget.dart';
import 'package:flutter/material.dart';

class OrdersWidget extends StatefulWidget {
  int currentTab;
  OrdersWidget({Key key, this.currentTab}) : super(key: key);
  @override
  _OrdersWidgetState createState() => _OrdersWidgetState();
}

class _OrdersWidgetState extends State<OrdersWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final OrderList _orderList = new OrderList();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: widget.currentTab ?? 0,
        length: 4,
        child: Scaffold(
          key: _scaffoldKey,
          drawer: DrawerWidget(),
          appBar: AppBar(
//        leading: new IconButton(
//          icon: new Icon(UiIcons.return_icon, color: Theme.of(context).hintColor),
//          onPressed: () => Navigator.of(context).pop(),
//        ),
            leading: new IconButton(
                icon: new Icon(Icons.keyboard_backspace,
                    color: Color(0xFFFFFFFF)),
                onPressed: () {
                  Navigator.pop(context);
                }),
            backgroundColor: Color(0xFFFF9800),
            elevation: 0,
            title: Text(
              'Mis ordenes',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            actions: <Widget>[],
            bottom: TabBar(
                indicatorPadding: EdgeInsets.all(10),
                labelPadding: EdgeInsets.symmetric(horizontal: 5),
                unselectedLabelColor: Theme.of(context).focusColor,
                isScrollable: true,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFFFF9800)),
                tabs: [
                  Tab(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(color: Color(0xFFFFFFFF), width: 2)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Todas"),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(color: Color(0xFFFFFFFF), width: 2)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Pendientes"),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(color: Color(0xFFFFFFFF), width: 2)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Aprobadas"),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(color: Color(0xFFFFFFFF), width: 2)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Denegadas"),
                      ),
                    ),
                  ),
                ]),
          ),
          body: TabBarView(children: [
            OrdersProductsWidget(ordersList: _orderList.list),
            OrdersProductsWidget(
                ordersList: _orderList.list
                    .where((order) => order.orderState == OrderState.unpaid)
                    .toList()),
            OrdersProductsWidget(
                ordersList: _orderList.list
                    .where((order) => order.orderState == OrderState.shipped)
                    .toList()),
            OrdersProductsWidget(
                ordersList: _orderList.list
                    .where((order) => order.orderState == OrderState.inDispute)
                    .toList()),
          ]),
        ));
  }
}
