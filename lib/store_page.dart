// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'main.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        // ignore: prefer_const_literals_to_create_immutables
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            children: [
              const Text(
                " Store",
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                  //padding: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 180,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: const DecorationImage(
                                image: NetworkImage(
                                    "https://images.unsplash.com/photo-1534438327276-14e5300c3a48?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Z3ltfGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
                                fit: BoxFit.cover,
                              )),
                        ),
                        Container()
                      ]))
            ]));
  }
}
