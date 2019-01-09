package com.uofmeme;

import android.app.Application;

import com.facebook.react.ReactApplication;
<<<<<<< HEAD
import com.oblador.vectoricons.VectorIconsPackage;
=======
import com.lugg.ReactNativeConfig.ReactNativeConfigPackage;
>>>>>>> f4aa6e02d584ffeef09c43db55fc7cae99d68dcf
import com.swmansion.gesturehandler.react.RNGestureHandlerPackage;
import com.facebook.react.ReactNativeHost;
import com.facebook.react.ReactPackage;
import com.facebook.react.shell.MainReactPackage;
import com.facebook.soloader.SoLoader;

import java.util.Arrays;
import java.util.List;

public class MainApplication extends Application implements ReactApplication {

  private final ReactNativeHost mReactNativeHost = new ReactNativeHost(this) {
    @Override
    public boolean getUseDeveloperSupport() {
      return BuildConfig.DEBUG;
    }

    @Override
    protected List<ReactPackage> getPackages() {
      return Arrays.<ReactPackage>asList(
          new MainReactPackage(),
<<<<<<< HEAD
            new VectorIconsPackage(),
=======
            new ReactNativeConfigPackage(),
>>>>>>> f4aa6e02d584ffeef09c43db55fc7cae99d68dcf
            new RNGestureHandlerPackage()
      );
    }

    @Override
    protected String getJSMainModuleName() {
      return "index";
    }
  };

  @Override
  public ReactNativeHost getReactNativeHost() {
    return mReactNativeHost;
  }

  @Override
  public void onCreate() {
    super.onCreate();
    SoLoader.init(this, /* native exopackage */ false);
  }
}
