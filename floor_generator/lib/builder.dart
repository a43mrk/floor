import 'dart:async';

import 'package:build/build.dart';
import 'package:floor_generator/generator.dart';
import 'package:source_gen/source_gen.dart';

/// This triggers the code generation process.
///
/// Use 'flutter packages pub run build_runner build' to start code generation.
///
/// Use 'flutter packages pub run build_runner watch' to trigger
/// code generation on changes.
Builder floorBuilder(final BuilderOptions _) =>
    SharedPartBuilder([FloorGenerator()], 'floor');

// Builder copyBuilder() => CopyBuilder();

// class CopyBuilder implements Builder {
//   @override
//   FutureOr<void> build(BuildStep buildStep) async {
//     // Retrieve the currently matched asset(file)
//     AssetId assetId = buildStep.inputId;

//     // Create a new target AssetId based on the current one
//     var copyAssetId = assetId.changeExtension('.g.dart');
//     var contents = await buildStep.readAsString(assetId);

//     // write out the new asset
//     await buildStep.writeAsString(copyAssetId, contents);
//   }

//   @override
//   // lookin file: final file.
//   Map<String, List<String>> get buildExtensions => {'.dart': ['.g.dart']};
// }