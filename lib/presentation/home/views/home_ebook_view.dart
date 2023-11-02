import 'package:andipublisher/app/data/models/ebook_campaign.dart';
import 'package:andipublisher/app/data/models/ebook_master_model.dart';
import 'package:andipublisher/app/data/models/label_ebook_master_model.dart';
import 'package:andipublisher/app/views/views/card_ebook_view.dart';
import 'package:andipublisher/app/views/views/future_view.dart';
import 'package:andipublisher/app/views/views/image_network_view.dart';
import 'package:andipublisher/gen/assets.gen.dart';
import 'package:andipublisher/presentation/ebook_kategori/ebook_kategori.screen.dart';
import 'package:andipublisher/presentation/ebook_penerbit/ebook_penerbit.screen.dart';
import 'package:andipublisher/presentation/home/controllers/home.controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeEbookView extends GetView {
  HomeEbookView({Key? key}) : super(key: key);

  @override
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _bannerEbook(context),
        SizedBox(
          height: 10,
        ),
        _labelEbookMaster(
          future: controller.ebookNewLabelItemsMaster(),
          data: controller.ebookNewLabelItemsMasterModel,
        ),
        SizedBox(
          height: 10,
        ),
        _labelEbookMaster(
          future: controller.ebookTerlarisLabelItemsMaster(),
          data: controller.ebookLarisLabelItemsMasterModel,
        ),
        SizedBox(
          height: 10,
        ),
        _labelEbookMaster(
          future: controller.sewaSallerLabelItemsMaster(),
          data: controller.sewaSallerLabelItemsMasterModel,
        ),
        SizedBox(
          height: 10,
        ),
        // _campaignList(context),
        // SizedBox(
        //   height: 10,
        // ),
      ],
    );
  }

  Widget _bannerEbook(BuildContext context) {
    return FutureView(
      future: controller.fetchBannerEbook(),
      widgetEmpty: const SizedBox(),
      widgetBuilder: Obx(
        () {
          if (controller.bannerModelebook.isEmpty) {
            // Tampilkan banner default jika tidak ada banner
            return ImageNetworkView(
              url: Assets.images.banerDefault
                  .path, // Ganti dengan URL banner default Anda
            );
          }

          return Column(
            children: [
              Stack(
                children: [
                  CarouselSlider.builder(
                    itemCount: controller.bannerModelebook.length,
                    itemBuilder: (context, index, realIndex) {
                      if (controller.bannerModelebook.isNotEmpty) {
                        return ImageNetworkView(
                          url: controller.bannerModelebook[index].gambarBanner,
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                    options: CarouselOptions(
                      autoPlay: (controller.bannerModelebook.length != 1),
                      aspectRatio: 2 / 1,
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        controller.currentBanner.value = index;
                      },
                    ),
                  ),
                  Visibility(
                    visible: (controller.bannerModelebook.length != 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: controller.bannerModelebook.asMap().entries.map(
                        (entry) {
                          return Container(
                            width: (controller.currentBanner.value == entry.key)
                                ? 14.0
                                : 6.0,
                            height: 6.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black)
                                  .withOpacity(controller.currentBanner.value ==
                                          entry.key
                                      ? 0.9
                                      : 0.4),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => EbookKategoriScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 55, vertical: 16),
                        elevation: 5, // Efek bayangan
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8), // Konfigurasi border-radius
                        ),
                      ),
                      child: Text(
                        'Kategori',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => EbookPenerbitScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 55, vertical: 16),
                        elevation: 5, // Efek bayangan
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8), // Konfigurasi border-radius
                        ),
                      ),
                      child: Text(
                        'Penerbit',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _labelEbookMaster(
      {required Future<Object> future,
      required Rxn<LabelEbookMasterModel> data}) {
    return FutureView(
      future: future,
      widgetEmpty: const SizedBox(),
      widgetBuilder: Obx(
        () => Column(
          children: [
            if (data.value != null)
              Row(
                children: [
                  const SizedBox(width: 10),
                  Text(
                    data.value!.label,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  // const Spacer(),
                  // TextButton(onPressed: () {}, child: const Text('Lainnya')),
                  SizedBox(width: 15),
                ],
              ),
            SizedBox(
              height: 340,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: data.value?.value.length ?? 0,
                itemBuilder: (context, index) {
                  return CardEbookView(data.value!.value[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// Widget _campaignList(BuildContext context){
//   return FutureView(
//     future: controller,)
// }