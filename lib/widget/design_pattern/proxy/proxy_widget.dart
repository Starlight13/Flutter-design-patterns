import 'package:design_patterns/design_pattern/proxy/proxy.dart';
import 'package:design_patterns/design_pattern/proxy/real_service.dart';
import 'package:flutter/material.dart';

class ProxyPatternWidget extends StatefulWidget {
  const ProxyPatternWidget({super.key});

  @override
  State<ProxyPatternWidget> createState() => _ProxyPatternWidgetState();
}

class _ProxyPatternWidgetState extends State<ProxyPatternWidget> {
  final Proxy proxy = Proxy();
  final RealService realService = RealService();
  bool useProxy = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Use proxy'),
              Switch(
                value: useProxy,
                onChanged: (value) {
                  setState(
                    () {
                      useProxy = value;
                    },
                  );
                },
              ),
            ],
          ),
        ),
        FutureBuilder(
          future: useProxy ? proxy.catImage : realService.catImage,
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomPaint(
                    painter: snapshot.data,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        color: Colors.purple,
                        child: const Text(
                          'Rebuild',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ),
      ],
    );
  }
}
