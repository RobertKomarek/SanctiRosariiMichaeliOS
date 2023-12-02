import UIKit

class AppDetails : Decodable {
    
    var Number : Int?
    var AppName: String?
    var TabBarRosary: String?
    var TabBarManual: String?
    var TabBarPromises: String?
    var TabBarPrayers: String?
    var TabBarSettings: String?
    var SettingsText: String?
    var TitlePromisesMichael: String?
    var PromisesMichael: String?
    var TitlePromisesIndulgences: String?
    var PromisesIndulgences: String?
    var TitlePrayersLitany: String?
    var PrayersLitany: String?
    var TitlePrayersLeo: String?
    var PrayersLeo: String?
    var PrayersLeoLatin: String?
    var Language: String?
    var AppWelcomeTitle: String?
    var AppWelcomeText: String?
    var Chaplet: String?
    var ChapletStart: String?
    var Image: String?
    var ImageDark: String?
    
    //Seque "Promises" or "Litany"
    func getAppDetails(jsonName: String, language: String) -> [AppDetails] {
        var jsonResult: [AppDetails] = []
        
        if let path = Bundle.main.path(forResource: jsonName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                jsonResult = try! JSONDecoder().decode([AppDetails].self, from: data)
            } catch {
                // handle error
            }
        }
        
        var rosaryChosenLanguage:[AppDetails] = []
        
        //        for (index, element) in jsonResult.enumerated() {
        //            print("Index: \(index), Element: \(element)")
        //        }
        
        for rosary in jsonResult {
            if rosary.Language == language {
                rosaryChosenLanguage.append(rosary)
            }
        }
        return rosaryChosenLanguage
    }
    
}
            
        // Returns the language code
        //print("Language Code:  \(String(describing: languageCode))") // Returns the language code
        //print ("Current Locale: \(currentLocale.language.languageCode?.identifier)")
//        switch languageCode {
//        case "en":
//            arrayAppDetails = appDetails.getAppDetails(jsonName: "SanctiRosariiMichael", language: "English")
//        case "de":
//            arrayAppDetails = appDetails.getAppDetails(jsonName: "SanctiRosariiMichael", language: "Deutsch")
//        case "es":
//            arrayAppDetails = appDetails.getAppDetails(jsonName: "SanctiRosariiMichael", language: "Español")
//        case "it":
//            arrayAppDetails = appDetails.getAppDetails(jsonName: "SanctiRosariiMichael", language: "Italiano")
//        case "pt":
//            arrayAppDetails = appDetails.getAppDetails(jsonName: "SanctiRosariiMichael", language: "Português")
//        case "fr":
//            arrayAppDetails = appDetails.getAppDetails(jsonName: "SanctiRosariiMichael", language: "Français")
//        case "zh":
//            arrayAppDetails = appDetails.getAppDetails(jsonName: "SanctiRosariiMichael", language: "中文")
//        default:
//            arrayAppDetails = appDetails.getAppDetails(jsonName: "SanctiRosariiMichael", language: "English")
//        }
    
    
    
    

