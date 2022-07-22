// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_2/models/catelog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl3.red800.make(),
            AddToCart(catalog: catalog).wh(120, 40),
            // ElevatedButton(
            //   style: ButtonStyle(
            //       backgroundColor:
            //           MaterialStateProperty.all(context.theme.buttonColor),
            //       shape: MaterialStateProperty.all(
            //         const StadiumBorder(),
            //       )),
            //   onPressed: () {},
            //   child: "Add to cart".text.make(),
            // ).wh(120, 40),
          ],
        ).p16(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image).centered(),
            ).h24(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                edge: VxEdge.TOP,
                arcType: VxArcType.CONVEY,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.bold.xl3
                          .color(context.accentColor)
                          .make(),
                      catalog.desc.text
                          .textStyle(context.captionStyle)
                          .xl
                          .make(),
                      10.heightBox,
                      "Elitr duo rebum sadipscing et at dolor ipsum at dolor, sadipscing gubergren ipsum sit et, stet takimata et tempor sit amet et, dolor et lorem dolor stet et diam sed dolor. Diam magna duo consetetur dolores amet diam kasd, magna at sanctus sed sit kasd stet sanctus consetetur ut. Ipsum."
                          .text
                          .justify
                          .textStyle(context.captionStyle)
                          .make()
                          .px16()
                    ],
                  ).py64(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
