import 'package:andipublisher/app/data/models/item_master_model.dart';
import 'package:andipublisher/app/views/views/image_network_view.dart';
import 'package:andipublisher/extensions/int_extension.dart';
import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CardItemsView extends GetView {
  final ItemMasterModel data;
  const CardItemsView(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.ITEM_DETAIL, arguments: data.idBarang),
      child: AspectRatio(
        aspectRatio: 2 / 4.4,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              AspectRatio(
                  aspectRatio: 0.66 / 1,
                  child: Stack(
                    children: [
                      ImageNetworkView(
                        url: data.gambar1,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(10))),
                      ),
                      //Diskon
                      Visibility(
                        visible: data.diskon != 0,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 28,
                            width: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                color: colorRad.withOpacity(0.9)),
                            child: Text(
                              '${data.diskon}%',
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),

                      //Stok Habis
                      Visibility(
                        visible: !data.statusStok,
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 100,
                            width: 100,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black.withOpacity(0.8)),
                            child: const Text(
                              'Habis',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.judul,
                      maxLines: 2,
                      style: const TextStyle(fontSize: 13),
                      overflow: TextOverflow.ellipsis,
                    ),
                    (data.diskon != 0)
                        ? Text(
                            data.harga.parceRp(),
                            style: TextStyle(
                              fontSize: 12,
                              color: colorTextGrey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          )
                        : const SizedBox(height: 20),
                    Text(
                      data.harga.parceRp(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
