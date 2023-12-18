import 'dart:math';
import 'package:firebase_task/controller/images_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ViewImgScreen extends StatelessWidget {
   ViewImgScreen({
    super.key,
  });
  final DataTableSource data = Data();
  ImagesController imgController = Get.put(ImagesController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
        child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
             PaginatedDataTable(columns: const [
              DataColumn(label: Text('Id')),
              DataColumn(label: Text('Title')),
              DataColumn(label: Text('Price')),
             ], source: data),
          
              ],
              
            ),
            
          ),
       
        );
     
  }
}

class Data extends DataTableSource{
  final List<Map<String , dynamic>>dataSource = List.generate(100, (index) => {
    "id":index,
    "title":"item $index",
    "price": Random().nextInt(20),
  });
  @override
  DataRow? getRow(int index) {
   return DataRow(cells: [
    DataCell(Text(dataSource[index]["id"].toString())),
    DataCell(Text(dataSource[index]["title"].toString())),
    DataCell(Text(dataSource[index]["price"].toString())),
   ]);
  }

  @override
 
  bool get isRowCountApproximate => false;

  @override
  
  int get rowCount => 31;

  @override

  int get selectedRowCount => 0;

}
