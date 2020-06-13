//
//  String+encodeUrl.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 24.06.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import Foundation

extension String {
    var encodeUrl : String
    {
        return self.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
    }
    var decodeUrl : String
    {
        return self.removingPercentEncoding!
    }
}
