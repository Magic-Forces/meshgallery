import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meshgallery/homepage.dart';
import 'package:meshgallery/utils/permissions.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:meshgallery/utils/toast_util.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PermissionGate extends StatefulWidget {
  const PermissionGate({super.key});

  @override
  State<PermissionGate> createState() => _PermissionGateState();
}

class _PermissionGateState extends State<PermissionGate> {
  bool _isRequesting = false;
  bool _isPermanentlyDenied = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _checkInitialPermissionStatus();
  }

  Future<void> _checkInitialPermissionStatus() async {
    try {
      final photosStatus = await Permission.photos.status;
      final videosStatus = await Permission.videos.status;

      if (!mounted) return;

      setState(() {
        _isPermanentlyDenied =
            photosStatus == PermissionStatus.permanentlyDenied ||
            videosStatus == PermissionStatus.permanentlyDenied;
        _errorMessage = null;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessage =
            '${'permission_gate.error_checking'.tr()}: ${e.toString()}';
      });
    }
  }

  Future<void> _handlePermissionRequest() async {
    setState(() {
      _isRequesting = true;
      _errorMessage = null;
    });

    try {
      final result = await requestPermissions();
      if (!mounted) return;

      setState(() {
        _isRequesting = false;
        _isPermanentlyDenied = result.isPermanentlyDenied;
      });

      if (result.allGranted) {
        if (!mounted) return;
        Navigator.of(
          context,
        ).pushReplacement(MaterialPageRoute(builder: (_) => const HomePage()));
      } else if (result.isPermanentlyDenied) {
        ToastUtil.showToast(
          context,
          'permission_gate.permanently_denied_message'.tr(),
          toastLength: Toast.LENGTH_LONG,
        );
      } else {
        ToastUtil.showToast(
          context,
          'permission_gate.denied_message'.tr(),
          toastLength: Toast.LENGTH_LONG,
        );
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isRequesting = false;
        _errorMessage =
            '${'permission_gate.error_requesting'.tr()}: ${e.toString()}';
      });
      ToastUtil.showToast(context, 'permission_gate.generic_error'.tr());
    }
  }

  Future<void> _handleOpenSettings() async {
    try {
      await openAppSettings();
      await _checkInitialPermissionStatus();
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessage =
            '${'permission_gate.error_opening_settings'.tr()}: ${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'permission_gate.permissions'.tr().toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'permission_gate.explanation'.tr(),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              if (_errorMessage != null) ...[
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.errorContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _errorMessage!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onErrorContainer,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),
              ],
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
                onPressed: _isRequesting
                    ? null
                    : () {
                        if (_isPermanentlyDenied) {
                          _handleOpenSettings();
                        } else {
                          _handlePermissionRequest();
                        }
                      },
                child: _isRequesting
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(
                        _isPermanentlyDenied
                            ? 'permission_gate.open_settings'.tr()
                            : 'permission_gate.retry'.tr(),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
