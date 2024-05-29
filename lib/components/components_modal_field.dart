import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import '../components/components_modal_bottom.dart';

import '../components/components_decision.dart';
import '../configs/config_components.dart';
import '../configs/config_apps.dart';

modalField(
  BuildContext context,
  String field,
  int? maxLength,
  bool? onlyNumber,
  Function(String) callback,
) {
  String valueNew = "";

  showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      elevation: 1,
      child: Container(
        width: 900,
        padding: const EdgeInsets.all(defaultSize),
        decoration: BoxDecoration(
          color: colorBlack,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: defaultSize * 0.5),
                child: Text(
                  field,
                  style: GoogleFonts.poppins(
                    fontSize: defaultSize * 0.85,
                    color: colorAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: defaultSize),
            TextField(
              autofocus: true,
              style: GoogleFonts.poppins(color: colorBlack),
              maxLength: maxLength,
              keyboardType: onlyNumber!
                  ? const TextInputType.numberWithOptions(decimal: true)
                  : TextInputType.text,
              decoration: InputDecoration(
                border: kInputBorder,
                errorBorder: kInputBorder,
                focusedBorder: sInputBorder,
                enabledBorder: kInputBorder,
                hintText: field,
                hintStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.normal,
                  color: colorAccent,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: defaultSize * 1.25,
                  horizontal: defaultSize * 1.5,
                ),
                counterText: '',
              ),
              onChanged: (value) {
                valueNew = value;
              },
            ),
            const SizedBox(height: defaultSize * 1.5),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultSize * 0.5,
              ),
              child: ComponentsDecision(
                textLeft: "Simpan",
                textRight: "Batal",
                borderRadiusLeft: defaultRadius * 4,
                borderRadiusRight: defaultRadius * 4,
                isDifferent: false,
                onTapLeft: () {
                  if (valueNew.length >= 3) {
                    callback(valueNew);
                    Navigator.of(context).pop();
                  } else {
                    modalBottom(
                      context,
                      messageMinimunChars,
                      null,
                      () {},
                    );
                  }
                },
                onTapRight: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
