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
    
    func getAppDetails(jsonName:String, language:String) -> [AppDetails] {
        
        var jsonResult:[AppDetails] = []
        
        if let path = Bundle.main.path(forResource: jsonName, ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                  jsonResult = try! JSONDecoder().decode([AppDetails].self, from: data)
              } catch {
                   // handle error
              }
        }
        
        var rosaryChosenLanguage:[AppDetails] = []
      
        for rosary in jsonResult {
            if rosary.Language == language {
                rosaryChosenLanguage.append(rosary)
            }
        }
        return rosaryChosenLanguage
    }
    
}
