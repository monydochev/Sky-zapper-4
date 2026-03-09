import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sky_zapper/app.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: SkyZapperApp()),
    );
    // Verify that the app starts without crashing.
    expect(find.text('SKY Zapper'), findsAny);
  });
}
