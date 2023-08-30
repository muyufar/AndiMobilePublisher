import 'package:andipublisher/app/data/models/item_master_detail_model.dart';
import 'package:andipublisher/app/views/views/utils_view.dart';
import 'package:andipublisher/extensions/int_extension.dart';
import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:andipublisher/presentation/item_detail/controllers/item_detail.controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class ItemDetailBottomSheetOrderView extends GetView {
  ItemDetailBottomSheetOrderView({Key? key}) : super(key: key);

  @override
  final ItemDetailController controller = Get.put(ItemDetailController());

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
                dropdownMenu(
                    label: 'Warehouse',
                    values: controller.itemMasterDetailModel.value!.warehouse),
                const SizedBox(height: 8),
                SizedBox(
                    child: Row(
                  children: [
                    const Text('jumlah Beli'),
                    const Spacer(),
                    Obx(() => quantityInput(
                          value: controller.quantityOrder,
                          maxValue:
                              controller.warehouse.value?.qtyStok.obs ?? 0.obs,
                          onTapMinus: () => controller.onTapQuantityMinus(),
                          onTapPlus: () => controller.onTapQuantityPlus(),
                        ))
                  ],
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

  Widget dropdownMenu({
    required String label,
    required List<Warehouse> values,
  }) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(label),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 3,
          child: DropdownButtonHideUnderline(
              child: Obx(
            () => DropdownButton<Warehouse>(
              value: controller.warehouse.value,
              items: values
                  .map(
                    (val) => DropdownMenuItem<Warehouse>(
                      value: val,
                      child: Text(
                          '${val.namaCabang.replaceAll('Warehouse ', '')} Stok ${val.qtyStok}'),
                    ),
                  )
                  .toList(),
              onChanged: (Warehouse? val) => controller.onChangedDropdown(val),
              isExpanded: true,
            ),
          )),
        ),
      ],
    );
  }
}
