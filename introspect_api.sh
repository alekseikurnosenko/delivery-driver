openapi-generator generate -i http://enigmatic-garden-23553.herokuapp.com/v3/api-docs -g dart-dio -o openapi --global-property supportingFiles,apis,apiDocs=false,apiTests=false,models,modelDocs=false,modelTests=false
flutter pub run build_runner build
flutter pub get