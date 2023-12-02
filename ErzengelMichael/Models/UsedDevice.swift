import UIKit

struct UsedDevice {
    
    static func languageCode() -> String {
        //Check preferred Language of Device and return Deutsch, English, Español, Italiano, Português, Français or 中文 (Chinese) to load the JSON file
        let preferredLanguage = Locale.preferredLanguages.first
        let locale = Locale(identifier: preferredLanguage ?? "")
        if let localLanguageCode = locale.language.languageCode?.identifier {
            switch localLanguageCode {
            case "en":
                return "English"
            case "de":
                return "Deutsch"
            case "es":
                return "Español"
            case "it":
                return "Italiano"
            case "pt":
                return "Português"
            case "fr":
                return "Français"
            case "zh":
                return "中文"
            default:
                return "English"
            }
        } else {
            return "English" //as default value
        }
    }
}

