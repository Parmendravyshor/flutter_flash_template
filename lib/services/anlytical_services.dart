import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  Future<void> logRevenue(double revenue) async {
    await _analytics.logEvent(
      name: 'in_app_purchase',
      parameters: {
        'value': revenue,
        'currency': 'USD', // Replace with the appropriate currency
      },
    );
  }

  // Add more analytics methods as needed
}

//// use like this
///
final AnalyticsService _analyticsService = AnalyticsService();

void handlePurchase(double amount) {
  /// I have paid 199Usd for this template
  _analyticsService.logRevenue(amount);
  // Add your purchase handling logic here
}
///