
# Introduction

Apart from the basic architecture setup, this sample also demonstrates using Getx

## What is GetX?
GetX is a lightweight and powerful solution for Flutter. The solution combines high-speed state management with intelligent dependency injection, as well as route management.

## Why choose GetX?
If Flutter is already a framework then why should you choose a micro-framework(GetX) for cross-app development in Flutter? So here are some benefits that GetX is providing.


## Dependency Management

GetX provides a smart way to manage dependencies in your Flutter application like the view controllers. GetX will remove any controller not being used at the moment from memory automatically


* Project folder structure.
* Easy Route Navigation using Getx.
* Easy user data store in local using Get Storage.
* It makes data transfer between the classes easier.
* Easy api calling using Dio.

# Dependencies

These are common dependencies that makes architecture flow easier.

* [dio](https://pub.dev/packages/dio) : http client
* [get](https://pub.dev/packages/get) : state management
* [connectivity_plus](https://pub.dev/packages/connectivity_plus) : checking the network connection
* [shimmer](https://pub.dev/packages/shimmer) : animation while API loading
* [cached_network_image](https://pub.dev/packages/cached_network_image) : store network image in cache
* [flutter_svg](https://pub.dev/packages/flutter_svg) : showing svg images
* [get_storage](https://pub.dev/packages/get_storage) : local data store

# Package structure

* Using modular architecture to architect the app per feature to be easier and more readable and isolate the feature from each other

<p align="center">
  <img src="https://github.com/MoonTechnolabs/Flutter-Code-Standard-Demo/blob/main/image/Project%20Structure.png" />
</p>


## What is Controller?
* The GetxController class takes care of all your logic and makes your fields observable.
<p align="center">
  <img src="https://github.com/MoonTechnolabs/Flutter-Code-Standard-Demo/blob/main/image/Controller.png" />
</p>


## What is Binding?
* Bindings can be used to initialize your controllers, repositories, APIs, and whatever else you need without having to call them directly from the view page.
<p align="center">
  <img src="https://github.com/MoonTechnolabs/Flutter-Code-Standard-Demo/blob/main/image/Binding.png" />
</p>

## What is GetView?
* GetView uses Stateless widget internally so here is we can use Stateless or GetView. But benefit of using GetView is quickly access your Controller without having to call Get.find<AwesomeController>() yourself.
  <p align="center">
  <img src="https://github.com/MoonTechnolabs/Flutter-Code-Standard-Demo/blob/main/image/GetView.png" />
</p>

## What is AppRoutes?
* In GetX before navigating from one screen to another we require routes. So let's create routes.
  <p align="center">
  <img src="https://github.com/MoonTechnolabs/Flutter-Code-Standard-Demo/blob/main/image/AppRoutes.png" />
</p>

## Whta is NetworkInterceptor?
* Interceptors are a powerful mechanism that can monitor, rewrite, and retry calls. Here’s a simple interceptor that logs the outgoing request and the incoming response.
  <p align="center">
  <img src="https://github.com/MoonTechnolabs/Flutter-Code-Standard-Demo/blob/main/image/NetworkInterceptor.png" />
</p>

