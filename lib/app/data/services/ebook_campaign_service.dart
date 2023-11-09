import 'dart:convert';
import 'package:andipublisher/app/data/models/ebook_campaign.dart';
import 'package:andipublisher/app/data/services/main_service.dart';

class EbookCampaignService {
  static Future<List<EbookCampaign>> getCampaigns({
    required String limit_campaign,
    required String offset_campaign,
    required String limit_item,
    required String offset_item,
    required Map<String, dynamic> body,
  }) async {
    Map<String, String> body = {
      'limit_campaign': '10',
      'offset_campaign': offset_campaign,
      'offset_item': offset_item,
      'limit_item': '10',
    };
    final result = await MainService().getAPI(
      url: 'ebook/campaign',
    );

    if (result != null) {
      final dataList = result['data'] as List<dynamic>;
      final campaignList =
          dataList.map((item) => EbookCampaign.fromJson(item)).toList();
      return campaignList;
    } else {
      throw Exception('Failed to load campaigns');
    }
  }
}
