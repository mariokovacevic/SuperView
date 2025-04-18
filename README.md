<p align="center">
	<a href="https://cocoapods.org/pods/SuperView">
		<img src="https://img.shields.io/cocoapods/v/SuperView.svg" alt="CocoaPods Compatible">
	</a>
	<a href="https://twitter.com/brommko">
		<img src="https://img.shields.io/badge/twitter-@brommko-blue.svg?style=flat" alt="Twitter">
	</a>
  <a href="https://developer.apple.com/swift/">
    <img src="https://img.shields.io/badge/Swift-4.2-orange.svg?style=flat" alt="Swift 4.2">
  </a>
</p>

# About SuperView SDK for iOS

This is an iOS project that allows you to wrap your website in a super simple iOS app. If you are a web developer who wants to release an iOS app, this should help you cut some corners when it comes to learning iOS development. It is ideal for single page web apps. SuperView comes with all the features that of a desktop browser like managing history, cookies, HTML5 support and lot more. Using SuperView you can build very cool apps like integrating HTML5 games in the app, interactive page, web based slideshow etc.

## Features

* **In-app purchase** – In-app purchases are extra content or subscriptions that you can buy in apps on your iOS device or computer. Our webview app supports in-app purchase for for removing AdMob ads from the app. Everything you need to do is to create an in-app purchase item and copy and paste the item id in the “SuperView.plist” file in the project folder. If you don’t want In App Purchase in your app, simply remove key and string tags. Because you are planning to make money using our app, don’t forget to purchase the Extended Licence of our app.
*  **AdMob** – Monetize your App with AdMob interstital and banner ads. AdMob is used and trusted by more app developers than any other ad platform worldwide. Use in-app advertising to show ads from millions of Google advertisers and access programmatic demand, or use AdMob Mediation to earn from 40+ networks.
* **OneSignal** – OneSignal is a high volume and reliable push notification system for mobile and web applications. OneSignal provides a single UI and API to deliver messages across iOS and Android.
* **Deep Linking** – A deep link is a URL that opens and directs a user to a specific location within an app. This app has deep linking integrated in the project. Directs the user to any web site you want.
* **Social Login** – Our webview app has ability to login and signup with social networks like Facebook, Google, LinkedIn and similar.
* **HTML5 videos** – Our app supports HTML5 videos. In modern browsers, adding a video to your page is as easy as adding an image. No longer do you need to deal with special plug-ins or require crazy markup, you can do it with a single element. Our webview app will recognize the video and play it in full screen
* **Loading indicator** – Good loading indicators always give some type of immediate feedback. They notify users that the app needs more time to process the user action.
* **Progress indicator** – Good progress indicators always give some type of immediate feedback. They notify users that the app needs more time to process the user action, and tell (approximately) how much time it will take.
* **Easy to use** – Our app is super simple and easy to customize, you just need to replace the existing URL with you own and your webview app is ready.
* **No coding skills required** – You don’t have to be a developer to know how to use our app, it is supper simple. There is also a quick guide video below that will show you how to setup your awesome webview app.
* **Toolbar** – We created a nice toolbar with few buttons your customers can use. We implemented back, forward and refresh buttons for working with your website. There is also a button for removing ads if your app has ads. Don’t worry, if your app doesn’t have in-app purchase, the button is not visible. Also if you don’t need the toolbar, just set “Toolbar” to “NO” in the config file we created for easy setup of the app.
* **Local Site Content** – If you have a local website, add your webisete in www folder located in the app and make sure that you have index.html file for website to work. This is perfect for web based mobile aplications like Ionic.
* **Rate my app**
* **WKWebView** – WKWebView is used in our app. It is the centerpiece of the modern WebKit API introduced in iOS 8 & OS X Yosemite. It replaces UIWebView in UIKit and WebView in AppKit, offering a consistent API across the two platforms.
* **Geolocation** – Geolocation is the identification of the real-world geographic location of an object, such as a radar source, mobile phone or Internet-connected computer terminal. To use geolocation in our app, make sure your website supports https or this feature will not work. Our app has granted permission for location services.
* **JS Bridge** – create local notification, rate my app, hide native loader, show native loader, check if user purchased the item and removed the ads, get OneSignal Player ID, make in-app purchase to remove ads

## Installation
### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate SuperView into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod "SuperView/Core", :git => 'https://github.com/brommko/SuperView.git', :tag => '1.4.0'
pod "SuperView/OneSignal", :git => 'https://github.com/brommko/SuperView.git', :tag => '1.4.0'
pod "SuperView/AdMob", :git => 'https://github.com/brommko/SuperView.git', :tag => '1.4.0'
pod "SuperView/Firebase", :git => 'https://github.com/brommko/SuperView.git', :tag => '1.4.0'
pod "SuperView/QR", :git => 'https://github.com/brommko/SuperView.git', :tag => '1.4.0'
pod "SuperView/Location", :git => 'https://github.com/brommko/SuperView.git', :tag => '1.4.0'
```
Use SHIFT + CMD + K if you have an error with building.

## License Terms

Make sure you have a commercial license before releasing your app.

## Support and License

Use our [Envato profile page](https://codecanyon.net/user/brommkollc) for bug reports or support requests. To purchase a commercial license, please visit [Envato market](https://codecanyon.net/item/universal-webview-ios-app-push-notification-swift-admob-inapp-purchase/17383449).
