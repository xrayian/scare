import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:just_audio/just_audio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'firebase_options.dart';
import 'package:clear_all_notifications/clear_all_notifications.dart';

import 'package:device_info/device_info.dart';

Future<String> getDeviceName() async {
  AndroidDeviceInfo deviceInfo = await DeviceInfoPlugin().androidInfo;
  String? brand = deviceInfo.brand;
  String? model = deviceInfo.model;
  String? name = deviceInfo.manufacturer;

  return '$brand $model $name';
}

Future<void> initClearNotificationsState() async {
  ClearAllNotifications.clear();
}

//@pragma annotation is used to specify the entry point of the application
//This is required for the background message handler to work
//This stops the compiler from removing the function as it is not directly called in the code

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  final AudioPlayer player = AudioPlayer();
  await initClearNotificationsState();
  if (message.data.containsKey('fileUrl')) {
    var src = AudioSource.uri(
      Uri.parse(message.data['fileUrl']),
      tag: const MediaItem(
        id: '0',
        album: "#",
        title: "#",
      ),
    );
    await player.setAudioSource(src);
    player.play();
  }
  print('Handling a background message: ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await JustAudioBackground.init(
  //   androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
  //   androidNotificationChannelName: 'Audio playback',
  //   androidNotificationOngoing: true,
  // );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final notificationSettings =
      await FirebaseMessaging.instance.requestPermission(provisional: true);

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  final fcmToken = await FirebaseMessaging.instance.getToken();

  Dio dio = Dio();
  dio.post('https://scare-web.onrender.com/register', data: {
    'fcmToken': fcmToken,
    'deviceName': await getDeviceName(),
    'platform': 'android'
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MediaPlayer(),
    );
  }
}

final AudioPlayer _audioPlayer = AudioPlayer();

Future<void> playMedia(String url) async {
  var src = AudioSource.uri(
    Uri.parse(url),
    tag: const MediaItem(
      id: '0',
      album: "#",
      title: "#",
    ),
  );
  await _audioPlayer.setAudioSource(src);
  await _audioPlayer.play();
}

class MediaPlayer extends StatefulWidget {
  const MediaPlayer({super.key});

  @override
  _MediaPlayerState createState() => _MediaPlayerState();
}

class _MediaPlayerState extends State<MediaPlayer> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();

    FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
      if (message.data.containsKey('fileUrl')) {
        print(">>>>>>>>>>>>>>>>>>>>>>>>>>>...Playing bg media");
        playMedia(message.data['fileUrl']);
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.data.containsKey('fileUrl')) {
        print(">>>>>>>>>>>>>>>>>>>>>>>>>>>...Playing media");
        playMedia(message.data['fileUrl']);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("This will automatically update please don't uninstall"),
      ),
    );
  }
}
