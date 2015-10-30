//
//  TraktMovie.swift
//  Arsonik
//
//  Created by Florian Morello on 15/04/15.
//  Copyright (c) 2015 Florian Morello. All rights reserved.
//

import Foundation

class TraktMovie : TraktWatchable {

	let trailer:String? // Youtube video name ex: _1MDrwqjeGo
    let rating:Float? // 6.544
    let year:Int? // 2015
    let runtime:Int? // length
    let genres:[String]?
		
	override init?(data: [String : AnyObject]!) {
		rating = data?["rating"] as? Float ?? nil
		year = data?["year"] as? Int ?? nil
        genres = data?["genres"] as? [String]
        runtime = data?["runtime"] as? Int ?? nil

		if let x = data?["trailer"] as? String, url = NSURL(string: x), params = url.query?.componentsSeparatedByString("v=") where params.count == 2 {
			trailer = params[1]
		}
		else {
			trailer = nil
		}

		super.init(data: data)

	}
	
}