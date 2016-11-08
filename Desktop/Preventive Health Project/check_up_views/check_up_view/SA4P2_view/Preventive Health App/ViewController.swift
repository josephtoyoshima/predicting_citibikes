//
//  ViewController.swift
//  Preventive Health App
//
//  Created by Joseph Toyoshima on 11/2/16.
//
//

import UIKit

extension UIImage{
    
    func alpha(value:CGFloat)->UIImage
    {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}

class ViewController: UIViewController {

    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //colors
    let c1Color = UIColor(red: 223/255.0, green: 249/255.0, blue: 246/255.0, alpha: 1.0)
    let c1ColorDark = UIColor(red: 45/255.0, green: 232/255.0, blue: 216/255.0, alpha: 1.0)
    let c2Color = UIColor(red: 203/255.0, green: 241/255.0, blue: 187/255.0, alpha: 1.0)
    let c2ColorDark = UIColor(red: 101/255.0, green: 238/255.0, blue: 44/255.0, alpha: 1.0)
    let c3Color = UIColor(red: 241/255.0, green: 201/255.0, blue: 210/255.0, alpha: 1.0)
    let c3ColorDark = UIColor(red: 243/255.0, green: 67/255.0, blue: 106/255.0, alpha: 1.0)
    let c4Color = UIColor(red: 251/255.0, green: 244/255.0, blue: 165/255.0, alpha: 1.0)
    let c4ColorDark = UIColor(red: 241/255.0, green: 170/255.0, blue: 53/255.0, alpha: 1.0)
    let topColor = UIColor(red: 248/255.0, green: 231/255.0, blue: 28/255.0, alpha: 1.0)
    let noContinuedColor = UIColor.darkGray
    let continuedColor = UIColor.green
    let progressColor = UIColor.blue
    
    //fonts
    let font = "Helvetica Neue"
    let questionFontSize = 14
    let triviaFontSize = 10
    let choiceFontSize = 12
    let continuedFontSize = 15
    let selectAllFontSize = 8
    
    //number of questions
    let questionNumber: Float = 1.0
    let numberOfQuestions: Float = 10.0
    
    //text
    let questionText = "Did you brush your teeth today?"
    let choice1Text = "CHEESE"
    let choice2Text = "FRUITS AND VEGETABLES"
    let choice3Text = "CANDY"
    let choice4Text = "SODA"
    let triviaText = "Cow hair was used for toothbrush"
    
    //images
    let choice1image = "cheese-1"
    let choice2image = "broccoli-1"
    let choice3image = "candy-1"
    let choice4image = "soda"

    
    // MARK: Properties
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var choice4: UIButton!
    @IBOutlet weak var trivia: UILabel!
    @IBOutlet weak var continued: UIButton!
    @IBOutlet weak var progressbar: UIProgressView!
    @IBOutlet weak var selectalltext: UILabel!
    @IBOutlet weak var topbox: UIView!
    
    
    // MARK: Actions
    @IBAction func choice1(_ sender: UIButton) {
        if choice1.layer.borderColor == c1Color.cgColor {
            sender.layer.borderColor = c1ColorDark.cgColor
            sender.layer.borderWidth = 5
            appDelegate.choice[0] = 1
        } else if choice1.layer.borderColor == c1ColorDark.cgColor{
            sender.layer.borderColor = c1Color.cgColor
            sender.layer.borderWidth = 3
            appDelegate.choice[0] = 0
        }
        trivia.text = triviaText
    }
    @IBAction func choice2(_ sender: UIButton) {
        if choice2.layer.borderColor == c2Color.cgColor {
            sender.layer.borderColor = c2ColorDark.cgColor
            sender.layer.borderWidth = 5
            appDelegate.choice[0] = 1
        } else if choice2.layer.borderColor == c2ColorDark.cgColor{
            sender.layer.borderColor = c2Color.cgColor
            sender.layer.borderWidth = 3
            appDelegate.choice[0] = 0
        }
        trivia.text = triviaText
    }
    @IBAction func choice3(_ sender: UIButton) {
        if choice3.layer.borderColor == c3Color.cgColor {
            sender.layer.borderColor = c3ColorDark.cgColor
            sender.layer.borderWidth = 5
            appDelegate.choice[0] = 1
        } else if choice3.layer.borderColor == c3ColorDark.cgColor{
            sender.layer.borderColor = c3Color.cgColor
            sender.layer.borderWidth = 3
            appDelegate.choice[0] = 0
        }
        trivia.text = triviaText
    }
    @IBAction func choice4(_ sender: UIButton) {
        if choice4.layer.borderColor == c4Color.cgColor {
            sender.layer.borderColor = c4ColorDark.cgColor
            sender.layer.borderWidth = 5
            appDelegate.choice[0] = 1
        } else if choice4.layer.borderColor == c4ColorDark.cgColor{
            sender.layer.borderColor = c4Color.cgColor
            sender.layer.borderWidth = 3
            appDelegate.choice[0] = 0
        }
        trivia.text = triviaText
    }
    @IBAction func continued(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //disable continue button
        //continued.isEnabled = false
        
        //text
        question.text = questionText
        trivia.text = ""
        choice1.setTitle(choice1Text, for: .normal)
        choice2.setTitle(choice2Text, for: .normal)
        choice3.setTitle(choice3Text, for: .normal)
        choice4.setTitle(choice4Text, for: .normal)
        
        //background color
        topbox.backgroundColor = topColor
        choice1.backgroundColor = c1Color
        choice2.backgroundColor = c2Color
        choice3.backgroundColor = c3Color
        choice4.backgroundColor = c4Color
        continued.backgroundColor = UIColor.green
        
        //border color
        choice1.layer.borderColor = c1Color.cgColor
        choice2.layer.borderColor = c2Color.cgColor
        choice3.layer.borderColor = c3Color.cgColor
        choice4.layer.borderColor = c4Color.cgColor
        
        //progress bar
        progressbar.setProgress(questionNumber/numberOfQuestions, animated: false)
        progressbar.progressTintColor = progressColor
        
        //images
        let c1image = UIImage(named: choice1image)!.alpha(value: 0.4)
        let c2image = UIImage(named: choice2image)!.alpha(value: 0.4)
        let c3image = UIImage(named: choice3image)!.alpha(value: 0.4)
        let c4image = UIImage(named: choice4image)!.alpha(value: 0.4)
        choice1.setBackgroundImage(c1image, for: .normal)
        choice2.setBackgroundImage(c2image, for: .normal)
        choice3.setBackgroundImage(c3image, for: .normal)
        choice4.setBackgroundImage(c4image, for: .normal)

        //font size and type
        trivia.font = UIFont(name: font, size: CGFloat(triviaFontSize))
        question.font = UIFont(name: font, size: CGFloat(questionFontSize))
        selectalltext.font = UIFont(name: font, size: CGFloat(selectAllFontSize))
        continued.titleLabel?.font = UIFont(name: font, size: CGFloat(continuedFontSize))
        for i in [choice1, choice2, choice3, choice4] {
            i?.titleLabel?.font = UIFont(name: font, size: CGFloat(choiceFontSize))
            i?.layer.borderWidth = 3
            //i?.setTitleColor(UIColor.blue, for: .normal)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



