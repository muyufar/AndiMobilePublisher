import 'package:andipublisher/app/data/services/transaction_ebook_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ionicons/ionicons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:andipublisher/gen/assets.gen.dart';
import 'package:andipublisher/infrastructure/theme/theme_utils.dart';

import 'controllers/ebook_ratings_input.controller.dart';
import 'package:andipublisher/app/data/models/ebook_detail_history_transaction_model.dart';

class EbookRatingsInputScreen extends GetView<EbookRatingsInputController> {
  const EbookRatingsInputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: FutureBuilder(
        future: TransactionEbookService.ebookgetDetailHistoryTransaction(
          idTransaksi: Get.arguments,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            controller.eboklistproductrating!.value =
                snapshot.data as EbookDetailHistoryTransactionModel;

            if (controller.eboklistproductrating!.value == null) {
              Get.back();
            }

            return Obx(
              () => ListView.builder(
                shrinkWrap: true,
                itemCount: controller.eboklistproductrating!.value!.items.length,
                itemBuilder: (context, index) {
                  return _cardRetingProduct(
                    data: controller.eboklistproductrating!.value!,
                  );
                },
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _cardRetingProduct({
    required EbookDetailHistoryTransactionModel data}) {
    return Obx(() =>  
    Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      margin: EdgeInsets.symmetric(vertical: 6),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CachedNetworkImage(
                imageUrl: data.items[0].gambar1,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    height: 44,
                    width: 44,
                    margin: EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(image: imageProvider),
                    ),
                  );
                },
                placeholder: (context, url) {
                  return Container(
                    height: 44,
                    width: 44,
                    margin: EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.grey,
                    ),
                  );
                },
                errorWidget: (context, url, error) {
                  return Container(
                    height: 44,
                    width: 44,
                    margin: EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.grey,
                    ),
                  );
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Get.width - 92,
                    child: Text(
                      data.items[0].judul,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              )
            ],
          ),
          Divider(),
          Text(
            'Kualitas Produk',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Center(
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: () => controller.onTapRetingProduct(
                          retingDataProduct: index + 1,
                          idDataProduct: data.items[0].idBarang,
                          idDataTransaksi: data.transaksi.idTransaksi),
                      child:
                          (controller.idEbook.value == data.items[0].idBarang)
                              ? (controller.retingProduct.value <= index)
                                  ? SvgPicture.asset(
                                      Assets.icons.iconPenilaianSaya,
                                      color: colorPrimary,
                                    )
                                  : SvgPicture.asset(
                                      Assets.icons.bintangWarna,
                                      height: 20,
                                    )
                              : SvgPicture.asset(
                                  Assets.icons.iconPenilaianSaya,
                                  color: colorPrimary,
                                ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: (controller.retingProduct.value != 0 &&
                controller.idEbook.value == data.items[0].idBarang),
            child: Column(
              children: [
                Container(
                  height: 100,
                  margin: const EdgeInsets.only(top: 28, bottom: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: TextFormField(
                    controller: controller.descriptionTextEditingController,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(fontSize: 12),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText:
                          'Bagikan penilaianmu dan bantu Pengguna lain membuat pilihan yang lebih baik!',
                      hintStyle: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tampilkan username pada penilaian',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        Text(
                          'Username yang akan ditampilkan adalah ',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    Spacer(),
                    CupertinoSwitch(
                      value: controller.hideName.value,
                      onChanged: (value) => controller.hideName.toggle(),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.onSend();
                    },
                    child: Text('Kirim'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
      elevation: 0,
      title: const Text('Nilai Ebook'),
      centerTitle: false,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(Ionicons.chevron_back),
      ),
    );
  }
}
