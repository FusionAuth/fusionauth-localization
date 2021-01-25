## FusionAuth Localization ![semver 2.0.0 compliant](http://img.shields.io/badge/semver-2.0.0-brightgreen.svg?style=flat-square)

If you're using FusionAuth and your first language is not English, we can use your help! We are shipping support for localized login pages and while our users can localize themselves, we would like to provide a base of languages to use when building out your theme or localization strategy.

If you'd like to contribute, feel free to submit a PR or open an issue we can discuss how you can help!

## Credits
- [@markschmid](https://github.com/markschmid) Initial support for German. Danke!
- [@pawpro](https://github.com/pawpro) Initial support for Polish. Dzięki!
- [@jerryhopper](https://github.com/jerryhopper) Initial support for Dutch. Bedankt!
  - [@flangfeldt](https://github.com/flangfeldt) for the review and assist!
- [@Fahrenholz](https://github.com/Fahrenholz) Initial support for French. Merci!
- [@Loketony](https://github.com/Loketony) Initial support for Swedish. Tack!
- [@veturi](https://github.com/veturi) Initial support for Finnish. Kiitos!
- [@wijse](https://github.com/wijse) Initial support for Danish. Tak! 
- [@Loketony](https://github.com/Loketony) Initial support for Russion. Благодарность!
- [@Loketony](https://github.com/Loketony) Initial support for Ukrainian. Спасибі!
- [@lamuertepeluda](https://github.com/lamuertepeluda) Initial support for Italian. Grazie!
- [@lluisgener](https://github.com/lluisgener) Initial support for Spanish. Gracias!
  - [@einar-lanfranco](https://github.com/einar-lanfranco) for the edits and fixes!
- [@rapcal](https://github.com/rapcal) Initial support for Portuguese (Brazilian). Obrigado!  
- The FusionAuth team - couldn't have done it without you! 

## How to translate

Start with the `theme/message.properties` as a base, and rename it by adding a country code suffix. The wanted section outlines the country code and filename per language. If the language you are translating is not listed there simply find your two character country code and append it to follow the pattern below. 

It is not required that you translate every message, when a message is not translated FusionAuth will fall back to the default message in the theme. This is generally English unless you have modified the default messages in your theme.

As FusionAuth adds new messages they will not (currently) be automatically added to any of these translated files. This means these messages will only be displayed in English until translated. We will be working on a process to help identify these gaps as we move forward to provide a mechanism to keep these translations up to date.  

## Wanted
This is just a suggested list, please contribute whatever you can! We're happy to pay you for your efforts, if you can contribute a new quality translation we can send you $50 as a token of our appreciation, join the [forum](https://fusionauth.io/community/forum/) and let us know so we can send a gift your way.  

- Arabic - theme/message_ar.properties
- Czech - theme/message_cz.properties
- Chinese (Taiwan) - theme/message_zh_TW.properties
- Chinese (China) - theme/message_zh_CN.properties
- Greek - theme/message_el.properties
- Hindi - theme/message_hi.properties
- Japanese - theme/message_ja.properties
- Korean - theme/message_ko.properties
- Norwegian - theme/message_no.properties
- Portuguese - theme/message_pt.properties
- Portuguese (Portugal) - theme/message_pt_PT.properties

### Project Layout

The theme folder contains translations that can be used in a FusionAuth theme. 

```
theme
├── message.properties       English
├── message_da.properties    Danish
├── message_de.properties    German
├── message_es.properties    Spanish
├── message_fi.properties    Finnish
├── message_fr.properties    French
├── message_it.properties    Italian
├── message_nl.properties    Dutch
├── message_pl.properties    Polish
├── message_pt_BR.properties Portuguese (Brazilian
├── message_ru.properties    Russian
├── message_sv.properties    Swedish
├── message_ua.properties    Ukrainian
```

### How to use a translation

When editing a theme in the FusionAuth UI you have the option to add additional supported languages in the Message tab. Click the language you would like to add and then copy and paste the language into the text area.
