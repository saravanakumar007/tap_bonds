import 'package:flutter/material.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:tap_bonds/business_logic/company_list/company_list_cubit.dart';
import 'package:tap_bonds/business_logic/company_list/company_list_state.dart';
import 'package:tap_bonds/data/models/company_model/company_model.dart';
import 'package:tap_bonds/presentation/pages/company_list_page.dart';
import 'package:tap_bonds/presentation/widgets/company_widget.dart';

import '../../utils/helpers.dart';

class MockCompanyListCubit extends MockCubit<CompanyListState>
    implements CompanyListCubit {}

class FakeCompanyListState extends Fake implements CompanyListState {}

void main() {
  late BlocProvider provider;
  late List<CompanyModel> companyListData;
  late CompanyListCubit companyListCubit;

  setUp(() {
    registerFallbackValue(FakeCompanyListState());

    companyListData = DataModelFactory.getCompanyListData();

    companyListCubit = MockCompanyListCubit();
    provider = BlocProvider<CompanyListCubit>(
      create: (cubit) => companyListCubit,
    );
  });

  tearDown(() {
    companyListCubit.close();
  });

  group('Test Case - Company List Page', () {
    testWidgets('Ensure the initial company list data rendering ', (
      tester,
    ) async {
      await tester.runAsync(() async {
        when(
          () => companyListCubit.state,
        ).thenReturn(CompanyListState.success(data: companyListData));

        when(
          () => companyListCubit.fetchCompanyListData(),
        ).thenAnswer((_) => Future.value(companyListData));

        await tester.pumpWidget(CompanyListPage());
        await tester.pumpAndSettle();

        expect(find.byType(CompanyWidget), findsWidgets);
        expect(find.byType(ListTile), findsWidgets);
        expect(find.byType(RichText), findsWidgets);
      });
    });

    testWidgets('Ensure the search results ', (tester) async {
      await tester.runAsync(() async {
        when(
          () => companyListCubit.state,
        ).thenReturn(CompanyListState.success(data: companyListData));

        when(
          () => companyListCubit.fetchCompanyListData(),
        ).thenAnswer((_) => Future.value(companyListData));

        await tester.pumpWidget(CompanyListPage());
        await tester.pumpAndSettle();

        tester.tap(find.byKey(ValueKey('search_bar')));
        await tester.pump();

        final searchBarField = find.byKey(Key('search_bar'));

        await tester.enterText(searchBarField, 'Hella 1754');
        await tester.pump();

        expect(find.byType(CompanyWidget), findsWidgets);
        expect(find.widgetWithText(Text, 'Hella'), findsWidgets);
        expect(find.widgetWithText(Text, '1754'), findsOneWidget);
      });
    });
  });
}
