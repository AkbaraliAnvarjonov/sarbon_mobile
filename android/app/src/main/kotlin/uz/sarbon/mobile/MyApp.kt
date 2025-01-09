package uz.sarbon.mobile

import android.app.Application
import com.yandex.mapkit.MapKitFactory

class MyApp : Application() {
    override fun onCreate() {
        super.onCreate()
        MapKitFactory.setLocale("ru_RU");
        MapKitFactory.setApiKey("15ec72ea-b4d0-4923-b3a6-3d4735e40a34")
    }
}