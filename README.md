## FusionAuth Localization ![semver 2.0.0 compliant](http://img.shields.io/badge/semver-2.0.0-brightgreen.svg?style=flat-square)

If you're using FusionAuth and your first language is not English, we can use your help! We are shipping support for localized login pages and while our users can localize themselves, we would like to provide a base of languages to use when building out your theme or localization strategy.

If you'd like to contribute, feel free to submit a PR or open an issue so we can discuss how you can help!

## Credits
- [@markschmid](https://github.com/markschmid) Initial support for German. Danke!
  - [@Jeannot-Muller](https://github.com/Jeannot-Muller) for the additions and fixes!
- [@pawpro](https://github.com/pawpro) Initial support for Polish. Dzięki!
  - [@pigletto](https://github.com/pigletto) for the additions and fixes!
- [@jerryhopper](https://github.com/jerryhopper) Initial support for Dutch. Bedankt!
  - [@flangfeldt](https://github.com/flangfeldt) for the review and assist!
  - [@dirksierd](https://github.com/dirksierd) for the additions and fixes!
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
- [@kevinadhiguna](https://github.com/kevinadhiguna) Initial support for Indonesian (Indonesia). Terima kasih!
- [@kevinadhiguna](https://github.com/kevinadhiguna) Initial support for Japanese. ありがとうございました！
- [@zahertalab](https://github.com/zahertalab) Initial support for Arabic. اشكرشكرًا لكك
- [@10935336](https://github.com/10935336) Initial support for Simplified Chinese. 谢谢
- [@krystofremes](https://github.com/krystofremes) Initial support for Czech. Děkuji
- The FusionAuth team - couldn't have done it without you!

## How to translate

For languages listed in the wanted section, start with the `theme/message.properties` as a base, and rename it by adding a country code suffix. The wanted section outlines the country code and filename per language. If the language you are translating is not listed there simply find your two character country code and append it to follow the pattern below.

If there is already a `theme/message_xx.properties` file for your language you will find a `missing-translations/message_xx.properties` file that lists only those messages that are missing from the base theme. Use this file to find the missing messages and add them to the base theme file for you language. You don't have to add new messages in any particular place, you can add them to the bottom and once finished you can run the `update.rb` ruby script (or we can run it for you) to reorganize the base `/theme` file and update the `/missing-translations` file.

It is not required that you translate every message, when a message is not translated FusionAuth will fall back to the default message in the theme. This is generally English unless you have modified the default messages in your theme.

As FusionAuth adds new messages they will not (currently) be automatically added to any of these translated files. This means these messages will only be displayed in English until translated. As mentioned you can find missing translations in the `/missing-translations` files.

Some languages have the notion of formal vs informal address, where the appropriate choice depends on the context and the relationship between the speaker and listeners. This is a complex problem, so the FusionAuth locale files default to the formal choice. Please feel free to modify the locale files as needed.

### New message keys

If you are submitting a PR to this repository, please do not add any values to the base `messages.properties` file. If you find anyplace in a theme where there is a message key that is used but it is not in `messages.properties` please [file an issue in our issues repo](https://github.com/fusionauth/fusionauth-issues/issues) specifying the keys that you'd like to be added to the file. The FusionAuth team will need to add those keys to a properties file managed in a different repository and will track doing so via the submitted issue. If you are managing your own `messages.properties` file and don't care about upstreaming translations to this repository, this note does not apply.

## Wanted

This is just a suggested list, please feel free to contribute whatever you can!

We're happy to pay you for your efforts; if you can contribute a new quality translation we can send you $50 as a token of our appreciation, join the [forum](https://fusionauth.io/community/forum/) and let us know so we can send a gift your way.

- Chinese (Taiwan) - theme/message_zh_TW.properties
- Greek - theme/message_el.properties
- Hindi - theme/message_hi.properties
- Korean - theme/message_ko.properties
- Norwegian - theme/message_no.properties
- Punjabi - theme/message_pa.properties

### Project Layout

The theme folder contains translations that can be used in a FusionAuth theme. The missing translations folder contains a list of messages that are in the `message.properties` file (English) that are missing from the language indicated by the country code suffix (e.g. `_it` for Italian).

```
theme
├── message.properties       English
├── message_ar.properties    Arabic
├── message_cz.properties    Czech
├── message_da.properties    Danish
├── message_de_AT.properties    German (Austria)
├── message_de_BE.properties    German (Belgium)
├── message_de_CH.properties    German (Switzerland)
├── message_de_DE.properties    German (Germany)
├── message_de_IT.properties    German (Italy)
├── message_de_LI.properties    German (Liechtenstein)
├── message_de_LU.properties    German (Luxembourg)
├── message_es.properties    Spanish
├── message_fi.properties    Finnish
├── message_fr.properties    French
├── message_id_ID.properties Indonesian (Indonesia)
├── message_it.properties    Italian
├── message_ja.properties    Japanese
├── message_nl.properties    Dutch
├── message_pl.properties    Polish
├── message_pt_BR.properties Portuguese (Brazilian)
├── message_ru.properties    Russian
├── message_sv.properties    Swedish
├── message_ua.properties    Ukrainian
missing-translations
├── message_ar.properties    Arabic
├── message_da.properties    Danish
├── message_es.properties    Spanish
├── message_fi.properties    Finnish
├── message_fr.properties    French
├── message_id_ID.properties Indonesian (Indonesia)
├── message_it.properties    Italian
├── message_ja.properties    Japanese
├── message_nl.properties    Dutch
├── message_pl.properties    Polish
├── message_pt_BR.properties Portuguese (Brazilian)
├── message_ru.properties    Russian
├── message_sv.properties    Swedish
├── message_ua.properties    Ukrainian
```

## How to use a translation

First, find the language translation you want.

* Clone this project. 
* Copy the contents of one of the message properties files.

Next, update your theme.

* Log in to the FusionAuth administrative user interface.
* If you only have the default theme, make a copy. The default theme is immutable.
* Edit your theme. 
* Navigate to the "Messages" tab.
* Select "Add localization"
* Set the "Locale" to the language.
* Paste in the contents of the messages properties file.
* Click "Submit"
* Click the blue save icon to save the theme.
* Update your tenant to use the new theme.

![Editing a theme to add localization](/images/theme-editing.png)

Test it out:

* Navigate to your FusionAuth instance and [provide a locale in one of the supported manners](https://fusionauth.io/docs/v1/tech/core-concepts/localization-and-internationalization/#hosted-login-pages).

Not all translations are up to date. Where there are missing messages, the default English text will be displayed.

Please feel free to contribute any fixes or additional translations for missing messages as well!
