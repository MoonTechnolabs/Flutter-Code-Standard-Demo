
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
  <img src="https://camo.githubusercontent.com/a5485a38e6af7aa1055807a47e1833fc9a35eb7b997940b26936dcffae760623/68747470733a2f2f6d69726f2e6d656469756d2e636f6d2f6d61782f3737322f302a73664344456235373157442d374566502e6a7067" />
</p>


## What about Controller
The GetxController class takes care of all your logic and makes your fields observable.

## Waht about Binding
Bindings can be used to initialize your controllers, repositories, APIs, and whatever else you need without having to call them directly from the view page.




