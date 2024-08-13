import 'package:finniu/presentation/screens/catalog/widgets/text_poppins.dart';
import 'package:finniu/presentation/screens/home_v2/widgets/tour_modal/button_icon_tour.dart';
import 'package:finniu/presentation/screens/home_v2/widgets/tour_modal/state_tour.dart';
import 'package:flutter/material.dart';

class BodyTour extends StatelessWidget {
  const BodyTour({
    super.key,
    required this.title,
    required this.textColor,
    required this.textBody,
    required this.onPressed,
    required this.onClosePressed,
    required this.indexTour,
    this.eyeRender = false,
    this.isFinal = false,
  });

  final String title;
  final int textColor;
  final String textBody;
  final VoidCallback? onPressed;
  final VoidCallback? onClosePressed;
  final int indexTour;
  final bool eyeRender;
  final bool isFinal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: Stack(
        children: [
          eyeRender
              ? Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    "assets/tour/eye_down_two.png",
                    width: 106,
                    height: 120,
                  ),
                )
              : const SizedBox(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StateTour(
                items: 6,
                indexTour: indexTour,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextPoppins(
                  text: title,
                  fontSize: 20,
                  isBold: true,
                  textDark: textColor,
                  textLight: textColor,
                  align: TextAlign.start,
                  lines: 2,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextPoppins(
                  text: textBody,
                  fontSize: 16,
                  isBold: false,
                  textDark: textColor,
                  textLight: textColor,
                  lines: 2,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              eyeRender
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ButtonCloseTour(
                            widthPercent: 0.4,
                            onPressed: onClosePressed,
                            label: "Saltar",
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ButtonIconTour(
                            widthPercent: 0.4,
                            onPressed: onPressed,
                            label: "Comenzar",
                          ),
                        ],
                      ),
                    )
                  : !isFinal
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ButtonCloseTour(
                                widthPercent: 0.4,
                                onPressed: onClosePressed,
                                label: "Saltar",
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ButtonIconTour(
                                widthPercent: 0.4,
                                onPressed: onPressed,
                                label: "Comenzar",
                              ),
                            ],
                          ),
                        )
                      : SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ButtonIconTour(
                                widthPercent: 0.4,
                                onPressed: onClosePressed,
                                label: "Finalizar",
                              ),
                            ],
                          ),
                        ),
            ],
          ),
        ],
      ),
    );
  }
}
