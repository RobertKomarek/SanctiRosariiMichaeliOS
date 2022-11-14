import UIKit
import SwiftUI

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var labelTest: UILabel!
    
    @IBOutlet weak var gradientView: UIView!
    //Controls Rosary Scene
    @IBOutlet weak var tabBarRosary: UITabBarItem!
    @IBOutlet weak var buttonDarkmode: UIButton!
    @IBOutlet weak var buttonBackBack: UIButton!
    @IBOutlet weak var buttonBack: UIButton!
    @IBOutlet weak var buttonForward: UIButton!
    @IBOutlet weak var imageFrench: UIImageView!
    //Controls Settings Scene (Languages)
    //Carousel
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet var scrollView: UIScrollView!
    //Variables
    var slides:[Slide] = [];
    var pageIndex:CGFloat = 0
    //var screenWidth:CGFloat = 0
    var appDetails:[AppDetails] = []
    var rosaryChosenLanguage:[AppDetails] = []
    
    @IBAction func tapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        let image = sender.view as! UIImageView
        
        switch image.tag {
            case 0:
                print("French")
            case 1:
                print("German")
            case 2:
                print("English")
            case 3:
                print("Spanish")
            case 4:
                print("Italian")
            case 5:
                print("Portugese")
            default:
                return
        }
    }
    
    @IBAction func buttonBackBackTapped(_ sender: UIButton) {
        let myPageIndex = round(scrollView.contentOffset.x/view.frame.width)
        
        if myPageIndex == 0 {
            return
        }
        
        scrollView.setContentOffset(CGPoint(
            x:0,
            y:0
        ), animated: true)
    }
    
    @IBAction func buttonForwardTapped(_ sender: UIButton) {
        let myPageIndex = round(scrollView.contentOffset.x/view.frame.width)
        
        if Int(myPageIndex) == slides.count-1 {
            return
        }
        
        if myPageIndex != 0 {
            scrollView.setContentOffset(CGPoint(
                x:view.frame.width * (myPageIndex+1),
                y:0
            ), animated: true)
            
        } else {
            scrollView.setContentOffset(CGPoint(
                x:view.frame.width,
                y:0
            ), animated: true)
        }
    }
    
    @IBAction func buttonBackTapped(_ sender: UIButton) {
        
        let myPageIndex = round(scrollView.contentOffset.x/view.frame.width)
        
        if myPageIndex == 0 {
            return
        }
        
        if Int(myPageIndex) != slides.count {
            
            scrollView.setContentOffset(CGPoint(
                x:view.frame.width * (myPageIndex-1),
                y:0
            ), animated: true)
            
        } else {
           
            scrollView.setContentOffset(CGPoint(
                x:view.frame.width * myPageIndex,
                y:0
            ), animated: true)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    //let screen = UIScreen.main.bounds
    //screenWidth = screen.size.width
    
    /*//Load Json file with app details
    appDetails = getJson(jsonName: "SanctiRosariiMichael")
    //Check chosen language Deutsch, Englisch, Español, Italiano, Português, Français
    let defaults = UserDefaults.standard
    let language = defaults.string(forKey: "Language")
    for rosary in appDetails {
        if rosary.Language == language {
            rosaryChosenLanguage.append(rosary)
        }
    }
    
    //Implement ScrollView
    if scrollView != nil {
        scrollView.delegate = self
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        pageControl.layer.cornerRadius = 15
        pageControl.clipsToBounds = true
        view.bringSubviewToFront(pageControl)
        
        //Check if iPad and adjust font size and content mode
        for slide in slides {
            //Check if iphone or ipad
            if UIDevice.current.userInterfaceIdiom == .pad {
                slide.textView.contentMode = UITextView.ContentMode.scaleToFill
                slide.textView.font = UIFont.systemFont(ofSize: 32)
            } else {
                //slide1.textView.contentMode = UITextView.ContentMode.scaleToFill
            }
        }
    }*/
        
}
    
    override func viewDidAppear(_ animated: Bool) {
        
        //Load Json file with app details
        appDetails = getJson(jsonName: "SanctiRosariiMichael")
        //Check chosen language Deutsch, Englisch, Español, Italiano, Português, Français
        let defaults = UserDefaults.standard
        let language = defaults.string(forKey: "Language")
        //Check if language was changed != nil otherwise use English as default value
        if language != nil {
            if rosaryChosenLanguage.isEmpty {
                for rosary in appDetails {
                    if rosary.Language == language {
                        rosaryChosenLanguage.append(rosary)
                    }
                }
            } else {
                rosaryChosenLanguage.removeAll()
                for rosary in appDetails {
                    if rosary.Language == language {
                        rosaryChosenLanguage.append(rosary)
                    }
                }
            }
        } else {
            //Use English as defaul value
            for rosary in appDetails {
                if rosary.Language == "English" {
                    rosaryChosenLanguage.append(rosary)
                }
            }
        }
        
        /*//Update TabItems Title according to language
        let tabBarController = self.tabBarController
        if let items = tabBarController?.tabBar.items {
            for item in items {
                item.title = rosaryChosenLanguage[0].Language
            }
        }*/
        
        //Implement ScrollView
        if scrollView != nil {
            scrollView.delegate = self
            slides = createSlides()
            setupSlideScrollView(slides: slides)
            pageControl.numberOfPages = slides.count
            pageControl.currentPage = 0
            pageControl.layer.cornerRadius = 15
            pageControl.clipsToBounds = true
            view.bringSubviewToFront(pageControl)
            
            //Check if iPad and adjust font size and content mode
            for slide in slides {
                //Check if iphone or ipad
                if UIDevice.current.userInterfaceIdiom == .pad {
                    slide.textView.contentMode = UITextView.ContentMode.scaleToFill
                    slide.textView.font = UIFont.systemFont(ofSize: 32)
                } else {
                    //slide1.textView.contentMode = UITextView.ContentMode.scaleToFill
                }
            }
        }
        
        
        /*	let defaults = UserDefaults.standard
        let language = defaults.string(forKey: "Language")
        
        let alert = UIAlertController(title: "Chosen language", message: "Language \(language ?? "No language chosen") chosen", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)*/
    }
    
    func getJson(jsonName:String) -> [AppDetails] {
        
        var jsonResult:[AppDetails] = []
        
        if let path = Bundle.main.path(forResource: jsonName, ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                  jsonResult = try! JSONDecoder().decode([AppDetails].self, from: data)
              } catch {
                   // handle error
              }
        }
        return jsonResult
    }
    
    func createSlides() -> [Slide] {
        
        var slides:[Slide] = []
        
        for i in 0..<rosaryChosenLanguage.count {
            slides.append(Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide)
            slides[i] = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
            slides[i].imageView.image = UIImage(named: rosaryChosenLanguage[i].Image ?? "michael0")
            slides[i].textView.text = rosaryChosenLanguage[i].Chaplet
        }
        
        return slides

        /*let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.imageView.image = UIImage(named: "michael5")
        slide1.textView.text = rosaryChosenLanguage[0].Chaplet
        
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.imageView.image = UIImage(named: "michael6")
        slide2.textView.text = rosaryChosenLanguage[1].Chaplet*/
    
        //return [slide1, slide2]
    }
    
    func setupSlideScrollView(slides : [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            //pointsxy.append([view.frame.origin.x, view.frame.origin.y])
            scrollView.addSubview(slides[i])
        }
    }
    /*
         * default function called when view is scrolled. In order to enable callback
         * when scrollview is scrolled, the below code needs to be called:
         * slideScrollView.delegate = self or
         */
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        //pointsX.append(scrollView.contentOffset.x)
//            
//            let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
//            let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
//            
//            // vertical
//            let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
//            let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
//
//            let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
//            let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
            
            
            /*
             * below code changes the background color of view on paging the scrollview
             */
            //self.scrollView(scrollView, didScrollToPercentageOffset: percentageHorizontalOffset)
            
        
            /*
             * below code scales the imageview on paging the scrollview
             */
//            let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
//
//            if(percentOffset.x > 0 && percentOffset.x <= 0.25) {
//
//                slides[0].imageView.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
//                slides[1].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
//
//            } else if(percentOffset.x > 0.25 && percentOffset.x <= 0.50) {
//                slides[1].imageView.transform = CGAffineTransform(scaleX: (0.50-percentOffset.x)/0.25, y: (0.50-percentOffset.x)/0.25)
//                slides[2].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.50, y: percentOffset.x/0.50)
//
//            } else if(percentOffset.x > 0.50 && percentOffset.x <= 0.75) {
//                slides[2].imageView.transform = CGAffineTransform(scaleX: (0.75-percentOffset.x)/0.25, y: (0.75-percentOffset.x)/0.25)
//                slides[3].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.75, y: percentOffset.x/0.75)
//
//            } else if(percentOffset.x > 0.75 && percentOffset.x <= 1) {
//                slides[3].imageView.transform = CGAffineTransform(scaleX: (1-percentOffset.x)/0.25, y: (1-percentOffset.x)/0.25)
//                slides[4].imageView.transform = CGAffineTransform(scaleX: percentOffset.x, y: percentOffset.x)
        }
    
}

    


