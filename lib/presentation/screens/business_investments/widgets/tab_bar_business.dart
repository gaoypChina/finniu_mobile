// ignore_for_file: unused_local_variable
import 'package:finniu/infrastructure/models/business_investments/business_investments.dart';
import 'package:finniu/presentation/providers/settings_provider.dart';
import 'package:finniu/presentation/screens/catalog/widgets/investment_complete.dart';
import 'package:finniu/presentation/screens/catalog/widgets/progres_bar_investment.dart';
import 'package:finniu/presentation/screens/catalog/widgets/text_poppins.dart';
import 'package:finniu/presentation/screens/catalog/widgets/to_validate_investment.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TabBarBusiness extends ConsumerStatefulWidget {
  const TabBarBusiness({super.key});

  @override
  ConsumerState<TabBarBusiness> createState() => _InvestmentHistoryBusiness();
}

class _InvestmentHistoryBusiness extends ConsumerState<TabBarBusiness>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(settingsNotifierProvider).isDarkMode;

    return Column(
      children: [
        TabBar(
          labelPadding: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.zero,
          dividerColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          controller: _tabController,
          tabs: [
            ButtonHistory(
              isSelected: _tabController.index == 0,
              text: 'Por validar',
            ),
            ButtonHistory(
              isSelected: _tabController.index == 1,
              text: 'En Curso',
            ),
            ButtonHistory(
              isSelected: _tabController.index == 2,
              text: 'Finalizadas',
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 336,
          height: MediaQuery.of(context).size.height * 0.3,
          child: TabBarView(
            controller: _tabController,
            children: [
              ToValidateList(
                list: toValidateList,
              ),
              InProgressList(list: inProgressList),
              CompletedList(list: completedList),
            ],
          ),
        ),
      ],
    );
  }
}

class CompletedList extends StatelessWidget {
  final List<CompletedItem> list;
  const CompletedList({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 336,
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: CompleteInvestment(
                dateEnds: list[index].dateEnds,
                amount: list[index].amount,
                isReInvestment: list[index].isReInvestment,
              ),
            );
          },
        ),
      ),
    );
  }
}

class InProgressList extends StatelessWidget {
  final List<InProgressItem> list;
  const InProgressList({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 336,
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ProgressBarInProgress(
                dateEnds: list[index].dateEnds,
                amount: list[index].amount,
              ),
            );
          },
        ),
      ),
    );
  }
}

class ToValidateList extends StatelessWidget {
  final List<ToValidateItem> list;
  const ToValidateList({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 336,
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ToValidateInvestment(
                dateEnds: list[index].dateEnds,
                amount: list[index].amount,
              ),
            );
          },
        ),
      ),
    );
  }
}

class ButtonHistory extends ConsumerWidget {
  final String text;
  final bool isSelected;
  const ButtonHistory({
    super.key,
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(settingsNotifierProvider).isDarkMode;
    int textDark = isSelected ? 0xff0D3A5C : 0xffFFFFFF;
    int textLight = isSelected ? 0xffffffff : 0xff000000;
    int backgroundDark = isSelected ? 0xffA2E6FA : 0xff0E0E0E;
    int backgroundLight = isSelected ? 0xff0D3A5C : 0xffF8F8F8;
    const int borderDark = 0xffA2E6FA;
    const int borderLight = 0xff0D3A5C;

    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 10, vertical: 5).copyWith(),
      decoration: BoxDecoration(
        color: isDarkMode ? Color(backgroundDark) : Color(backgroundLight),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        border: Border.all(
          color:
              isDarkMode ? const Color(borderDark) : const Color(borderLight),
          width: 1.0,
        ),
      ),
      child: Center(
        child: TextPoppins(
          text: text,
          fontSize: 12,
          isBold: true,
          textDark: textDark,
          textLight: textLight,
        ),
      ),
    );
  }
}
