# Set iOS Info.plist - Bundle Identifier

Sets the Bundle Identifier to the specified value, in the target Info.plist file for the next build.


### How to use this Step

Can be run directly with the [bitrise CLI](https://github.com/bitrise-io/bitrise),
just `git clone` this repository, `cd` into it's folder in your Terminal/Command Line
and call `bitrise run test`.

*Check the `bitrise.yml` file for required inputs which have to be
added to your `.bitrise.secrets.yml` file!*

*There is a sample Info.plist file in _tmp directory for your testing*

### Change log

Version 1.0.1
* Initial commit and first step share to Bitrise.

Version 1.0.2
* Fixed Info.plist file path input to allow space in file path.

### Credits

Thanks to Bitrise team for this awesome service / prompt support!
