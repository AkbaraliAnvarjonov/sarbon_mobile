package uz.sarbon.mobile

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import com.yandex.mapkit.MapKitFactory
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        super.configureFlutterEngine(flutterEngine)
    }
}


