import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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

    return ListTile(
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

      title: Wrap(
        children: [
          ...highlightOccurrences(
            'INE06E50',
            searchQuery,
            GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: HexColor('#101828'),
            ),
          ),

          ...highlightOccurrences(
            companyModel.isin.replaceAll(defaultData, ''),
            searchQuery,
            GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: HexColor('#101828'),
            ),
          ),
        ],
      ),
      subtitle: Wrap(
        children: [
          ...highlightOccurrences(
            '${companyModel.rating} . ${companyModel.companyName ?? ''}',
            searchQuery,
            GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: HexColor('#99A1AF'),
            ),
          ),
        ],
      ),
      trailing: Icon(Icons.navigate_next, color: HexColor('#1447E6')),
    );
  }

  List<InlineSpan> _builtHighlightWidgets(
    String searchQuery,
    String source,
    TextStyle textStyle,
  ) {
    final List<String> renderTexts = [];
    final List<InlineSpan> renderWidgets = [];
    final List<String> searchWords = searchQuery.split(' ');

    final List<Match> matches = <Match>[];
    for (final String token in searchQuery.trim().toLowerCase().split(' ')) {
      matches.addAll(token.allMatches(source.toLowerCase()));
    }

    if (matches.isEmpty) {}
    matches.sort((Match a, Match b) => a.start.compareTo(b.start));

    int lastMatchEnd = 0;

    for (final Match match in matches) {
      if (match.end <= lastMatchEnd) {
        // already matched -> ignore
      } else if (match.start <= lastMatchEnd) {
        renderTexts.add(source.substring(lastMatchEnd, match.end));
      } else {
        renderTexts.add(source.substring(lastMatchEnd, match.start));

        renderTexts.add(source.substring(match.start, match.end));
      }

      if (lastMatchEnd < match.end) {
        lastMatchEnd = match.end;
      }
    }

    if (lastMatchEnd < source.length) {
      renderTexts.add(source.substring(lastMatchEnd, source.length));
    }
    return renderWidgets;
  }

  List<Widget> highlightOccurrences(
    String source,
    String query,
    TextStyle textStyle,
  ) {
    Color matchColor = HexColor('#fae8d7');
    if (query == null || query.isEmpty) {
      return <Widget>[Text(source, style: textStyle)];
    }

    final List<Match> matches = <Match>[];
    for (final String token in query.trim().toLowerCase().split(' ')) {
      matches.addAll(token.allMatches(source.toLowerCase()));
    }

    if (matches.isEmpty) {
      return <Widget>[Text(source, style: textStyle)];
    }
    matches.sort((Match a, Match b) => a.start.compareTo(b.start));

    int lastMatchEnd = 0;
    final List<Widget> children = <Widget>[];

    for (final Match match in matches) {
      if (match.end <= lastMatchEnd) {
        // already matched -> ignore
      } else if (match.start <= lastMatchEnd) {
        children.add(
          Container(
            decoration: BoxDecoration(
              color: matchColor,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(5),
            child: Text(
              source.substring(lastMatchEnd, match.end),
              style: textStyle,
            ),
          ),
        );
      } else {
        children.add(
          Text(source.substring(lastMatchEnd, match.start), style: textStyle),
        );

        children.add(
          Container(
            decoration: BoxDecoration(
              color: matchColor,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(5),
            child: Text(
              source.substring(match.start, match.end),
              style: textStyle,
            ),
          ),
        );
      }

      if (lastMatchEnd < match.end) {
        lastMatchEnd = match.end;
      }
    }

    if (lastMatchEnd < source.length) {
      children.add(
        Text(source.substring(lastMatchEnd, source.length), style: textStyle),
      );
    }

    return children;
  }
}
