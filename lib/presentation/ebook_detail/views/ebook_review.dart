import 'package:andipublisher/app/data/models/ebook_rating_model.dart';
import 'package:andipublisher/app/views/views/rating_product_view.dart';
import 'package:andipublisher/presentation/ebook_detail/controllers/ebook_detail.controller.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class ReviewsSection extends StatelessWidget {
  final EbookRatingData ebookRatingModel;
  final EbookDetailController controller;

  ReviewsSection({
    required this.ebookRatingModel,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Text(
          'Ulasan Pembeli',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 10),
        if (ebookRatingModel.list != null && ebookRatingModel.list!.isNotEmpty)
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ebookRatingModel.list!.length,
            itemBuilder: (context, index) {
              final review = ebookRatingModel.list![index];
              return _buildReviewItem(review);
            },
          )
        else
          const Text('Belum ada ulasan'),
      ],
    );
  }

Widget _buildReviewItem(EbookRatingItem review) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Text(
            review.namaUser ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 5),
          // const Spacer(),
          Text(
            '${timeago.format(review.createdAt ?? DateTime.now(), )}',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
      if (review.value != null && review.value is String)
        RatingProductView(
          double.tryParse(review.value! as String) ?? 0.0,
          starHalf: true,
        ),
      SizedBox(height: 10),
      Text(review.description ?? ''),
      SizedBox(height: 10),
    ],
  );
}
}
