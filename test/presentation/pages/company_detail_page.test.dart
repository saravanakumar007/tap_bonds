import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:tap_bonds/business_logic/company_detail/company_detail_cubit.dart';
import 'package:tap_bonds/business_logic/company_detail/company_detail_state.dart';
import 'package:tap_bonds/data/models/company_detail_model/company_detail_model.dart';
import 'package:tap_bonds/presentation/pages/company_detail_page.dart';
import 'package:tap_bonds/presentation/pages/company_list_page.dart';
import 'package:tap_bonds/presentation/widgets/chart_widget.dart';
import 'package:tap_bonds/presentation/widgets/company_info_widget.dart';
import 'package:tap_bonds/presentation/widgets/financial_data_widget.dart';
import 'package:tap_bonds/presentation/widgets/financial_view_widget.dart';
import 'package:tap_bonds/presentation/widgets/issuer_details_widget.dart';
import 'package:tap_bonds/presentation/widgets/prod_and_cons_widget.dart';

import '../../utils/helpers.dart';

class MockCompanyDetailCubit extends MockCubit<CompanyDetailState>
    implements CompanyDetailCubit {}

class FakeCompanyDetailState extends Fake implements CompanyDetailState {}

void main() {
  late BlocProvider provider;
  late CompanyDetailModel companyDetail;
  late CompanyDetailCubit companyDetailCubit;

  setUp(() {
    registerFallbackValue(FakeCompanyDetailState());

    companyDetail = DataModelFactory.getCompanyDetailData();

    companyDetailCubit = MockCompanyDetailCubit();
    provider = BlocProvider<CompanyDetailCubit>(
      create: (cubit) => companyDetailCubit,
    );
  });

  tearDown(() {
    companyDetailCubit.close();
  });

  group('Test Case - Company Detail Page', () {
    testWidgets('Ensure the UI Elements rendering ', (tester) async {
      await tester.runAsync(() async {
        when(
          () => companyDetailCubit.state,
        ).thenReturn(CompanyDetailState.success(data: companyDetail));

        when(
          () => companyDetailCubit.fetchCompanyDetailData(),
        ).thenAnswer((_) => Future.value(companyDetail));

        await tester.pumpWidget(CompanyListPage());
        await tester.pumpAndSettle();

        expect(find.byType(CompanyInfoWidget), findsOneWidget);

        expect(find.byType(FinancialViewWidget), findsOneWidget);

        expect(find.byType(FinancialDataWidget), findsOneWidget);

        expect(find.byType(IssuerDetailsWidget), findsOneWidget);
      });
    });

    testWidgets('Ensure the Financial Chart Elements rendering', (
      tester,
    ) async {
      await tester.runAsync(() async {
        when(
          () => companyDetailCubit.state,
        ).thenReturn(CompanyDetailState.success(data: companyDetail));

        when(
          () => companyDetailCubit.fetchCompanyDetailData(),
        ).thenAnswer((_) => Future.value(companyDetail));

        await tester.pumpWidget(CompanyDetailPage());
        await tester.pumpAndSettle();

        expect(find.byType(ChartWidget), findsOneWidget);
      });
    });

    testWidgets('Ensure the Tab Changing', (tester) async {
      await tester.runAsync(() async {
        when(
          () => companyDetailCubit.state,
        ).thenReturn(CompanyDetailState.success(data: companyDetail));

        when(
          () => companyDetailCubit.fetchCompanyDetailData(),
        ).thenAnswer((_) => Future.value(companyDetail));

        await tester.pumpWidget(CompanyDetailPage());
        await tester.pumpAndSettle();

        await tester.tap(find.byKey(Key('pros_and_cons')));

        expect(find.byType(ProdAndConsWidget), findsOneWidget);

        expect(find.widgetWithText(Text, 'Pros and Cons'), 'Pros and Cons');
        expect(find.widgetWithText(Text, 'Pros'), 'Pros');
        expect(find.widgetWithText(Text, 'Cons'), 'Cons');

        await tester.tap(find.byKey(Key('ISIN_Analysis')));
        expect(find.byType(IssuerDetailsWidget), findsOneWidget);
      });
    });

    testWidgets('Ensure the Chart Type Changing', (tester) async {
      await tester.runAsync(() async {
        when(
          () => companyDetailCubit.state,
        ).thenReturn(CompanyDetailState.success(data: companyDetail));

        when(
          () => companyDetailCubit.fetchCompanyDetailData(),
        ).thenAnswer((_) => Future.value(companyDetail));

        await tester.pumpWidget(CompanyDetailPage());
        await tester.pumpAndSettle();

        await tester.tap(find.byKey(Key('revenue')));

        expect(find.byType(ChartWidget), findsOneWidget);

        await tester.tap(find.byKey(Key('ebitda')));
        expect(find.byType(ChartWidget), findsOneWidget);
        expect(find.byType(IssuerDetailsWidget), findsOneWidget);
      });
    });
  });
}
