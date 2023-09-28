import 'package:andipublisher/app/views/views/future_view.dart';
import 'package:andipublisher/app/views/views/image_network_view.dart';
import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:andipublisher/extensions/int_extension.dart';
import 'package:andipublisher/presentation/ebook_detail/controllers/ebook_detail.controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class EbookContentView extends GetView {
  EbookContentView({Key? key}) : super(key: key);

  @override
  final EbookDetailController controller = Get.put(EbookDetailController());

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //   future: controller.fetchDetailItem(),
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       var data = snapshot.data;

    //       print("DATA_SUCCESS: $data");

    //       return Obx(() => Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               _imagesItem(),
    //               Padding(
    //                 padding: EdgeInsets.symmetric(horizontal: marginHorizontal),
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     // _priceAndPromo(),
    //                     _infoItem(),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ));
    //     } else {
    //       // print("data: ${snapshot.data!.judul}");
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //     ;
    //   },
    // );
    return FutureView(
      future: controller.fetchDetailItem(),
      widgetBuilder: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _imagesItem(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: marginHorizontal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _priceAndPromo(),
                  _infoItem(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _infoItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(
          controller.ebookMasterDetailModel.value!.judul,
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          controller.ebookMasterDetailModel.value!.kategori.label,
          style: TextStyle(color: colorTextGrey),
        ),
        const SizedBox(height: 30),
        const Text(
          'Spesifikasi',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.ebookMasterDetailModel.value!.info.length + 1,
          itemBuilder: (context, index) {
            if (index < controller.ebookMasterDetailModel.value!.info.length) {
              return Table(
                children: [
                  TableRow(
                    children: [
                      TableCell(
                          child: Text(controller.ebookMasterDetailModel.value!
                              .info[index].label)),
                      TableCell(
                          child: Text(controller.ebookMasterDetailModel.value!
                              .info[index].value)),
                    ],
                  ),
                ],
              );
            } else {
              // return Table(
              //   children: [
              //     TableRow(
              //       children: [
              //         const TableCell(child: Text('Berat')),
              //         TableCell(
              //             child: Text(
              //                 controller.ebookMasterDetailModel.value!.berat)),
              //       ],
              //     ),
              //   ],
              // );
            }
          },
        ),
        const SizedBox(height: 20),
        const Text(
          'Deskripsi',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ReadMoreText(
          controller.ebookMasterDetailModel.value!.deskripsi,
          trimMode: TrimMode.Length,
          moreStyle: TextStyle(color: colorTextPrimary),
          lessStyle: TextStyle(color: colorTextPrimary),
          trimCollapsedText: 'Baca Selengkapnya',
          trimExpandedText: ' Sembunyikan',
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  CarouselSlider _imagesItem() {
    return CarouselSlider.builder(
      itemCount: controller.ebookMasterDetailModel.value?.images.length,
      itemBuilder: (context, index, realIndex) {
        return Container(
          height: Get.width - 100,
          width: Get.width - 100,
          margin: const EdgeInsets.only(bottom: 28, top: 10),
          padding: const EdgeInsets.symmetric(vertical: 28),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: borderRadius,
            boxShadow: [boxShadow],
          ),
          child: Stack(
            children: [
              Center(
                child: AspectRatio(
                  aspectRatio: 2 / 3,
                  child: ImageNetworkView(
                    url: controller.ebookMasterDetailModel.value!.images[index],
                    decoration: BoxDecoration(borderRadius: borderRadius),
                  ),
                ),
              ),
              Visibility(
                visible: (!controller.ebookMasterDetailModel.value!.isReady),
                child: Center(
                  child: Container(
                    height: 140,
                    width: 140,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: colorBlack.withOpacity(0.8),
                        shape: BoxShape.circle),
                    child: Text(
                      'Habis',
                      style: TextStyle(fontSize: 16, color: colorTextWhite),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
      options: CarouselOptions(
        autoPlay: (controller.ebookMasterDetailModel.value?.images.length != 1),
        aspectRatio: 1 / 1,
        viewportFraction: 1,
        enlargeCenterPage: true,
        autoPlayInterval: const Duration(seconds: 10),
      ),
    );
  }

  Row _priceAndPromo() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  controller.ebookMasterDetailModel.value!.harga.total
                      .parceRp(),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Visibility(
                  visible:
                      (controller.ebookMasterDetailModel.value!.diskon.persen !=
                          0),
                  child: Text(
                    ' ${controller.ebookMasterDetailModel.value!.diskon.persen}% OFF ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: colorTextAlert),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: (controller.ebookMasterDetailModel.value!.diskon != 0),
              child: Text(
                controller.ebookMasterDetailModel.value!.harga.original
                    .parceRp(),
                style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: colorTextGrey),
              ),
            ),
          ],
        ),
        const Spacer(),
        Visibility(
          visible: (controller.ebookMasterDetailModel.value!.flashsale.status !=
                  null &&
              controller.ebookMasterDetailModel.value!.flashsale.status),
          child: Column(
            children: [
              const Text('Berkhir Dalam'),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: colorRad,
                  borderRadius: borderRadius,
                ),
                child: const Text(
                  'Jam 100 : 44 : 20',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}