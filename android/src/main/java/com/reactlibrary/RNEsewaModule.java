
package com.reactlibrary;

import com.facebook.react.bridge.ActivityEventListener;
import com.facebook.react.bridge.BaseActivityEventListener;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.WritableMap;


import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import com.esewa.android.sdk.payment.ESewaConfiguration;
import com.esewa.android.sdk.payment.ESewaPayment;
import com.esewa.android.sdk.payment.ESewaPaymentActivity;


public class RNEsewaModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;
  private static final int REQUEST_CODE_PAYMENT = 1;
  private ESewaConfiguration eSewaConfiguration;

  private Promise mEsewaPromise;

  public RNEsewaModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
    reactContext.addActivityEventListener(mActivityEventListener);
  }

  @Override
  public String getName() {
    return "RNEsewa";
  }

    @ReactMethod
    public void init(String MERCHANT_ID, String MERCHANT_SECRET_KEY, String ENVIRONMENT, Promise promise) {
        Log.d("Merchant Id", MERCHANT_ID);
        Log.d("Merchant key", MERCHANT_SECRET_KEY);
        String prod = "production";
        if(ENVIRONMENT.equals(prod)){
          eSewaConfiguration = new ESewaConfiguration()
                .clientId(MERCHANT_ID)
                .secretKey(MERCHANT_SECRET_KEY)
                .environment(ESewaConfiguration.ENVIRONMENT_PRODUCTION);
        } else {
          eSewaConfiguration = new ESewaConfiguration()
                .clientId(MERCHANT_ID)
                .secretKey(MERCHANT_SECRET_KEY)
                .environment(ESewaConfiguration.ENVIRONMENT_TEST);
        }
        WritableMap map = Arguments.createMap();
        promise.resolve(map);
    }


    @ReactMethod
    public void makePayment(String amount, String productName, String productID, String callbackURL, Promise promise) {
      mEsewaPromise = promise;
      Activity currentActivity = getCurrentActivity();

        if (currentActivity == null) {
            promise.reject("Activity doesn't exist");
            return;
        }

        ESewaPayment eSewaPayment = new ESewaPayment(amount, productName, productID, callbackURL);
        Intent intent = new Intent(currentActivity.getBaseContext(), ESewaPaymentActivity.class);
        intent.putExtra(ESewaConfiguration.ESEWA_CONFIGURATION, eSewaConfiguration);
        intent.putExtra(ESewaPayment.ESEWA_PAYMENT, eSewaPayment);
        currentActivity.startActivityForResult(intent, REQUEST_CODE_PAYMENT);
    }

    private final ActivityEventListener mActivityEventListener = new BaseActivityEventListener() {
      @Override
      public void onActivityResult(Activity activity, int requestCode, int resultCode, Intent data) {
        if (requestCode == 1) {
          if (mEsewaPromise != null) {
            if (resultCode == Activity.RESULT_CANCELED) {
              mEsewaPromise.reject("PAYMENT_ERROR", "Payment was unsuccessful");
            } else if (resultCode == Activity.RESULT_OK) {
              String result = data.getStringExtra(ESewaPayment.EXTRA_RESULT_MESSAGE);
              Bundle bundle = data.getExtras();

              WritableMap map = Arguments.createMap();
              map.putString("response", result);
             
              mEsewaPromise.resolve(map);
            } else if(resultCode == ESewaPayment.RESULT_EXTRAS_INVALID){
              String s = data.getStringExtra(ESewaPayment.EXTRA_RESULT_MESSAGE);
              mEsewaPromise.reject("PAYMENT_ERROR", s);
            }

            mEsewaPromise = null;
          }
        }
      }
  };
}