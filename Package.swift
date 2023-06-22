// swift-tools-version: 5.8
import PackageDescription

let package = Package(
  name: "jsr",
  products: [
    .library(name: "ImageIntermedia", targets: ["ImageIntermedia"]),
  ],
  targets: [
    .target(
      name: "ImageIntermedia"
    ),
    .testTarget(
      name: "ImageIntermediaTests",
      dependencies: ["ImageIntermedia"]
    ),
  ]
)
