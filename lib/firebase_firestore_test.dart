// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

const String KEY_RECEIPTS_COLLECTION = 'receipts';

class Receipt {
  Receipt({
    required this.address,
    required this.tel,
    required this.date,
    required this.time,
    required this.items,
    required this.subTotal,
    required this.salesTax,
    required this.balance,
  });

  final String address;
  final String tel;
  final String date;
  final String time;
  final List<Item> items;
  final double subTotal;
  final double salesTax;
  final double balance;

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'tel': tel,
      'date': date,
      'time': time,
      'items': items.map((item) => item.toMap()).toList(),
      'subTotal': subTotal,
      'salesTax': salesTax,
      'balance': balance,
    };
  }

  factory Receipt.fromMap(Map<String, dynamic> map) {
    return Receipt(
      address: map['address'],
      tel: map['tel'],
      date: map['date'],
      time: map['time'],
      items: List<Item>.from(map['items'].map((item) => Item.fromMap(item))),
      subTotal: map['subTotal'],
      salesTax: map['salesTax'],
      balance: map['balance'],
    );
  }
}

class Item {
  Item({
    required this.name,
    required this.price,
  });

  final String name;
  final double price;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      name: map['name'],
      price: map['price'],
    );
  }
}

/// Create
Future<void> createReceipt(Receipt receipt) async {
  final CollectionReference receipts =
      FirebaseFirestore.instance.collection(KEY_RECEIPTS_COLLECTION);
  try {
    await receipts.add(receipt.toMap());
  } catch (e) {
    rethrow;
  }
}

/// Update
Future<void> updateReceipt(String receiptId, Receipt updatedReceipt) async {
  final CollectionReference receipts =
      FirebaseFirestore.instance.collection(KEY_RECEIPTS_COLLECTION);
  try {
    await receipts.doc(receiptId).update(updatedReceipt.toMap());
  } catch (e) {
    rethrow;
  }
}

/// Delete
Future<void> deleteReceipt(String receiptId) async {
  final CollectionReference receipts =
      FirebaseFirestore.instance.collection(KEY_RECEIPTS_COLLECTION);
  try {
    await receipts.doc(receiptId).delete();
  } catch (e) {
    rethrow;
  }
}
