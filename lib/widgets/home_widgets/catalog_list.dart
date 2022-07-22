// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/catelog.dart';
import 'package:flutter_application_2/screen/home_detail_page.dart';
import 'package:flutter_application_2/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'add_to_cart.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20),
            shrinkWrap: true,
            itemCount: CatalogModels.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModels.items[index];
              return InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeDetailPage(catalog: catalog),
                    )),
                child: CatalogItem(catalog: catalog),
              );
            },
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: CatalogModels.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModels.items[index];
              return InkWell(
                onTap: () => context.vxNav.push(
                  Uri(
                      path: MyRoutes.homeDetailsRoute,
                      queryParameters: {"id": catalog.id.toString()}),
                ),
                // onTap: () => Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) =>
                //             HomeDetailPage(catalog: catalog))),
                child: CatalogItem(catalog: catalog),
              );
            },
          );
  }
}

class CatalogItem extends StatelessWidget {
  const CatalogItem({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  final Item catalog;

  @override
  Widget build(BuildContext context) {
    var children2 = [
      Hero(
        tag: Key(catalog.id.toString()),
        child: CatalogImage(
          image: catalog.image,
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.bold.lg.color(context.accentColor).make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                AddToCart(catalog: catalog),
              ],
            ).pOnly(right: 8.0),
          ],
        ).p(context.isMobile ? 0 : 16),
      ),
    ];
    return VxBox(
            child: context.isMobile
                ? Row(
                    children: children2,
                  )
                : Column(
                    children: children2,
                  ))
        .color(context.cardColor)
        .rounded
        .square(150)
        .make()
        .py16();
  }
}
