package com.github.wvq.ppisize

import android.content.Context
import android.util.DisplayMetrics
import android.view.WindowManager
import com.facebook.react.bridge.Arguments
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.WritableMap
import com.facebook.react.module.annotations.ReactModule

@ReactModule(name = PpiSizeModule.NAME)
class PpiSizeModule(reactContext: ReactApplicationContext) :
  NativePpiSizeSpec(reactContext) {

  override fun getName(): String {
    return NAME
  }

  override fun getDisplayMetrics(): WritableMap {
    val result = Arguments.createMap()

    val windowManager = reactApplicationContext.getSystemService(Context.WINDOW_SERVICE) as WindowManager

    val displayMetrics = DisplayMetrics()
    @Suppress("deprecation")
    windowManager.defaultDisplay.getMetrics(displayMetrics)

    result.putString("brand", android.os.Build.BRAND)
    result.putString("device_model", android.os.Build.MODEL)
    result.putInt("width", displayMetrics.widthPixels)
    result.putInt("height", displayMetrics.heightPixels)
    result.putInt("ppi", displayMetrics.densityDpi)
    result.putDouble("x_ppi", displayMetrics.xdpi.toDouble())
    result.putDouble("y_ppi", displayMetrics.ydpi.toDouble())

    return result
  }

  companion object {
    const val NAME = "PpiSize"
  }
}
