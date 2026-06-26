import 'package:flutter/material.dart' hide ErrorWidget;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usbswitcher/bloc/theme/theme_bloc.dart';
import 'package:usbswitcher/bloc/theme/theme_event.dart';
import 'package:usbswitcher/bloc/theme/theme_state.dart';
import 'package:usbswitcher/screens/usb_debugger_screen.dart';
import 'package:usbswitcher/widgets/error_widget.dart';
import 'package:usbswitcher/widgets/permission_denied_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  static const _channel = MethodChannel('usb_debug_channel');

  bool _isEnabled = false;
  bool _hasPermission = true;
  bool _loading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeUsbStatus();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _refreshStatus();
    }
  }

  Future<void> _refreshStatus() async {
    setState(() {
      _loading = true;
      _errorMessage = null;
    });
    try {
      final bool enabled = await _channel.invokeMethod('getAdbStatus');
      setState(() {
        _isEnabled = enabled;
        _hasPermission = true;
        _loading = false;
      });
    } on PlatformException catch (e) {
      setState(() {
        _loading = false;
        if (e.code == 'PERMISSION_DENIED') {
          _hasPermission = false;
        } else {
          _errorMessage = e.message ?? 'Đã có lỗi xảy ra';
        }
      });
    }
  }

  Future<void> _initializeUsbStatus() async {
    // Get USB debugging status when app starts
    try {
      final bool enabled = await _channel.invokeMethod('getAdbStatus');
      setState(() {
        _isEnabled = enabled;
        _hasPermission = true;
        _loading = false;
      });

      // Update theme state with USB status for initial app launch
      context.read<ThemeBloc>().add(UsbStatusChanged(enabled));
    } on PlatformException catch (e) {
      setState(() {
        _loading = false;
        if (e.code == 'PERMISSION_DENIED') {
          _hasPermission = false;
        } else {
          _errorMessage = e.message ?? 'Đã có lỗi xảy ra';
        }
      });
    }
  }

  Future<void> _toggle(bool newValue) async {
    setState(() => _loading = true);
    try {
      await _channel.invokeMethod('setAdbEnabled', {'enabled': newValue});
      setState(() {
        _isEnabled = newValue;
        _hasPermission = true;
        _loading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: newValue ? Colors.green[700] : Colors.grey[800],
            content: Text(
              newValue ? '✅ Usb Debugging is ON' : '⛔  Usb Debugging is OFF',
              style: TextStyle(color: Colors.white),  
            ),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } on PlatformException catch (e) {
      setState(() => _loading = false);
      if (e.code == 'PERMISSION_DENIED') {
        setState(() => _hasPermission = false);
      } else {
        setState(() => _errorMessage = e.message ?? 'Đã có lỗi xảy ra');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Icon(Icons.usb_sharp, size: 32),
                Text(
                  "USB DEBUGGER",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            centerTitle: false,
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: _loading ? null : _refreshStatus,
                tooltip: 'Làm mới trạng thái',
              ),
              IconButton(
                onPressed: () {
                  context.read<ThemeBloc>().add(ThemeToggle());
                },
                icon: Icon(
                  themeData.brightness == Brightness.dark
                      ? Icons.sunny
                      : Icons.dark_mode,
                ),
              ),
            ],
            elevation: 0,
            toolbarHeight: 60,
          ),
          body: _loading
              ? const CircularProgressIndicator()
              : !_hasPermission
              ? PermissionDeniedWidget(
                  onRefresh: _refreshStatus,
                  isLoading: _loading,
                )
              : _errorMessage != null
              ? ErrorWidget(
                  errorMessage: _errorMessage,
                  onRefresh: _refreshStatus,
                  isLoading: _loading,
                )
              : UsbDebuggerScreen(
                  isEnabled: _isEnabled,
                  onToggle: _toggle,
                  isLoading: _loading,
                ),
        );
      },
    );
  }
}
