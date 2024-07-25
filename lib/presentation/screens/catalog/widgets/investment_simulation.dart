import 'package:finniu/infrastructure/models/calculate_investment.dart';
import 'package:finniu/presentation/providers/calculate_investment_provider.dart';
import 'package:finniu/presentation/providers/money_provider.dart';
import 'package:finniu/presentation/providers/settings_provider.dart';
import 'package:finniu/presentation/screens/catalog/widgets/blue_gold_card/buttons_card.dart';
import 'package:finniu/presentation/screens/catalog/widgets/simulation_modal/simulation_loading.dart';
import 'package:finniu/presentation/screens/catalog/widgets/simulation_modal/simulation_success.dart';
import 'package:finniu/presentation/screens/catalog/widgets/simulation_modal/simulator_error.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InvestmentSimulationButton extends ConsumerWidget {
  const InvestmentSimulationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void toInvestPressed() {
      Navigator.of(context).pop();
    }

    void recalculatePressed() {
      Navigator.of(context).pop();
    }

    return ElevatedButton(
      onPressed: () => investmentSimulationModal(
        context,
        finalAmount: 9000,
        startingAmount: 8000,
        mouthInvestment: 6,
        toInvestPressed: toInvestPressed,
        recalculatePressed: recalculatePressed,
      ),
      child: const Text('modal invesrtion calculada'),
    );
  }
}

Future<dynamic> investmentSimulationModal(
  BuildContext context, {
  required int startingAmount,
  required int finalAmount,
  required int mouthInvestment,
  VoidCallback? toInvestPressed,
  VoidCallback? recalculatePressed,
}) async {
  showModalBottomSheet(
    context: context,
    builder: (context) => BodySimulation(
      startingAmount: startingAmount,
      monthInvestment: mouthInvestment,
      toInvestPressed: toInvestPressed,
      recalculatePressed: recalculatePressed,
    ),
  );
}

class BodySimulation extends ConsumerWidget {
  const BodySimulation({
    super.key,
    required this.startingAmount,
    required this.monthInvestment,
    this.toInvestPressed,
    this.recalculatePressed,
  });
  final int startingAmount;
  final int monthInvestment;
  final VoidCallback? toInvestPressed;
  final VoidCallback? recalculatePressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(settingsNotifierProvider).isDarkMode;
    const int backgroundDark = 0xff1A1A1A;
    const int backgroundLight = 0xffFFFFFF;
    return Container(
      decoration: BoxDecoration(
        color: isDarkMode
            ? const Color(backgroundDark)
            : const Color(backgroundLight),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Stack(
        children: [
          Dialog(
            insetPadding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            backgroundColor: isDarkMode
                ? const Color(backgroundDark)
                : const Color(backgroundLight),
            child: BodyDialog(
              startingAmount: startingAmount,
              monthInvestment: monthInvestment,
              toInvestPressed: toInvestPressed,
              recalculatePressed: recalculatePressed,
            ),
          ),
          const CloseButtonModal(),
        ],
      ),
    );
  }
}

class BodyDialog extends ConsumerStatefulWidget {
  const BodyDialog({
    super.key,
    required this.startingAmount,
    required this.monthInvestment,
    this.toInvestPressed,
    this.recalculatePressed,
  });

  final int startingAmount;
  final int monthInvestment;

  final VoidCallback? toInvestPressed;
  final VoidCallback? recalculatePressed;

  @override
  ConsumerState<BodyDialog> createState() => _BodyDialogState();
}

class _BodyDialogState extends ConsumerState<BodyDialog> {
  @override
  Widget build(BuildContext context) {
    final isSoles = ref.watch(isSolesStateProvider);
    CalculatorInput calculatorInput = CalculatorInput(
      amount: widget.startingAmount,
      months: widget.monthInvestment,
      currency: isSoles ? 'nuevo sol' : 'dolar',
    );

    final response =
        ref.watch(calculateInvestmentFutureProvider(calculatorInput));

    return response.when(
      data: (data) {
        return SimulationSuccess(
          monthInvestment: widget.monthInvestment,
          startingAmount: widget.startingAmount,
          toInvestPressed: widget.toInvestPressed,
          recalculatePressed: widget.recalculatePressed,
          profitability: data.profitability!.toInt(),
          percentage: data.finalRentability!.toInt(),
        );
      },
      loading: () {
        return SimulationLoading(
          monthInvestment: widget.monthInvestment,
          startingAmount: widget.startingAmount,
          toInvestPressed: widget.toInvestPressed,
          recalculatePressed: widget.recalculatePressed,
        );
      },
      error: (error, stack) {
        return SimulationError(
          monthInvestment: widget.monthInvestment,
          startingAmount: widget.startingAmount,
          toInvestPressed: widget.toInvestPressed,
          recalculatePressed: widget.recalculatePressed,
        );
      },
    );
  }
}
