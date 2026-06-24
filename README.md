# USB Switcher

A Flutter application that easily enables/disables USB Debugging on Android devices.

## Features

- **Enable/Disable USB Debugging** directly from the application
- **Optimized interface** with automatic light/dark mode
- **Detailed status notifications**
- **Automatic refresh** when returning to the app
- **Multi-platform support** (Android, iOS)

## System Requirements

- Flutter 3.12.2 or higher
- Android SDK 21 or higher
- iOS 12.0 or higher

## Installation

### Prerequisites before installation

1. **Enable USB Debugging** on your Android device:
   - Go to `Settings` → `About phone`
   - Tap `Build number` 7 times consecutively
   - Return and select `Developer options`
   - Enable `USB Debugging`

2. **Connect device** to computer via USB

### Installation from source code

```bash
# Clone repository
git clone https://github.com/hieu555x/usbswitcher.git
cd usbswitcher

# Install dependencies
flutter pub get

# Run application
flutter run
```

## How to Use

### Main Interface

1. **USB Debugging Status**:
   - Green circle: USB Debugging is ON
   - Gray circle: USB Debugging is OFF
   - USB icon: Shows current status

2. **Controls**:
   - Tap the toggle button to enable/disable USB Debugging
   - Use the refresh button (↻ icon) to update status

3. **Light/Dark Mode**:
   - Tap the sun icon (☀️) to switch between light and dark modes
   - Application automatically switches according to system mode

### Main Functions

- **Enable USB Debugging**: When you tap the toggle button, the application will request permissions and enable the feature
- **Disable USB Debugging**: When you tap the toggle button, the application will disable the feature
- **Refresh Status**: When you press the refresh button, the application will check the current USB Debugging status

## Permissions and Security

### Required Permissions

- **USB Access Permission**: To control USB Debugging
- **Development Permission**: To change system settings

### Security Warnings

- The application requires special permissions to function
- This feature should only be used on your own device
- Do not install on uncontrolled devices

## Troubleshooting and Common Issues

### Connection Problems

1. **"Cannot connect device"**:
   - Check USB connection
   - Ensure USB Debugging is enabled on the device
   - Reinstall USB drivers

2. **"Permission denied"**:
   - Make sure you have enabled USB Debugging on the device
   - Check application permissions in system settings

3. **"Cannot change status"**:
   - Check Android version of your device
   - Ensure the application has sufficient access permissions

## Maintenance and Updates

### Updating to New Version

```bash
git pull origin main
flutter pub get
```

### Reporting Issues

If you encounter any issues, please create an issue on GitHub with:
- Detailed description of the problem
- Your Flutter version
- Your Android version
- Steps to reproduce the issue

## Contributing

We welcome contributions from the community:

1. Fork the repository
2. Create a new branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact Information

- GitHub: [https://github.com/hieu555x/usbswitcher](https://github.com/hieu555x/usbswitcher)
- Email: hieu555x@gmail.com

---

*© 2026 USB Switcher. All rights reserved.*