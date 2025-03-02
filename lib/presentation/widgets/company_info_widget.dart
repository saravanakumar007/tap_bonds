import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_bonds/data/models/company_detail_model/company_detail_model.dart';
import 'package:tap_bonds/utils/extensions.dart';

class CompanyInfoWidget extends StatelessWidget {
  const CompanyInfoWidget({super.key, required this.companyDetailModel});

  final CompanyDetailModel companyDetailModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 70,
          width: 70,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            border: Border.all(width: 1, color: HexColor('#E5E7EB')),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 6,
                spreadRadius: -1,
                color: HexColor('#00008'),
              ),
            ],
          ),
          child: ClipRRect(
            child: CachedNetworkImage(imageUrl: companyDetailModel.logo),
          ),
        ),
        SizedBox(height: 30),
        Text(
          companyDetailModel.companyName!,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: HexColor('#101828'),
          ),
        ),
        SizedBox(height: 20),
        Text(
          companyDetailModel.description,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: HexColor('#6A7282'),
          ),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: HexColor('#2563EB').withValues(alpha: 0.1),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                'ISIN: ${companyDetailModel.isin}',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: HexColor('#2563EB'),
                ),
              ),
            ),
            SizedBox(width: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: HexColor('#059669').withValues(alpha: 0.1),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                companyDetailModel.status,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: HexColor('#059669'),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
