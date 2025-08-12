// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "UIImagePDF",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "UIImagePDF", targets: ["UIImagePDF"])
    ],
    targets: [
        .target(
            name: "UIImagePDF",
            path: "UIImage+PDF",
            publicHeadersPath: ".",
            cSettings: [.headerSearchPath("."), .define("PDFView", to: "UIImagePDFView")]
        )
    ]
)
