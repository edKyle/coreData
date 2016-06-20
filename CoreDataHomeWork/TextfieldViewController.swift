//
//  TextfieldViewController.swift
//  CoreDataHomeWork
//
//  Created by Kyle on 2016/6/16.
//  Copyright © 2016年 Alphacamp. All rights reserved.
//

import UIKit
import CoreData

class TextfieldViewController: UIViewController {
    
    @IBOutlet weak var nametext: UITextField!
    @IBOutlet weak var typetext: UITextField!
    @IBOutlet weak var scoretext: UITextField!
    
    var newMovieList: MovieList?
    
    let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveAction(sender: AnyObject) {
        
        newMovieList = NSEntityDescription.insertNewObjectForEntityForName("MovieList", inManagedObjectContext: managedObjectContext) as? MovieList
        
        newMovieList?.movieName = nametext.text
        newMovieList?.movieType = typetext.text
        
        let formatter = NSNumberFormatter()
        
        if let scoreVaule = formatter.numberFromString(scoretext.text!){
            
            let vaule = scoreVaule as Int
            
            if vaule <= 10 && vaule >= 0{
                newMovieList?.movieScore = scoreVaule
                appDelegate.saveContext()
            }else{
                let alert = UIAlertController(title: "Warning", message: "number out of range!!", preferredStyle: .Alert)
                let alertAction = UIAlertAction(title: "sorry", style: .Cancel, handler: nil)
                alert.addAction(alertAction)
                
                self.presentViewController(alert, animated: true, completion: nil)
                
                return
            }
            
        }
                
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
