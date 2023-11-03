import 'dart:convert';
import 'package:andipublisher/app/data/models/ebook_campaign.dart';
import 'package:andipublisher/app/data/services/main_service.dart';

class EbbokCampaignService {
  static Future<List<EbookCampaign>> getCampaigns() async {
    final result = await MainService().getAPI(
      url: 'ebook/campaign',
    );
    final dataList = result['data'] as List<dynamic>;
    final campaignList = dataList.map((data) => EbookCampaign.fromJson(data)).toList();

    return campaignList;
  }
}
