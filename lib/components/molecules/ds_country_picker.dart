import 'package:country_picker/country_picker.dart';
import 'package:custom_design_system/components/molecules/ds_text_form_field.dart';
import 'package:custom_design_system/styles/ds_colors.dart';
import 'package:flutter/material.dart';

class DsCountryPicker extends StatefulWidget {
  final String label;
  final String? country;
  final bool? showTitle;
  final String? Function(String?)? validator;
  final ValueChanged<Country> onCountryChanged;

  const DsCountryPicker({
    super.key,
    required this.label,
    this.showTitle,
    this.validator,
    required this.onCountryChanged,
    this.country,
  });

  @override
  State<DsCountryPicker> createState() => _DsCountryPickerState();
}

class _DsCountryPickerState extends State<DsCountryPicker> {
  String? countryName;

  @override
  void initState() {
    countryName = widget.country;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(),
        _buildCountryPicker(context),
      ],
    );
  }

  Widget _buildCountryPicker(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: 83,
      width: double.infinity,
      child: Stack(
        children: [
          DsInput(
            showHeader: false,
            label: countryName ?? "Country",
            validator: widget.validator,
          ),
          GestureDetector(
            onTap: () async {
              showCountryPicker(
                context: context,
                countryListTheme: CountryListThemeData(
                  flagSize: 25,
                  textStyle:
                      const TextStyle(fontSize: 16, color: DSColors.grey700),
                  bottomSheetHeight: size.height * 0.8,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  inputDecoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: DSColors.card,
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
                onSelect: (Country value) {
                  countryName = value.name;
                  widget.onCountryChanged(value);
                  setState(() {});
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return widget.showTitle == false || widget.showTitle == null
        ? const SizedBox()
        : Column(
            children: [
              Text(
                widget.label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          );
  }
}
