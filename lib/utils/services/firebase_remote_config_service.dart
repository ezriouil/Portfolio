import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:portfolio/utils/constants/custom_constants.dart';

class FirebaseRemoteConfigService {
  static final FirebaseRemoteConfigService _instance =
      FirebaseRemoteConfigService._internal();
  factory FirebaseRemoteConfigService() => _instance;
  FirebaseRemoteConfigService._internal();

  late FirebaseRemoteConfig _remoteConfig;
  bool _initialized = false;

  // Cache values for better performance
  String? _cachedCVUrl;
  String? _cachedGitHubUrl;
  String? _cachedLinkedInUrl;
  String? _cachedEmail;
  String? _cachedGmailUrl;

  /// Initialize Remote Config with default values
  Future<void> initialize() async {
    if (_initialized) return;

    _remoteConfig = FirebaseRemoteConfig.instance;

    // Set default values
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(hours: 1),
      ),
    );

    // Set defaults with fallback values from CustomConstants
    await _remoteConfig.setDefaults({
      'CV':
          'https://drive.google.com/file/d/1fyUBU8oJ6wWHaXo4Cd2qW79klP0I5HYi/view?usp=sharing',
      'GITHUB': CustomConstants.GITHUB,
      'LIKED_IN': CustomConstants.LIKED_IN,
      'GMAIL': CustomConstants.GMAIL,
      'EMAIL': CustomConstants.GMAIL,
    });

    // Fetch and activate
    try {
      await _remoteConfig.fetchAndActivate();
      // Clear cache when new config is fetched
      _clearCache();
    } catch (e) {
      // If fetch fails, use defaults
      debugPrint('Remote Config fetch failed: $e');
    }

    _initialized = true;
  }

  /// Clear cached values
  void _clearCache() {
    _cachedCVUrl = null;
    _cachedGitHubUrl = null;
    _cachedLinkedInUrl = null;
    _cachedEmail = null;
    _cachedGmailUrl = null;
  }

  /// Get CV URL from Remote Config (with caching for performance)
  String getCVUrl() {
    if (_cachedCVUrl != null) return _cachedCVUrl!;

    if (!_initialized) {
      _cachedCVUrl =
          'https://drive.google.com/file/d/1fyUBU8oJ6wWHaXo4Cd2qW79klP0I5HYi/view?usp=sharing';
      return _cachedCVUrl!;
    }

    final cvUrl = _remoteConfig.getString('CV');
    _cachedCVUrl = cvUrl.isEmpty
        ? 'https://drive.google.com/file/d/1fyUBU8oJ6wWHaXo4Cd2qW79klP0I5HYi/view?usp=sharing'
        : cvUrl;
    return _cachedCVUrl!;
  }

  /// Get GitHub URL from Remote Config (with caching for performance)
  String getGitHubUrl() {
    if (_cachedGitHubUrl != null) return _cachedGitHubUrl!;

    if (!_initialized) {
      _cachedGitHubUrl = CustomConstants.GITHUB;
      return _cachedGitHubUrl!;
    }

    final githubUrl = _remoteConfig.getString('GITHUB');
    _cachedGitHubUrl = githubUrl.isEmpty ? CustomConstants.GITHUB : githubUrl;
    return _cachedGitHubUrl!;
  }

  /// Get LinkedIn URL from Remote Config (with caching for performance)
  String getLinkedInUrl() {
    if (_cachedLinkedInUrl != null) return _cachedLinkedInUrl!;

    if (!_initialized) {
      _cachedLinkedInUrl = CustomConstants.LIKED_IN;
      return _cachedLinkedInUrl!;
    }

    final linkedInUrl = _remoteConfig.getString('LIKED_IN');
    _cachedLinkedInUrl = linkedInUrl.isEmpty
        ? CustomConstants.LIKED_IN
        : linkedInUrl;
    return _cachedLinkedInUrl!;
  }

  /// Get Gmail/Email from Remote Config (with caching for performance)
  String getEmail() {
    if (_cachedEmail != null) return _cachedEmail!;

    if (!_initialized) {
      _cachedEmail = CustomConstants.GMAIL;
      return _cachedEmail!;
    }

    final email = _remoteConfig.getString('EMAIL');
    _cachedEmail = email.isEmpty ? CustomConstants.GMAIL : email;
    return _cachedEmail!;
  }

  /// Get Gmail URL from Remote Config (for display purposes, with caching)
  String getGmailUrl() {
    if (_cachedGmailUrl != null) return _cachedGmailUrl!;

    if (!_initialized) {
      _cachedGmailUrl = CustomConstants.GMAIL;
      return _cachedGmailUrl!;
    }

    final gmailUrl = _remoteConfig.getString('GMAIL');
    _cachedGmailUrl = gmailUrl.isEmpty ? CustomConstants.GMAIL : gmailUrl;
    return _cachedGmailUrl!;
  }

  /// Force fetch latest config (useful for testing)
  Future<void> fetchAndActivate() async {
    if (!_initialized) {
      await initialize();
      return;
    }
    try {
      await _remoteConfig.fetchAndActivate();
      // Clear cache when new config is fetched
      _clearCache();
    } catch (e) {
      debugPrint('Remote Config fetch failed: $e');
    }
  }
}
