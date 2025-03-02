import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_bonds/data/models/company_model/company_model.dart';
import 'package:tap_bonds/utils/extensions.dart';

class CompanyWidget extends StatelessWidget {
  const CompanyWidget({
    super.key,
    required this.companyModel,
    this.searchQuery = '',
  });

  final String searchQuery;

  final CompanyModel companyModel;

  @override
  Widget build(BuildContext context) {
    final String defaultData = 'INE06E50';
    final bool hasQuery = searchQuery.trim().isNotEmpty;

    return ListTile(
      onTap: () {
        context.push('/company-detail');
      },
      titleAlignment: ListTileTitleAlignment.center,
      contentPadding: EdgeInsets.all(0),
      leading: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 0.8, color: HexColor('#E5E7EB')),
        ),
        padding: EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(imageUrl: companyModel.logo),
        ),
      ),

      title: RichText(
        text: TextSpan(
          children: [
            WidgetSpan(
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color:
                      hasQuery && isMatched(searchQuery, defaultData)
                          ? HexColor('#fbecd7')
                          : Colors.transparent,
                ),
                child: Text(
                  defaultData,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(16, 24, 40, 0.7),
                  ),
                ),
              ),
            ),

            WidgetSpan(
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color:
                      hasQuery &&
                              isMatched(
                                searchQuery,
                                companyModel.isin.replaceAll(defaultData, ''),
                              )
                          ? HexColor('#fbecd7')
                          : Colors.transparent,
                ),
                child: Text(
                  companyModel.isin.replaceAll(defaultData, ''),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: HexColor('#101828'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      subtitle: builtHighlightTextWidgets(
        searchQuery,
        '${companyModel.rating} . ${companyModel.companyName ?? ''}',
      ),
      trailing: Icon(Icons.navigate_next, color: HexColor('#1447E6')),
    );
  }

  bool isMatched(String query, String data) {
    final List<String> searchWords = query.trim().split(' ');
    for (final String word in searchWords) {
      if (word.toLowerCase() == data.toLowerCase()) {
        return true;
      }
    }
    return false;
  }

  Text builtHighlightTextWidgets(String query, String data) {
    final TextStyle textStyle = GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: HexColor('#99A1AF'),
    );

    if (searchQuery.trim().isEmpty) {
      return Text(data, style: textStyle);
    }

    final textSpans = List.empty(growable: true);

    final List<String> searchWords = query.trim().split(' ');
    final List<String> contentWords = data.trim().split(' ');

    for (int i = 0; i < contentWords.length; i++) {
      String content = contentWords[i];

      bool isMatched = false;
      for (final String word in searchWords) {
        if (content.toLowerCase() == word.toLowerCase()) {
          isMatched = true;
          break;
        }
      }

      textSpans.add(
        WidgetSpan(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: isMatched ? HexColor('#fbecd7') : Colors.transparent,
            ),
            child: Text(content, style: textStyle),
          ),
        ),
      );
    }
    return Text.rich(TextSpan(children: <InlineSpan>[...textSpans]));
  }
}
