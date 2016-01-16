[<img align="left" src="https://cloud.githubusercontent.com/assets/3276768/12372702/4009df9c-bc9b-11e5-830e-f079686e11f3.png" hspace="20">](#logo)


## Color
Swift package to manage AINSI color on terminal

<br/>
#Installation
Put this line in your **Package.swift**:
```Swift
import PackageDescription

let package = Package(
  name: "testColor",
  targets: [],
  dependencies: [
  .Package(url: "https://github.com/remirobert/Color.git",
  majorVersion: 1),
  ]
)
```

#How to use
```Swift
print("hello world" + Color.red)
print("hello world".addColor(Color.red))

//Chaining colors
print("hello world" + Color.black + Background.white + Style.bold)
```
