//
//  TraktId.swift
//  Arsonik
//
//  Created by Florian Morello on 10/04/15.
//  Copyright (c) 2015 Florian Morello. All rights reserved.
//

import Foundation

public enum TraktId : String {
	case Imdb = "imdb"
	, Slug = "slug"
	, Tmdb = "tmdb"
	, Trakt = "trakt"
	, Tvdb = "tvdb"
	, Tvrage = "tvrage"
	
	static func extractIds(data:[String:AnyObject!]!) -> [TraktId:AnyObject]! {
		if let lids = data?["ids"] as? [String:AnyObject] {
			var ids:[TraktId:AnyObject] = [:]
			for (a,b) in lids {
				if let id = TraktId(rawValue: a) {
					ids[id] = b
				}
			}
			return ids
		}
		return nil
	}
}
