part of 'orders_local_data_source.dart';

class OrdersLocalDataSourceImpl implements OrdersLocalDataSource {
  OrdersLocalDataSourceImpl(this.box);

  final Box<dynamic> box;
}
