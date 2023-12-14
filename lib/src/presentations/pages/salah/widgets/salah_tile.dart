import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jaryq_kz/src/core/constants/colors.dart';
import 'package:jaryq_kz/src/data/models/salah_card_model.dart';
import 'package:jaryq_kz/src/presentations/pages/salah/salah_details_page.dart';

class SalahTile extends StatelessWidget {
  const SalahTile({super.key, required this.salahCard});
  final SalahCard salahCard;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SalahDetailsPage(salahCard: salahCard))),
      child: Container(
        width: 210,
        height: 210,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.kBottomNavigationGreyColor),
            borderRadius: const BorderRadius.all(Radius.circular(24))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SvgPicture.asset(salahCard.previewImage),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(salahCard.title),
                const Icon(Icons.arrow_right_alt_rounded),
              ],
            ),
            Expanded(
              child: Text(
                salahCard.desc,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
