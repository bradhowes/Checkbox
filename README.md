[![CI](https://github.com/bradhowes/Checkbox/workflows/CI/badge.svg)](https://github.com/bradhowes/Checkbox)
[![Platform iOS](https://img.shields.io/badge/platform-iOS-blue.svg?style=flat)](https://apple.com)
[![Swift 5.1](https://img.shields.io/badge/Swift-5.0-orange.svg?style=flat)](https://swift.org)
[![SwiftPM compatible](https://img.shields.io/badge/SwiftPM-compatible-brightgreen.svg)](https://swift.org/package-manager/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

# Checkbox

Extremely simple checkbox control for iOS using CoreAnimation layers.

![](Checkboxen.gif)

Included is a playground for playing with a collection of checkboxen.

## Configuration

* `isChecked` -- the current value of the control.
* `borderLineWidth` -- the line width of the border that is drawn around the view's frame
* `borderShape` -- the border to render. Currently supports two shapes: square and circle
* `uncheckedBorderColor` -- the color of the border when the control is unchecked
* `checkedBorderColor` -- the color of the border when the control is checked
* `checkShape` -- the checked indicator to render. Support 4 shapes: square, circle, check, and cross
* `checkLineWidth` -- the line width of the check and cross shapes
* `checkInserts` -- the amount to reduce the border frame before being used for the checked shape frame

NOTE: the color of the checked shape comes from the UIView `tintColor` value.
