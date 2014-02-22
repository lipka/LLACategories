# LLACategories

A collection of categories for UIKit and Foundation classes.

## Usage

``` objc
UIFont *font = [UIFont fontWithName:@"FontAwesome" size:32];
UIImage *iconImage = [UIImage lla_imageWithFont:font named:@"\uf09a" maskColor:[UIColor blueColor]];

...

UIFont *maskedImage = [UIImage lla_imageNamed:@"Image" maskColor:[UIColor redColor]];

...

UIImage *existingImage = ...;
UIImage *maskedImage = [existingImage lla_maskWithColor:[UIColor redColor]];
```

See the individual headers for full documentation.

## Installation

[CocoaPods](http://cocoapods.org) is the recommended method of installing LLACategories. Simply add the following line to your `Podfile`:

#### Podfile

```ruby
pod 'LLACategories'
```

Otherwise you can just add the files under `LLACategories` to your project.

## Requirements

LLACategories is tested on iOS7 and requires ARC.

## Contact

Lukas Lipka

- http://github.com/lipka
- http://twitter.com/lipec
- http://lukaslipka.com

## License

LLACategories is available under the [MIT license](LICENSE). See the LICENSE file for more info.
