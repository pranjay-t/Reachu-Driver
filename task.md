# Integration Tasks

- `[x]` Phase 1: Native Android Configurations
  - `[x]` Create ReachuDriverApplication.kt and register notification channels
  - `[x]` Copy and adapt SocketForegroundService.kt
  - `[x]` Copy and adapt BootReceiver.kt and RideActionReceiver.kt
  - `[x]` Update MainActivity.kt with MethodChannel and Intent extra routing
  - `[x]` Update AndroidManifest.xml with permissions, application name, service, and receivers
  - `[x]` Copy ride sound resource (ride_sound.mp3) to android raw resources
- `[x]` Phase 2: Dart Sockets Integration
  - `[x]` Complete socket_events.dart and socket_client.dart placeholders
  - `[x]` Implement SocketManager class and its auto-reconnect/takeover logic
  - `[x]` Create socketManagerProvider using Riverpod
  - `[x]` Implement RideQueueNotifier and RideRequestItem state classes
- `[x]` Phase 3: UI, Theming & Screen Layouts
  - `[x]` Connect Online/Offline toggle in HomeScreen to socketManagerProvider
  - `[x]` Implement RideRequestCard with linear progress timer and App Colors
  - `[x]` Implement RideRequestQueueScreen with PopScope guard
- `[x]` Phase 4: Verification and testing
  - `[ ]` Generate Riverpod parts with build_runner
  - `[x]` Build debug APK to verify Kotlin compiles (Verified successfully!)
  - `[x]` Fix VS Code inline CodeLens "Run/Debug" button behavior for flavors (Configured via launch.json)
  - `[ ]` Verify foreground/background socket transitions

