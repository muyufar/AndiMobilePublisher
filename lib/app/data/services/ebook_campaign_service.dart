import 'dart:convert';
import 'package:andipublisher/app/data/models/ebook_campaign.dart';
import 'package:andipublisher/app/data/services/main_service.dart';

class EbbokCampaignService {

  static Future<List<EbookCampaign>> getCampaigns() async {
    final result = await MainService().getAPI(url: 'ebook/campaign');

return List<EbookCampaign>.from(((result != null) ? result['data'] : ['value'])
        .map((e) => EbookCampaign.fromJson(e)));
  }
}
