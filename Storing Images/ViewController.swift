//
//  ViewController.swift
//  Storing Images
//
//  Created by Yisen on 6/25/15.
//  Copyright (c) 2015 Yisen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Eisen1.jpg/500px-Eisen1.jpg")
        
        let urlRequest = NSURLRequest(URL: url!)
        
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue(), completionHandler: {
            response, data, error in
            
            if error != nil {
                println("There was an error!")
                
                
            } else {
                let image = UIImage(data: data)
                
                //self.imageView.image = image
                
                var documentsDirectory: String?
                
                var paths:[AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
                
                if paths.count > 0 {
                    
                    documentsDirectory = paths[0] as? String
                    
                    var savePath = documentsDirectory! + "/japan.jpg"
                    
                    NSFileManager.defaultManager().createFileAtPath(savePath, contents: data, attributes: nil)
                    
                    
                    self.imageView.image = UIImage(named: savePath)
                    
                    
                    
                    
                }
                
                
                
            }
            
            }
        
        )
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

