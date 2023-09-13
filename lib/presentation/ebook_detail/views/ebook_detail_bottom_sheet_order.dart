import 'package:andipublisher/app/data/models/item_master_detail_model.dart';
import 'package:andipublisher/app/views/views/utils_view.dart';
import 'package:andipublisher/extensions/int_extension.dart';
import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:andipublisher/presentation/ebook_detail/controllers/ebook_detail.controller.dart';
import 'package:andipublisher/presentation/item_detail/controllers/item_detail.controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class EbookDetailBottomSheetOrderView extends GetView {
  EbookDetailBottomSheetOrderView({Key? key}) : super(key: key);

  @override
  final EbookDetailController controller = Get.put(EbookDetailController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Ionicons.close_outline,
                  color: colorBlack,
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                    child: Row(
                  children: [],
                )),
                const SizedBox(height: 8),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Text(
                    'Total ${controller.priceTotalOrder.value.parceRp()}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                (controller.bottomSheetOrderIsBuy)
                    ? TextButton(
                        onPressed: () => controller.onTapBuyNow(),
                        child: const Text('Beli Sekarang'),
                      )
                    : TextButton(
                        onPressed: () => controller.onTapAddCart(),
                        child: const Text('Tambah Keranjang'),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
