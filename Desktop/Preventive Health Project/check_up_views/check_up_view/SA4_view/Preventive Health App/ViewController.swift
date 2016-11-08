//
//  ViewController.swift
//  Preventive Health App
//
//  Created by Joseph Toyoshima on 11/2/16.
//
//

import UIKit

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
    let choice1image = "cheese"
    let choice2image = "broccoli"
    let choice3image = "candy"
    let choice4image = "can"

    
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
        if choice1.backgroundColor == c1Color {
            sender.backgroundColor = c1ColorDark
            appDelegate.choice[0] = 1
        } else if choice1.backgroundColor == c1ColorDark{
            sender.backgroundColor = c1Color
            appDelegate.choice[0] = 0
        }
        trivia.text = triviaText
    }
    @IBAction func choice2(_ sender: UIButton) {
        if choice2.backgroundColor == c2Color {
            sender.backgroundColor = c2ColorDark
            appDelegate.choice[1] = 1
        } else if choice2.backgroundColor == c2ColorDark{
            sender.backgroundColor = c2Color
            appDelegate.choice[1] = 0
        }
        trivia.text = triviaText
    }
    @IBAction func choice3(_ sender: UIButton) {
        if choice3.backgroundColor == c3Color {
            sender.backgroundColor = c3ColorDark
            appDelegate.choice[2] = 1
        } else if choice3.backgroundColor == c3ColorDark{
            sender.backgroundColor = c3Color
            appDelegate.choice[2] = 0
        }
        trivia.text = triviaText
    }
    @IBAction func choice4(_ sender: UIButton) {
        if choice4.backgroundColor == c4Color {
            sender.backgroundColor = c4ColorDark
            appDelegate.choice[3] = 1
        } else if choice4.backgroundColor == c4ColorDark{
            sender.backgroundColor = c4Color
            appDelegate.choice[3] = 0
        }
        trivia.text = triviaText
    }
    @IBAction func continued(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        continued.backgroundColor = continuedColor
        
        //progress bar
        progressbar.setProgress(questionNumber/numberOfQuestions, animated: false)
        progressbar.progressTintColor = progressColor
        
        //images
        //choice1.setImage(UIImage(named: choice1image), for: .normal)
        //choice2.setImage(UIImage(named: choice2image), for: .normal)
        //choice3.setImage(UIImage(named: choice3image), for: .normal)
        //choice4.setImage(UIImage(named: choice4image), for: .normal)
        
        //font size and type
        trivia.font = UIFont(name: font, size: CGFloat(triviaFontSize))
        question.font = UIFont(name: font, size: CGFloat(questionFontSize))
        selectalltext.font = UIFont(name: font, size: CGFloat(selectAllFontSize))
        continued.titleLabel?.font = UIFont(name: font, size: CGFloat(continuedFontSize))
        for i in [choice1, choice2, choice3, choice4] {
            i?.titleLabel?.font = UIFont(name: font, size: CGFloat(choiceFontSize))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



