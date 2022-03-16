# futurama_thrive

A new Flutter project for Thrive test challenge

### Actions
This project has a CI pipeline implemented for each push for branches master, develop and release.

The main branch is the `develop`

The APK can be found at https://github.com/tairoroberto/FuturamaThrive/actions inside the build
`release-apk` and
`release-appbundle` these files expire in 2 days to not oversize the CI.

This is a simple app that uses some libs to improve development.

`Retrofit` (Same way that Android request with interface)

`get_it` (Dependency Injection)

`sizer` (Keep the same size on many devices)

###To run
Just run `flutter pub get` and install `flutter build apk`

If you have any questions or suggestions, please let me know :)