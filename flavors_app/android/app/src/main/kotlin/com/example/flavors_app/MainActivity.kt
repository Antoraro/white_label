package com.example.flavors_app

import androidx.annotation.NonNull
import com.example.flavors_app.BuildConfig.FLAVOR
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

private const val kChannel = "flavor"
private const val kMethodFlavor = "getFlavor"

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);

        // Method channel
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, kChannel)
            .setMethodCallHandler { call, result ->
                if (call.method == kMethodFlavor) {
                    result.success(FLAVOR);
                } else {
                    result.notImplemented()
                }
            }
    }
}
