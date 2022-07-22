// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/core/store.dart';
import 'package:flutter_application_2/models/cart.dart';
import 'package:flutter_application_2/utils/routes.dart';
import 'package:flutter_application_2/widgets/drawer.dart';
import 'package:flutter_application_2/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_application_2/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_2/models/catelog.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://mocki.io/v1/a74ef846-a039-4e14-ae7b-738831e4ab89";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 1));
    // final catalogJson =
    //     await rootBundle.loadString("assets/files/catalog.json");
    // //print(catalogJson);
    // final decodedData = jsonDecode(catalogJson);
    // //print(decodedData);
    // var productData = decodedData["products"];
    // //print(productData);
    // CatalogModels.items =
    //     List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    // setState(() {});

    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;

    //print(catalogJson);
    final decodedData = jsonDecode(catalogJson);
    //print(decodedData);
    var productData = decodedData["products"];
    //print(productData);
    CatalogModels.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    //final dummyList = List.generate(50, (index) => CatalogModels.items[0]);
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
          mutations: const {RemoveMutation, AddMutation},
          builder: (context, store, status) => FloatingActionButton(
                backgroundColor: context.theme.buttonColor,
                onPressed: () =>
                    Navigator.pushNamed(context, MyRoutes.cartRoute),
                child: const Icon(
                  CupertinoIcons.cart,
                  color: Colors.white,
                ),
              ).badge(
                  color: Vx.red500,
                  size: 22,
                  count: _cart.items.length,
                  textStyle: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold))),
      body: SafeArea(
        child: Container(
          padding: Vx.m20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if (CatalogModels.items != null && CatalogModels.items.isNotEmpty)
                const CatalogList().py16().expand()
              else
                const CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
