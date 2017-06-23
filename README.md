## Set iOS Info.plist Values (unified) ([BITRISE](https://www.bitrise.io))

Sets various values in the target Info.plist file for the next build.

### How to use this Step

Can be run directly with the [bitrise CLI](https://github.com/bitrise-io/bitrise),
just `git clone` this repository, `cd` into it's folder in your Terminal/Command Line
and call `bitrise run test`.

*Check the `bitrise.yml` file for required inputs which have to be
added to your `.bitrise.secrets.yml` file!*

*There is a sample Info.plist file in _tmp directory for your testing*

### Change log

Version 1.1.4
* Updates from github user Dave005 to support XSLaunchImageAssets and UILaunchStoryboardName

Version 1.1.3
* Updates from bitrise

Version 1.1.0
* Added parameters for BundleVersion, BundlerVersionShort, BundleName, BundleDisplayName, and path to App Icon Asset Catalog

Version 1.0.2
* Fixed Info.plist file path input to allow space in file path.

Version 1.0.1
* Initial commit and first step share to Bitrise.


### Credits

* Thanks to Bitrise team for this awesome service / prompt support!
* Thanks to [Teference](https://github.com/teference/steps-set-ios-bundle-identifier) for source
* Thanks to [Tadija](https://github.com/tadija/bitrise-step-xcode-project-info) for source
* Thanks to [joehanna]https://github.com/joehanna/steps-set-ios-bundle-identifier for source
