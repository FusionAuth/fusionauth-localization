## FusionAuth Localization ![semver 2.0.0 compliant](http://img.shields.io/badge/semver-2.0.0-brightgreen.svg?style=flat-square)

If you're using FusionAuth and your first language is not English, we can use your help! We are shipping support for localized login pages and while our users can localize themselves, we would like to provide a base of languages to use when building out your theme or localization strategy.

If you'd like to contribute, feel free to submit a PR or open an issue we can discuss how you can help!

## Credits
- [@ssirag](https://github.com/markschmid) Initial support for German. Danke!
- [@pawpro](https://github.com/pawpro) Initial support for Polish. Dzięki!
- [@jerryhopper](https://github.com/jerryhopper) Initial support for Dutch. Bedankt!
  - [@flangfeldt](https://github.com/flangfeldt) for the review and assist!
- The FusionAuth team - couldn't have done it without you! 


## How to translate

Start with the `theme/message.properties` as a base, and rename it by adding a country code suffix. The wanted section outlines the country code and filename per language. If the language you are translating is not listed there simply find your two character country code and append it to follow the pattern below. 

It is not required that you translate every message, when a message is not translated FusionAuth will fall back to the default message in the theme. This is generally English unless you have modified the default messages in your theme.

As FusionAuth adds new messages they will not (currently) be automatically added to any of these translated files. This means these messages will only be displayed in English until translated. We will be working on a process to help identify these gaps as we move forward to provide a mechanism to keep these translations up to date.  

## Wanted
This is just a suggested list, please contribute whatever you can! 

- Arabic - theme/message_ar.properties
- Czech - theme/message_cz.properties
- Danish -theme/message_da.properties
- Chinese (Taiwan) - theme/message_zh_TW.properties
- Chinese (China) - theme/message_zh_CN.properties
- Finnish - theme/message_fi.properties
- French - theme/message_fr.properties
- Greek - theme/message_el.properties
- Hindi - theme/message_hi.properties
- Italian - theme/message_it.properties
- Japanese - theme/message_ja.properties
- Korean - theme/message_ko.properties
- Norwegian - theme/message_no.properties
- Portuguese - theme/message_pt.properties
- Portuguese (Brazilian) - theme/message_pt_BR.properties
- Portuguese (Portugal) - theme/message_pt_PT.properties
- Russian - theme/message_ru.properties
- Swedish - theme/message_sv.properties
- Spanish - theme/message_es.properties
- Ukrainian - theme/message_ua.properties


### Project Layout

The theme folder contains translations that can be used in a FusionAuth theme. 

```
theme
├── message.properties       English
├── message_de.properties    German
├── message_nl.properties    Dutch
├── message_pl.properties    Polish
```

### How to use a translation

When editing a theme in the FusionAuth UI you have the option to add additional supported languages in the Message tab. Click the language you would like to add and then copy and paste the language into the text area.
