// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DependencyParser",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "DependencyParser",
            targets: ["DependencyParser"]),
    ],
    dependencies: [
        .package(name: "MorphologicalAnalysis", url: "https://github.com/StarlangSoftware/TurkishMorphologicalAnalysis-Swift.git", .exact("1.0.3")),    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "DependencyParser",
            dependencies: ["MorphologicalAnalysis"],
            resources: [.process("metu-treebank.xml"),.process("tr_boun-ud-dev.conllu"),.process("tr_boun-ud-test.conllu"),.process("tr_boun-ud-train.conllu"),.process("tr_gb-ud-test.conllu"),.process("tr_imst-ud-dev.conllu"),.process("tr_imst-ud-test.conllu"),.process("tr_imst-ud-train.conllu"),.process("tr_pud-ud-test.conllu"),.process("tr_atis-ud-test.conllu"),.process("tr_atis-ud-dev.conllu"),.process("tr_atis-ud-train.conllu"),.process("tr_framenet-ud-test.conllu"),.process("tr_framenet-ud-dev.conllu"),.process("tr_framenet-ud-train.conllu"),.process("tr_kenet-ud-test.conllu"),.process("tr_kenet-ud-dev.conllu"),.process("tr_kenet-ud-train.conllu"),.process("tr_penn-ud-test.conllu"),.process("tr_penn-ud-dev.conllu"),.process("tr_penn-ud-train.conllu"),.process("tr_tourism-ud-test.conllu"),.process("tr_tourism-ud-dev.conllu"),.process("tr_tourism-ud-train.conllu"),.process("en_atis-ud-test.conllu"),.process("en_atis-ud-dev.conllu"),.process("en_atis-ud-train.conllu")]),
        .testTarget(
            name: "DependencyParserTests",
            dependencies: ["DependencyParser"]),
    ]
)
