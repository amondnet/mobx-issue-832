## This repository contains flutters Apps

- Questionaire App, its a simple quiz app, and gives you personality points at the end of quiz


### Doing migration from flutter 1.o to 2.o
- Follow commit [here](https://github.com/Dalakoti07/learning-flutter/commit/afe77e117cf2d4229ba6d2f73f8a8b7437a7fa93)
  - Update compileSdkVersion
  - Update manifest file, 
  - Increase kotlin version 
  - Update distribution url in gradle-wrapper.properties
- Then at last update dependencies using flutter command
`
flutter pub upgrade

flutter pub outdated

`

