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
    let choice1Color = UIColor(red: 223/255.0, green: 249/255.0, blue: 246/255.0, alpha: 1.0)
    let c1Color = UIColor(red: 223/255.0, green: 249/255.0, blue: 246/255.0, alpha: 1.0)
    let c1ColorDark = UIColor(red: 45/255.0, green: 232/255.0, blue: 216/255.0, alpha: 1.0)
    let c2Color = UIColor(red: 203/255.0, green: 241/255.0, blue: 187/255.0, alpha: 1.0)
    let c2ColorDark = UIColor(red: 101/255.0, green: 238/255.0, blue: 44/255.0, alpha: 1.0)
    let c3Color = UIColor(red: 241/255.0, green: 201/255.0, blue: 210/255.0, alpha: 1.0)
    let c3ColorDark = UIColor(red: 243/255.0, green: 67/255.0, blue: 106/255.0, alpha: 1.0)
    let c4Color = UIColor(red: 251/255.0, green: 244/255.0, blue: 165/255.0, alpha: 1.0)
    let c4ColorDark = UIColor(red: 241/255.0, green: 170/255.0, blue: 53/255.0, alpha: 1.0)
    let c5Color = UIColor(red: 224/255.0, green: 206/255.0, blue: 241/255.0, alpha: 1.0)
    let c5ColorDark = UIColor(red: 169/255.0, green: 91/255.0, blue: 237/255.0, alpha: 1.0)
    let c6Color = UIColor(red: 234/255.0, green: 204/255.0, blue: 177/255.0, alpha: 1.0)
    let c6ColorDark = UIColor(red: 229/255.0, green: 157/255.0, blue: 93/255.0, alpha: 1.0)
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
    let choice1Text = "YES"
    let choice2Text = "NO"
    let choice3Text = "MAYBE"
    let choice4Text = "KIND OF"
    var triviaText = "Cow hair was used for toothbrush"
    
    //images
    let choice1image = "doctor_ooo"
    let choice2image = "venus"

    
    // MARK: Properties
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var trivia: UILabel!
    @IBOutlet weak var continued: UIButton!
    @IBOutlet weak var progressbar: UIProgressView!
    @IBOutlet weak var choice1picture: UIButton!
    @IBOutlet weak var choice2picture: UIButton!
    @IBOutlet weak var topbox: UIView!

    // MARK: Actions
    @IBAction func choice1(_ sender: UIButton) {
        choice1.setTitleColor(UIColor.black, for: .normal)
        choice1.backgroundColor = c1ColorDark
        choice1picture.backgroundColor = c1ColorDark
        //choice1picture.layer.borderColor = c1ColorDark.cgColor
        //choice1picture.layer.borderWidth = 5
        choice2.backgroundColor = c2Color
        choice2picture.backgroundColor = c2Color
        //choice2picture.layer.borderColor = c2Color.cgColor
        //choice2picture.layer.borderWidth = 3
        choice2.setTitleColor(UIColor.lightGray, for: .normal)
        continued.backgroundColor = UIColor.green
        trivia.text = triviaText
        appDelegate.choice = [1, 0, 0, 0, 0, 0]
        continued.isEnabled = true
    }
    
    @IBAction func choice2(_ sender: UIButton) {
        choice2.setTitleColor(UIColor.black, for: .normal)
        choice2.backgroundColor = c2ColorDark
        choice2picture.backgroundColor = c2ColorDark
        //choice2picture.layer.borderColor = c2ColorDark.cgColor
        //choice2picture.layer.borderWidth = 5
        choice1.backgroundColor = c1Color
        choice1picture.backgroundColor = c1Color
        //choice1picture.layer.borderColor = c1Color.cgColor
        //choice1picture.layer.borderWidth = 3
        choice1.setTitleColor(UIColor.lightGray, for: .normal)
        continued.backgroundColor = UIColor.green
        trivia.text = triviaText
        appDelegate.choice = [0, 1, 0, 0, 0, 0]
        continued.isEnabled = true
    }
      @IBAction func continued(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //disable continue button
        continued.isEnabled = false
        
        //text
        question.text = questionText
        trivia.text = ""
        choice1.setTitle(choice1Text, for: .normal)
        choice2.setTitle(choice2Text, for: .normal)
        choice1picture.setTitle("", for: .normal)
        choice2picture.setTitle("", for: .normal)
        
        //background color
        topbox.backgroundColor = topColor
        choice1picture.backgroundColor = c1Color
        choice2picture.backgroundColor = c2Color
        continued.backgroundColor = noContinuedColor
        
        //border, borderWidth > 0 to enable
        choice1picture.layer.borderColor = c1Color.cgColor
        choice2picture.layer.borderColor = c2Color.cgColor
        for i in [choice1picture, choice2picture] {
            i?.layer.borderWidth = 0
        }
        
        //images
        choice1picture.setImage(UIImage(named: choice1image), for: .normal)
        choice2picture.setImage(UIImage(named: choice2image), for: .normal)
        
        //progress bar
        progressbar.setProgress(questionNumber/numberOfQuestions, animated: false)
        progressbar.progressTintColor = progressColor
        
        //font size and type
        trivia.font = UIFont(name: font, size: CGFloat(triviaFontSize))
        question.font = UIFont(name: font, size: CGFloat(questionFontSize))
        //selectalltext.font = UIFont(name: font, size: CGFloat(selectAllFontSize))
        continued.titleLabel?.font = UIFont(name: font, size: CGFloat(continuedFontSize))
        for i in [choice1, choice2] {
            i?.titleLabel?.font = UIFont(name: font, size: CGFloat(choiceFontSize))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



