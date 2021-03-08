import 'package:cached_network_image/cached_network_image.dart';
import 'package:either_option/either_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/ApiUrl.dart';
import 'package:flutter_clean_architecture/screens/FlowerWidget.dart';
import 'package:flutter_clean_architecture/model/Flower.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ApiServices.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flowers"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Consumer(builder: (context, watch, _) {
        var a = watch(flowerProvider);
        return a.when(
            data: (d) => buildListViews(d),
            loading: () => Center(
                  child: CircularProgressIndicator(),
                ),
            error: (e, st) => Text("error ${e}"));
      }),
    );
  }

  ListView buildListViews(List<Flower> flowerlist) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: flowerlist.length,
        itemBuilder: (BuildContext context, int index) {
          return FlowerWidget(flowerlist[index]);
        });
  }

}


final flowerProvider = FutureProvider.autoDispose<List<Flower>>((ref) {
  return ApiServices().getFlowers();
});
