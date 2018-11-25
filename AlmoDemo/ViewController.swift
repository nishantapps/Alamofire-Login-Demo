//
//  ViewController.swift
//  AlmoDemo
//
//  Created by Pranit Hirve on 09/09/18.
//  Copyright © 2018 Pranit. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let url = URL(string: "url")!
        
        
        let parameters:Parameters = ["first_name":"pdsd",
            "last_name":"shds",
            "email":"p@ghh.com",
            "password":"abcde"]
        
        print("URL:",url)
        print(parameters)
        
        let header : HTTPHeaders = ["Content-Type":"application/x-www-form-urlencoded"]
        
        Alamofire.request(url, method:.post, parameters: parameters, encoding:URLEncoding.default, headers:header).responseJSON(completionHandler:{ response in
            
            switch response.result {
            case .success:
                
                if let jsonData = response.result.value! as? NSDictionary
                {
                    print(jsonData)
                    //completion(jsonData, response.result.error as NSError?)
                }
                break
                
            case .failure(let error):
                
                print(error.localizedDescription)
                break
            }
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

