import 'dart:ffi';
import 'package:andipublisher/app/data/models/ebook_campaign.dart';
import 'package:andipublisher/app/data/models/ebook_master_model.dart';
import 'package:andipublisher/app/data/models/label_ebook_master_model.dart';
import 'package:andipublisher/app/views/views/card_ebook_view.dart';
import 'package:andipublisher/app/views/views/future_view.dart';
import 'package:andipublisher/app/views/views/image_network_view.dart';
import 'package:andipublisher/gen/assets.gen.dart';
import 'package:andipublisher/presentation/ebook_kategori/ebook_kategori.screen.dart';
import 'package:andipublisher/presentation/ebook_penerbit/ebook_penerbit.screen.dart';
import 'package:andipublisher/presentation/ebook_viewall/ebook_viewall.screen.dart';
import 'package:andipublisher/presentation/home/controllers/home.controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';

class HomeEbookView extends GetView {
  HomeEbookView({Key? key}) : super(key: key);
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _bannerEbook(context),
        SizedBox(
          height: 10,
        ),
        // _campaignList(controller.campaigns),
        // SizedBox(height: 10),

        // SizedBox(
        //   height: 10,
        // ),
        // _labelEbookCampaign(
        //   future: controller.loadCampaigns(),
        //   data: controller.campaigns,
        // ),
        // SizedBox(
        //   height: 10,
        // ),
        // _labelEbookCampaign1(
        //   future: controller.loadCampaigns(),
        //   data: controller.campaigns,
        // ),
        // SizedBox(
        //   height: 10,
        // ),
        // _labelEbookCampaign2(
        //   future: controller.loadCampaigns(),
        //   data: controller.campaigns,
        // ),
        // SizedBox(
        //   height: 10,
        // ),
        // _labelEbookCampaign3(
        //   future: controller.loadCampaigns(),
        //   data: controller.campaigns,
        // ),
        // SizedBox(
        //   height: 10,
        // ),
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
        // _labelEbookMaster(
        //   future: controller.sewaSallerLabelItemsMaster(),
        //   data: controller.sewaSallerLabelItemsMasterModel,
        // ),
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
                              vertical: 8.0,
                              horizontal: 4.0,
                            ),
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
                height: 10,
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
                            EdgeInsets.symmetric(horizontal: 55, vertical: 13),
                        elevation: 2, // Efek bayangan
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
                            EdgeInsets.symmetric(horizontal: 55, vertical: 13),
                        elevation: 2, // Efek bayangan
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
              // SizedBox(
              //   height: ,
              // ),
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
                  const Spacer(),
                  TextButton(
                    onPressed: () => Get.to(EbookViewallScreen()),
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 12),
                    ),
                    child: Row(
                      children: const [
                        Text('Lihat Semua'),
                        Icon(Ionicons.chevron_forward_outline, size: 16)
                      ],
                    ),
                  ),
                  SizedBox(width: 15),
                ],
              ),
            SizedBox(
              height: 290,
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

//  Widget _campaignList(List<EbookCampaign> campaigns) {
//   return Column(
//     children: [
//       Row(
//         children: [
//           const SizedBox(width: 10),
//           Text(
//             "Campaigns", // Label untuk bagian Campaigns Anda
//             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const Spacer(),
//           TextButton(
//             onPressed: () {
//               // Handle tombol "Lihat Semua"
//             },
//             style: TextButton.styleFrom(
//               textStyle: const TextStyle(fontSize: 12),
//             ),
//             child: Row(
//               children: const [
//                 Text('Lihat Semua'),
//                 Icon(Ionicons.chevron_forward_outline, size: 16)
//               ],
//             ),
//           ),
//           SizedBox(width: 15),
//         ],
//       ),
//       SizedBox(
//         height: 340,
//         child: ListView.builder(
//           shrinkWrap: true,
//           physics: const BouncingScrollPhysics(),
//           scrollDirection: Axis.horizontal,
//           itemCount: controller.campaigns.length,
//           itemBuilder: (context, index) {
//             final campaign = controller.campaigns.[index];
//             return CampaignCard(campaign: campaign);
//           },
//         ),
//       ),
//     ],
//   );
// }

// class CampaignCard extends StatelessWidget {
//   final Campaign campaign;

//   CampaignCard({required this.campaign});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Column(
//         children: [
//           ListTile(
//             title: Text(controller.campaigns),
//             subtitle: Text(campaign.description),
//           ),
//           ListView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: campaign.eBooks.length,
//             itemBuilder: (context, index) {
//               final eBook = campaign.eBooks[index];
//               return CardEbookView(eBook: eBook);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

  Widget _labelEbookCampaign({
    required Future<Object> future,
    required RxList<EbookCampaign> data,
  }) {
    if (data.isEmpty) {
      return SizedBox();
    }

    DateTime endDate = data[0].endDate;

    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 10),
            Text(
              data[0].label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            TextButton(
                onPressed: () => Get,
                style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 12)),
                child: Row(
                  children: const [
                    Text('Lihat Semua'),
                    Icon(Ionicons.chevron_forward_outline, size: 16)
                  ],
                )),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Text(
              'Berakhir dalam ',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            CountdownTimer(
              endTime: endDate.millisecondsSinceEpoch,
              widgetBuilder: (context, time) {
                return Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 5),
                    Visibility(
                      visible: time?.days != null,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0473BD),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          ((time?.days ?? 0) < 10)
                              ? '0${time?.days ?? 00}'
                              : '${time?.days ?? 00}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: time?.days != null,
                      child: const Text(
                        ' : ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0473BD),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        ((time?.hours ?? 0) < 10)
                            ? '0${time?.hours ?? 00}'
                            : '${time?.hours ?? 00}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Text(
                      ' : ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0473BD),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        ((time?.min ?? 0) < 10)
                            ? '0${time?.min ?? 00}'
                            : '${time?.min ?? 00}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Text(
                      ' : ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0473BD),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        ((time?.sec ?? 0) < 10)
                            ? '0${time?.sec ?? 00}'
                            : '${time?.sec ?? 00}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
        SizedBox(
          height: 340,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: data[0].value.length ?? 0,
            itemBuilder: (context, index) {
              return CardEbookView(data[0].value[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _labelEbookCampaign1({
    required Future<Object> future,
    required RxList<EbookCampaign> data,
  }) {
    if (data.isEmpty) {
      return SizedBox();
    }

    DateTime endDate = data[1].endDate;

    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 10),
            Text(
              data[1].label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            TextButton(
                onPressed: () => Get,
                style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 12)),
                child: Row(
                  children: const [
                    Text('Lihat Semua'),
                    Icon(Ionicons.chevron_forward_outline, size: 16)
                  ],
                )),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Text(
              'Berakhir dalam ',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            CountdownTimer(
              endTime: endDate.millisecondsSinceEpoch,
              widgetBuilder: (context, time) {
                return Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 5),
                    Visibility(
                      visible: time?.days != null,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0473BD),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          ((time?.days ?? 0) < 10)
                              ? '0${time?.days ?? 00}'
                              : '${time?.days ?? 00}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: time?.days != null,
                      child: const Text(
                        ' : ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0473BD),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        ((time?.hours ?? 0) < 10)
                            ? '0${time?.hours ?? 00}'
                            : '${time?.hours ?? 00}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Text(
                      ' : ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0473BD),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        ((time?.min ?? 0) < 10)
                            ? '0${time?.min ?? 00}'
                            : '${time?.min ?? 00}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Text(
                      ' : ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0473BD),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        ((time?.sec ?? 0) < 10)
                            ? '0${time?.sec ?? 00}'
                            : '${time?.sec ?? 00}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
        SizedBox(
          height: 340,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: data[1].value.length ?? 0,
            itemBuilder: (context, index) {
              return CardEbookView(data[1].value[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _labelEbookCampaign2({
    required Future<Object> future,
    required RxList<EbookCampaign> data,
  }) {
    if (data.isEmpty) {
      return SizedBox();
    }

    DateTime endDate = data[2].endDate;

    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 10),
            Text(
              data[2].label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            TextButton(
                onPressed: () => Get,
                style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 12)),
                child: Row(
                  children: const [
                    Text('Lihat Semua'),
                    Icon(Ionicons.chevron_forward_outline, size: 16)
                  ],
                )),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Text(
              'Berakhir dalam ',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            CountdownTimer(
              endTime: endDate.millisecondsSinceEpoch,
              widgetBuilder: (context, time) {
                return Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 5),
                    Visibility(
                      visible: time?.days != null,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0473BD),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          ((time?.days ?? 0) < 10)
                              ? '0${time?.days ?? 00}'
                              : '${time?.days ?? 00}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: time?.days != null,
                      child: const Text(
                        ' : ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0473BD),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        ((time?.hours ?? 0) < 10)
                            ? '0${time?.hours ?? 00}'
                            : '${time?.hours ?? 00}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Text(
                      ' : ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0473BD),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        ((time?.min ?? 0) < 10)
                            ? '0${time?.min ?? 00}'
                            : '${time?.min ?? 00}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Text(
                      ' : ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0473BD),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        ((time?.sec ?? 0) < 10)
                            ? '0${time?.sec ?? 00}'
                            : '${time?.sec ?? 00}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
        SizedBox(
          height: 340,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: data[2].value.length ?? 0,
            itemBuilder: (context, index) {
              return CardEbookView(data[2].value[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _labelEbookCampaign3({
    required Future<Object> future,
    required RxList<EbookCampaign> data,
  }) {
    if (data.isEmpty) {
      return SizedBox();
    }

    DateTime endDate = data[3].endDate;

    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 10),
            Text(
              data[3].label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            TextButton(
                onPressed: () => Get,
                style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 12)),
                child: Row(
                  children: const [
                    Text('Lihat Semua'),
                    Icon(Ionicons.chevron_forward_outline, size: 16)
                  ],
                )),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Text(
              'Berakhir dalam ',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            CountdownTimer(
              endTime: endDate.millisecondsSinceEpoch,
              widgetBuilder: (context, time) {
                return Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 5),
                    Visibility(
                      visible: time?.days != null,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0473BD),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          ((time?.days ?? 0) < 10)
                              ? '0${time?.days ?? 00}'
                              : '${time?.days ?? 00}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: time?.days != null,
                      child: const Text(
                        ' : ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0473BD),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        ((time?.hours ?? 0) < 10)
                            ? '0${time?.hours ?? 00}'
                            : '${time?.hours ?? 00}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Text(
                      ' : ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0473BD),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        ((time?.min ?? 0) < 10)
                            ? '0${time?.min ?? 00}'
                            : '${time?.min ?? 00}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Text(
                      ' : ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0473BD),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        ((time?.sec ?? 0) < 10)
                            ? '0${time?.sec ?? 00}'
                            : '${time?.sec ?? 00}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
        SizedBox(
          height: 340,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: data[3].value.length ?? 0,
            itemBuilder: (context, index) {
              return CardEbookView(data[3].value[index]);
            },
          ),
        ),
      ],
    );
  }
}
