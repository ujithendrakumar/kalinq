# --- Razorpay SDK ---
-keep class com.razorpay.** { *; }
-keep interface com.razorpay.** { *; }
-dontwarn proguard.annotation.**
-dontwarn proguard.annotation.Keep
-dontwarn proguard.annotation.KeepClassMembers
-keepattributes *Annotation*

# --- Flutter & plugins ---
-keep class io.flutter.** { *; }
-dontwarn io.flutter.embedding.**

# --- Google Pay (Paisa API) ---
-dontwarn com.google.android.apps.nbu.paisa.inapp.client.api.PaymentsClient
-dontwarn com.google.android.apps.nbu.paisa.inapp.client.api.Wallet
-dontwarn com.google.android.apps.nbu.paisa.inapp.client.api.WalletUtils
