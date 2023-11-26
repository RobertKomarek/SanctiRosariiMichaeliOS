import UIKit
import SwiftUI

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var appDetails = AppDetails()
    var darkModeIsEnabled:Bool = false
    //Welcome Screen
    @IBOutlet weak var textViewInstruction: UITextView!
    @IBOutlet weak var labelWelcome: UILabel!
    @IBOutlet weak var welcomeView: UIView!
    @IBOutlet weak var buttonHideWelcome: UIButton!
    
    @IBOutlet weak var tabBarRosary: UITabBarItem!
    @IBOutlet weak var buttonDarkmode: UIButton!
    @IBOutlet weak var buttonBackBack: UIButton!
    @IBOutlet weak var buttonBack: UIButton!
    @IBOutlet weak var buttonForward: UIButton!
    @IBOutlet weak var buttonShare: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet var scrollView: UIScrollView!
    
    var slides: [Slide] = [];
    var pageIndex:CGFloat = 0
    var arrayAppDetails: [AppDetails] = []
    var rosaryChosenLanguage: [AppDetails] = []
    
    @IBAction func hideWelcomeView(_ sender: Any) {
        welcomeView.isHidden = true
        pageControl.isHidden = false
    }
    
    @IBAction func showDarkMode(_ sender: Any) {
        if darkModeIsEnabled {
            darkModeIsEnabled = false
            buttonDarkmode.setImage(UIImage(systemName:"moon.fill"), for: .normal)
            //Implement ScrollView
            if scrollView != nil {
                scrollView.delegate = self
                slides = createSlides(darkLightMode: darkModeIsEnabled)
                setupSlideScrollView(slides: slides)
                pageControl.numberOfPages = slides.count
                pageControl.currentPage = Int(pageIndex)
                pageControl.layer.cornerRadius = 15
                pageControl.clipsToBounds = true
                view.bringSubviewToFront(pageControl)
                
                //Check if iPad or iPhone and adjust font size and content mode
                for slide in slides {
                    if UIDevice.current.userInterfaceIdiom == .pad {
                        slide.textView.contentMode = UITextView.ContentMode.scaleToFill
                        slide.textView.font = UIFont.systemFont(ofSize: 32)
                    }
                }
            }
        } else {
            darkModeIsEnabled = true
            buttonDarkmode.setImage(UIImage(systemName:"sun.max.fill"), for: UIControl.State.normal)
            pageControl.currentPage = Int(pageIndex)
            //Implement ScrollView
            if scrollView != nil {
                scrollView.delegate = self
                slides = createSlides(darkLightMode: darkModeIsEnabled)
                setupSlideScrollView(slides: slides)
                pageControl.numberOfPages = slides.count
                pageControl.currentPage = Int(pageIndex)
                pageControl.layer.cornerRadius = 15
                pageControl.clipsToBounds = true
                view.bringSubviewToFront(pageControl)
                
                //Check if iPad or iPhone and adjust font size and content mode
                for slide in slides {
                    if UIDevice.current.userInterfaceIdiom == .pad {
                        slide.textView.contentMode = UITextView.ContentMode.scaleToFill
                        slide.textView.font = UIFont.systemFont(ofSize: 32)
                    }
                }
            }
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
        
        buttonHideWelcome.layer.cornerRadius = 7
        
        //Check chosen language Deutsch, English, Español, Italiano, Português, Français
        let defaults = UserDefaults.standard
        let language = defaults.string(forKey: "Language")
        if language != nil {
            //Load Json file with app details
            arrayAppDetails = appDetails.getAppDetails(jsonName: "SanctiRosariiMichael", language: language!)
        } else {
            arrayAppDetails = appDetails.getAppDetails(jsonName: "SanctiRosariiMichael", language: "English")
        }
       
        
        //Update TabItems Title according to language
        if let tabBarItem0 = self.tabBarController?.tabBar.items?[0] {
            tabBarItem0.title = arrayAppDetails[0].TabBarRosary
        }
        if let tabBarItem1 = self.tabBarController?.tabBar.items?[1] {
            tabBarItem1.title = arrayAppDetails[0].TabBarPromises
        }
        if let tabBarItem2 = self.tabBarController?.tabBar.items?[2] {
            tabBarItem2.title = arrayAppDetails[0].TabBarPrayers
        }
        if let tabBarItem3 = self.tabBarController?.tabBar.items?[3] {
            tabBarItem3.title = arrayAppDetails[0].TabBarSettings
        }

        
        //Implement ScrollView
        if scrollView != nil {
            scrollView.delegate = self
            slides = createSlides(darkLightMode: darkModeIsEnabled)
            setupSlideScrollView(slides: slides)
            pageControl.numberOfPages = slides.count
            pageControl.currentPage = Int(round(scrollView.contentOffset.x/view.frame.width))
            pageControl.layer.cornerRadius = 15
            pageControl.clipsToBounds = true
            view.bringSubviewToFront(pageControl)
            
            //Check if iPad or iPhone and adjust font size and content mode
//            for slide in slides {
//                if UIDevice.current.userInterfaceIdiom == .pad {
//                    slide.textView.contentMode = UITextView.ContentMode.scaleToFill
//                    slide.textView.font = UIFont.systemFont(ofSize: 32)
//                }
//            }
        }
    }
   
    
    override func viewWillAppear(_ animated: Bool) {
        
        //Check chosen language Deutsch, English, Español, Italiano, Português, Français
        let defaults = UserDefaults.standard
        let language = defaults.string(forKey: "Language")
        if language != nil {
            //Load Json file with app details
            arrayAppDetails = appDetails.getAppDetails(jsonName: "SanctiRosariiMichael", language: language!)
        } else {
            arrayAppDetails = appDetails.getAppDetails(jsonName: "SanctiRosariiMichael", language: "English")
        }
        
        //Bei Neustart der App checken ob die FontSize geändert wurde und entsprechend den Labels im Array zuweisen
        if let fontSize = UserDefaults.standard.value(forKey: "fontSize") as? CGFloat {
            labelWelcome.font = UIFont.systemFont(ofSize: fontSize)
            textViewInstruction.font = UIFont.systemFont(ofSize: fontSize)
        }

        //Welcome View
        labelWelcome.text = arrayAppDetails[0].AppWelcomeTitle
        textViewInstruction.text = arrayAppDetails[0].AppWelcomeText
        buttonHideWelcome.setTitle(arrayAppDetails[0].ChapletStart, for: .normal)

        //Implement ScrollView
        if scrollView != nil {
            scrollView.delegate = self
            slides = createSlides(darkLightMode: darkModeIsEnabled)
            setupSlideScrollView(slides: slides)
            pageControl.numberOfPages = slides.count
            pageControl.currentPage = Int(round(scrollView.contentOffset.x/view.frame.width))
            pageControl.layer.cornerRadius = 15
            pageControl.clipsToBounds = true
            view.bringSubviewToFront(pageControl)

            //Check if iPad or iPhone and adjust font size and content mode
//            for slide in slides {
//                if UIDevice.current.userInterfaceIdiom == .pad {
//                    slide.textView.contentMode = UITextView.ContentMode.scaleToFill
//                    slide.textView.font = UIFont.systemFont(ofSize: 32)
//                }
//            }
        }
    }
    
    func createSlides(darkLightMode:Bool) -> [Slide] {
        
        //Bei Neustart der App checken ob die FontSize geändert wurde und entsprechend den Labels im Array zuweisen
        let fontSize = UserDefaults.standard.value(forKey: "fontSize") as? CGFloat
        
        var slides:[Slide] = []
        
        for i in 0..<arrayAppDetails.count {
            if darkModeIsEnabled {
                slides.append(Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide)
                slides[i] = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
                slides[i].imageView.image = UIImage(named: arrayAppDetails[i].ImageDark ?? "michael0dark")
                slides[i].textView.text = arrayAppDetails[i].Chaplet
                slides[i].textView.font = UIFont.systemFont(ofSize: fontSize ?? 20.0)
                
            } else {
                slides.append(Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide)
                slides[i] = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
                slides[i].imageView.image = UIImage(named: arrayAppDetails[i].Image ?? "michael0")
                slides[i].textView.text = arrayAppDetails[i].Chaplet
                slides[i].textView.font = UIFont.systemFont(ofSize: fontSize ?? 20.0)
            }
        }
        print("my fontsize: \(String(describing: fontSize))")
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
