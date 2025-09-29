import java.util.Properties

plugins {
    id("com.android.library")
    id("org.jetbrains.kotlin.android")
}

val localProperties = Properties()
val localPropertiesFile = rootProject.file("local.properties")
if (localPropertiesFile.exists()) {
    localPropertiesFile.reader(Charsets.UTF_8).use { localProperties.load(it) }
}
//获取FlutterSdk的路径
val flutterSdkPath = localProperties.getProperty("flutter.sdk")
    ?: throw GradleException("Flutter SDK not found. Please define 'flutter.sdk' in local.properties")

android {
    namespace = "org.devio.flutter.plugin.asr"
    compileSdk = 34

    defaultConfig {
        minSdk = 21

        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
        consumerProguardFiles("consumer-rules.pro")
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }
    kotlinOptions {
        jvmTarget = "11"
    }
}

dependencies {
    implementation(files("libs/bdasr_V3_20180801_d6f298a.jar"))
    implementation("androidx.core:core-ktx:1.12.0")
    implementation("androidx.appcompat:appcompat:1.6.1")
    implementation("com.google.android.material:material:1.9.0")
    testImplementation("junit:junit:4.13.2")
    androidTestImplementation("androidx.test.ext:junit:1.3.0")
    androidTestImplementation("androidx.test.espresso:espresso-core:3.7.0")

    /**
     *用 compileOnly（而不是 implementation）
     * 好处：只在编译时依赖 Flutter API，不会把 flutter.jar 打进 AAR，避免和 :app 里的 Flutter 依赖冲突。
     * 在 :app 里仍然用：
     * plugins {
     *     id("dev.flutter.flutter-gradle-plugin")
     * }
     * flutter {
     *     source = "../.."
     * }
     * Flutter Gradle 插件会自动把 Flutter engine 的依赖引入到最终 APK，这样 :asr_plugin 里的 Flutter API 就能运行。
     */
    // Flutter SDK jar（Library Module 必须手动 compileOnly(files(...flutter.jar)) 才能访问 Flutter API）
    compileOnly(files("$flutterSdkPath/bin/cache/artifacts/engine/android-arm64-release/flutter.jar"))
}
