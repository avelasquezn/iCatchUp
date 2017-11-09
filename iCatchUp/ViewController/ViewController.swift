//
//  ViewController.swift
//  iCatchUp
//
//  Created by Operador on 11/9/17.
//  Copyright © 2017 UPC. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        testNetworking()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func testNetworking() {
        Alamofire.request(NewsApiService.sourcesUrl)
        .responseJSON(completionHandler: {
            response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("\(json)")
                
                var sources: [Source] = []
                let jsonSources = json["sources"].arrayValue
                for i in 0...jsonSources.count - 1 {
                    sources.insert(Source.init(from: jsonSources[i]), at: i)
                    print("\(sources[i].name)")
                }
                
                let settings = SettingsStore()
                let apiKey = settings.newsApiKey
                
                print("\(apiKey)")
                
                
                
            case .failure(let error):
                print(error)
            }
        })
        
    }
}

