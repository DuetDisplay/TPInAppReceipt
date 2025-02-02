// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TPInAppReceipt",
	platforms: [.macOS(.v10_12),
				.iOS(.v10),
				.tvOS(.v10),
				.watchOS("6.2")],
	
    products: [
        .library(name: "TPInAppReceipt", targets: ["TPInAppReceipt"]),
		.library(name: "TPInAppReceipt-Objc", targets: ["TPInAppReceipt-Objc"]),
    ],
	dependencies: [
		.package(url: "https://github.com/DuetDisplay/ASN1Swift", .upToNextMajor(from: "1.2.5"))
	],
    targets: [
        .target(
            name: "TPInAppReceipt",
			dependencies: ["ASN1Swift"],
			path: "Sources",
			exclude: ["Bundle+Private.swift", "Objc/InAppReceipt+Objc.swift"],
			resources: [.process("AppleIncRootCertificate.cer"), .process("StoreKitTestCertificate.cer")]
		),
		.target(
			name: "TPInAppReceipt-Objc",
			dependencies: ["TPInAppReceipt"],
			path: "Sources/Objc"
		),
		.testTarget(
			name: "TPInAppReceiptTests",
			dependencies: ["TPInAppReceipt"])
	],
	swiftLanguageVersions: [.v5]
)

    
