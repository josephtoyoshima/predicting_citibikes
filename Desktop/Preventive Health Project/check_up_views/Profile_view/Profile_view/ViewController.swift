//
//  ViewController.swift
//  Profile_view
//
//  Created by Joseph Toyoshima on 11/6/16.
//
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var menu: UIBarButtonItem!
    @IBOutlet weak var label: UILabel!
    
    var varView = Int()
    
    //MARK: Actions
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        menu.target = self.revealViewController()
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        if varView == 0{
            
            label.text = "main"
        }else{
            label.text = "others"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

