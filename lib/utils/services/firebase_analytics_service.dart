import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

class FirebaseAnalyticsService {
  static final FirebaseAnalyticsService _instance =
      FirebaseAnalyticsService._internal();
  factory FirebaseAnalyticsService() => _instance;
  FirebaseAnalyticsService._internal();

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  /// Log a screen view
  Future<void> logScreenView(String screenName) async {
    try {
      await _analytics.logScreenView(screenName: screenName);
    } catch (e) {
      debugPrint('Analytics error: $e');
    }
  }

  /// Log a custom event
  Future<void> logEvent(
    String eventName, {
    Map<String, Object>? parameters,
  }) async {
    try {
      await _analytics.logEvent(name: eventName, parameters: parameters);
    } catch (e) {
      debugPrint('Analytics error: $e');
    }
  }

  /// Log navigation events
  Future<void> logNavigation(String destination) async {
    await logEvent('navigation', parameters: {'destination': destination});
  }

  /// Log CV download
  Future<void> logCVDownload() async {
    await logEvent('cv_download');
  }

  /// Log contact form submission
  Future<void> logContactFormSubmission() async {
    await logEvent('contact_form_submission');
  }

  /// Log project link click
  Future<void> logProjectLinkClick(String projectTitle, String linkType) async {
    await logEvent(
      'project_link_click',
      parameters: {
        'project_title': projectTitle,
        'link_type': linkType, // 'google_play', 'app_store', 'video'
      },
    );
  }

  /// Log social media click
  Future<void> logSocialMediaClick(String platform) async {
    await logEvent('social_media_click', parameters: {'platform': platform});
  }

  /// Log theme change
  Future<void> logThemeChange(bool isDark) async {
    await logEvent('theme_change', parameters: {'is_dark': isDark});
  }
}
