//
//  Logs+Networking.swift
//
//
//  Created by Paul Matar on 04/08/2023.
//

import Foundation

public extension Logs {
    static func log(request: URLRequest) {
#if DEBUG
        let urlAsString = request.url?.absoluteString ?? ""
        let urlComponents = NSURLComponents(string: urlAsString)
        let method = request.httpMethod != nil ? "\(request.httpMethod ?? "")" : ""
        let path = "\(urlComponents?.path ?? "")"
        let query = "\(urlComponents?.query ?? "")"
        let host = "\(urlComponents?.host ?? "")"
        let body = request.httpBody?.prettyPrintedJSONString
        
        var debugString = """
        \n--------------- OUTGOING ---------------\n
        \(urlAsString) \n\n
        \(method) \(path)?\(query)
        HOST: \(host)\n
        """
        
        request.allHTTPHeaderFields?.forEach {
            debugString += "\($0): \($1) \n"
        }
        
        if let body {
            debugString += "BODY: \(body) \n"
        }
        
        debugString += "\n--------------- END ---------------\n"
        
        logger.info("\(debugString)")
#endif
    }
    
    static func log(response: HTTPURLResponse, data: Data) {
#if DEBUG
        let urlString = response.url?.absoluteString
        let components = NSURLComponents(string: urlString ?? "")
        let path = "\(components?.path ?? "")"
        let query = "\(components?.query ?? "")"
        var output = "\n - - - - - - - - - - INCOMMING - - - - - - - - - - \n"
        
        if let urlString = urlString {
            output += "\(urlString)"
            output += "\n\n"
        }
        
        output += "HTTP \(response.statusCode) \(path)?\(query)\n"
        
        if let host = components?.host {
            output += "Host: \(host)\n"
        }
        for (key, value) in response.allHeaderFields {
            output += "\(key): \(value)\n"
        }
        
        output += "\n\(data.prettyPrintedJSONString ?? "Unable to pretty print")\n"
        output += "\n - - - - - - - - - -  END - - - - - - - - - - \n"
        
        logger.info("\(output)")
#endif
    }
}
