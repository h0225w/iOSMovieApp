//
//  String+.swift
//  iOSMovieApp
//
//  Created by 박현우 on 2022/06/16.
//

import Foundation

extension String {
   func removeHTMLTag() -> String {
       return self.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)
    }
}
