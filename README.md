# Veris

This work was supported by the Engineering and Physical Sciences Research Council (grant number EP/T022566/1).  DIGIT Lab is a Next Stage Digital Economy Centre.

Veris is an Open Source smartphone application framework that was originally built for the DIGIT.ac.uk project under EPSRC funding in the UK. Its underlying principle is one of protocol-based deployment, whereby a simple JSON-based, human-readable file is read by the application when onboarding a user, which contains information as to what elements the app should display, from questionnaires to data-gathering tasks to content. In this way, a scientist, clinician or designer can build and prototype an app to carry out user research by simply building a protocol file without any programming. It is currently being used in cognitive neuroscience projects in the diagnostics of disorder generally, and within the National Health System in the United Kingdom, for experimental digital biomarker design in autism diagnostics.

Please write to david.plans@rhul.ac.uk if you'd like to be on the waiting list to use Veris or any of its current tools.

## Getting Started

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Run project from the command line:
`$ flutter pub get`
`$ flutter run`

## Assets

The `assets` directory houses images, fonts, and any other files you want to
include with your application.

The `assets/images` directory contains [resolution-aware images]
The `assets/sounds` directory contains [sounds]
The `assets/videos` directory contains [videos]
(https://flutter.dev/docs/development/ui/assets-and-images#resolution-aware).

## Localization

This project generates localized messages based on arb files found in
the `lib/src/localization` directory.

To support additional languages, please visit the tutorial on
[Internationalizing Flutter
apps](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)

## Get data from Firebase
0. Install nodejs.
1. Go to `data-tool` folder 
   `$ cd data-tool`
2. Install packages:
   `$ npm install`
3. Run getting data:
   `$ node index.js id=STUDY_ID` (for example: `node index.js id=TEQNECK`)
