import 'package:flutter/material.dart';
import 'package:traefik_frontend_shared/shared_models.dart';

class SelectHttpServiceType extends StatefulWidget {
  const SelectHttpServiceType({super.key});

  @override
  State<SelectHttpServiceType> createState() => _SelectHttpServiceTypeState();
}

class _SelectHttpServiceTypeState extends State<SelectHttpServiceType> {
  late EHttpServiceType? httpServiceType;

  @override
  void initState() {
    super.initState();
    httpServiceType = null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RadioGroup<EHttpServiceType>(
          groupValue: httpServiceType,
          onChanged: (value) {
            setState(() {
              httpServiceType = value;
            });
          },
          child: const Column(
            children: [
              RadioListTile(
                value: EHttpServiceType.loadBalancer,
                title: Text('Load Balancer'),
              ),
              RadioListTile(
                value: EHttpServiceType.mirroring,
                title: Text('Mirroring'),
              ),
              RadioListTile(
                value: EHttpServiceType.roundrobin,
                title: Text('Weighted Round Robin'),
              ),
            ],
          ),
        ),
        if (httpServiceType != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop(httpServiceType);
              },
              child: const Text(
                'Select',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
