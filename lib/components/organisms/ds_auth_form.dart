import 'package:custom_design_system/components/atoms/ds_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DsForm extends StatelessWidget {
  final String? assetImageRoute;
  final String title;
  final GlobalKey<FormState> globalKey;
  final List<Widget> inputs;
  final void Function()? onSubmit;

  const DsForm({
    super.key,
    this.assetImageRoute,
    this.onSubmit,
    required this.globalKey,
    required this.inputs,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
          key: globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildLogo(context, assetImageRoute),
              const SizedBox(
                height: 35,
              ),
              _buildFormCard(context),
            ],
          )),
    );
  }

  Widget _buildLogo(BuildContext context, String? assetImageRoute) {
    final size = MediaQuery.of(context).size;

    return assetImageRoute == null
        ? const SizedBox()
        : Image.asset(
            '../$assetImageRoute',
            width: size.width < 1300 ? 125 : size.width * 0.1,
          );
  }

  Widget _buildFormCard(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: size.width > 1200
          ? EdgeInsets.symmetric(horizontal: size.width * 0.35)
          : size.width > 600 && size.width < 1200
              ? EdgeInsets.symmetric(horizontal: size.width * 0.15)
              : EdgeInsets.symmetric(horizontal: size.width * 0.05),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: AnimateList(
            interval: 150.ms,
            effects: [
              FadeEffect(duration: 200.ms),
            ],
            children: [
              Text(
                title,
                style: textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 50,
              ),
              for (var input in inputs) ...[
                input,
                const SizedBox(
                  height: 40,
                ),
              ],
              DsFilledButton(
                label: 'Ingresar',
                onPressed: onSubmit,
              )
            ],
          ),
        ),
      ),
    );
  }
}
