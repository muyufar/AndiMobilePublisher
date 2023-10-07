import 'package:andipublisher/app/data/models/label_items_master_model.dart';
import 'package:andipublisher/app/views/views/card_items_view.dart';
import 'package:andipublisher/app/views/views/future_view.dart';
import 'package:andipublisher/app/views/views/image_network_view.dart';
import 'package:andipublisher/presentation/home/controllers/home.controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeMenuView extends GetView {
  HomeMenuView({Key? key}) : super(key: key);

  @override
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _banner(context),
        _labelItemsMaster(
            future: controller.newLabelItemsMaster(),
            data: controller.newLabelItemsMasterModel),
        _labelItemsMaster(
            future: controller.bestSallerLabelItemsMaster(),
            data: controller.bestSallerLabelItemsMasterModel),
      ],
    );
  }

  FutureView _labelItemsMaster(
      {required Future<Object> future,
      required Rxn<LabelItemsMasterModel> data}) {
    return FutureView(
      future: future,
      widgetEmpty: const SizedBox(),
      widgetBuilder: Obx(
        () => Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 10),
                Text(
                  data.value!.label,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                TextButton(onPressed: () {}, child: const Text('')),
                const SizedBox(width: 10),
              ],
            ),
            SizedBox(
              height: 340,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: data.value!.value.length,
                itemBuilder: (context, index) {
                  return CardItemsView(data.value!.value[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  FutureView _banner(BuildContext context) {
    return FutureView(
      future: controller.fetchBanner(),
      widgetEmpty: const SizedBox(),
      widgetBuilder: Obx(
        () => Stack(
          children: [
            CarouselSlider.builder(
              itemCount: controller.bannerModel.length,
              itemBuilder: (context, index, realIndex) {
                if (controller.bannerModel.isNotEmpty) {
                  return ImageNetworkView(
                      url: controller.bannerModel[index].gambarBanner);
                } else {
                  return const SizedBox();
                }
              },
              options: CarouselOptions(
                  autoPlay: (controller.bannerModel.length != 1),
                  aspectRatio: 2 / 1,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    controller.currentBanner.value = index;
                  }),
            ),
            Visibility(
              visible: (controller.bannerModel.length != 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: controller.bannerModel.asMap().entries.map(
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
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(
                                controller.currentBanner.value == entry.key
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
      ),
    );
  }
}
