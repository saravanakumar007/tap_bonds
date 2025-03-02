import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_bonds/data/models/company_detail_model/company_detail_model.dart';
import 'package:tap_bonds/resources/images.dart';

class IssuerDetailsWidget extends StatelessWidget {
  const IssuerDetailsWidget({super.key, required this.issuerDetailsData});

  final IssuerDetails issuerDetailsData;

  @override
  Widget build(BuildContext context) {
    final List<dynamic> issuerDetails = [
      {'name': 'Issuer Name', 'value': issuerDetailsData.issuerName},
      {'name': 'Type of Issuer', 'value': issuerDetailsData.typeOfIssuer},
      {'name': 'Sector', 'value': issuerDetailsData.sector},
      {'name': 'Industry', 'value': issuerDetailsData.industry},
      {'name': 'Issuer nature', 'value': issuerDetailsData.issuerNature},
      {
        'name': 'Corporate Identity Number (CIN)',
        'value': issuerDetailsData.cin,
      },
      {
        'name': 'Name of the Lead Manager',
        'value': issuerDetailsData.leadManager,
      },

      {'name': 'Registrar', 'value': issuerDetailsData.registrar},
      {
        'name': 'Name of Debenture Trustee',
        'value': issuerDetailsData.debentureTrustee,
      },
    ];
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color.fromRGBO(229, 231, 235, 1)),
        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                SvgPicture.asset(
                  Images.addressBook,
                  fit: BoxFit.fill,
                  height: 24,
                  width: 24,
                ),
                SizedBox(width: 5),
                Text(
                  'Issuer Details',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color.fromRGBO(2, 6, 23, 1),
                  ),
                ),
              ],
            ),
          ),

          Divider(color: Color.fromRGBO(229, 231, 235, 1)),

          SizedBox(height: 20),

          ...List.generate(
            issuerDetails.length,
            (int index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    issuerDetails[index]['name'],
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color.fromRGBO(29, 78, 216, 1),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    issuerDetails[index]['value'],
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color.fromRGBO(17, 24, 39, 1),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          )..toList(),
        ],
      ),
    );
  }
}
