//
//  DLAPIClient.swift
//  DJLobo
//
//  Created by Eddie Espinal on 9/26/15.
//  Copyright © 2015 EspinalLab, LLC. All rights reserved.
//

import UIKit

class DLAPIClient: NSObject {

    class var sharedInstance: DLAPIClient {
        struct Static {
            static let instance: DLAPIClient = DLAPIClient()
        }
        return Static.instance
    }
    
    func httpRequest(url: String, params: NSMutableDictionary, completion: (NSMutableDictionary) -> (), errors: () ->()) {
        
        var result: NSMutableDictionary = NSMutableDictionary()
        
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        var body: NSData!
        
        do{
            body = try NSJSONSerialization.dataWithJSONObject(params, options: NSJSONWritingOptions.PrettyPrinted)
            request.HTTPBody = body
        } catch let error as NSError{
            print("A JSON parsing error occurred, here are the details:\n \(error)")
            
        }
        
        request.HTTPMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
//        request.addValue(API_KEY, forHTTPHeaderField: "api-key")
        request.addValue(String(body.length), forHTTPHeaderField: "Content-Length")
        request.timeoutInterval = 10.00;
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){
            data, response, error in
            
            if let httpResponse = response as? NSHTTPURLResponse{
                print(httpResponse.statusCode)
                if httpResponse.statusCode == 200
                {
                    do{
                        result = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSMutableDictionary
                        print(result)
                        completion(result)
                        
                    } catch let error as NSError{
                        print("A JSON parsing error occurred, here are the details:\n \(error)")
                        errors()
                    }
                } else{
                    print("response was not 200: \(response)")
                    errors()
                }
            }
            if error != nil{
                print("response was not 200: \(error)")
                errors()
            }
            
        }
        
        task.resume()
        
    }
    

}
