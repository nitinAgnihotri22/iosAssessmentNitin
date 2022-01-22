//
//	Item.swift
//
//	Create by Nitin Agnihotri on 15/1/2022
//	Copyright © 2022. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Item{

	var avatarUrl : String!
	var eventsUrl : String!
	var followersUrl : String!
	var followingUrl : String!
	var gistsUrl : String!
	var gravatarId : String!
	var htmlUrl : String!
	var id : Int!
	var login : String!
	var nodeId : String!
	var organizationsUrl : String!
	var receivedEventsUrl : String!
	var reposUrl : String!
	var score : Float!
	var siteAdmin : Bool!
	var starredUrl : String!
	var subscriptionsUrl : String!
	var type : String!
	var url : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		avatarUrl = dictionary["avatar_url"] as? String
		eventsUrl = dictionary["events_url"] as? String
		followersUrl = dictionary["followers_url"] as? String
		followingUrl = dictionary["following_url"] as? String
		gistsUrl = dictionary["gists_url"] as? String
		gravatarId = dictionary["gravatar_id"] as? String
		htmlUrl = dictionary["html_url"] as? String
		id = dictionary["id"] as? Int
		login = dictionary["login"] as? String
		nodeId = dictionary["node_id"] as? String
		organizationsUrl = dictionary["organizations_url"] as? String
		receivedEventsUrl = dictionary["received_events_url"] as? String
		reposUrl = dictionary["repos_url"] as? String
		score = dictionary["score"] as? Float
		siteAdmin = dictionary["site_admin"] as? Bool
		starredUrl = dictionary["starred_url"] as? String
		subscriptionsUrl = dictionary["subscriptions_url"] as? String
		type = dictionary["type"] as? String
		url = dictionary["url"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if avatarUrl != nil{
			dictionary["avatar_url"] = avatarUrl
		}
		if eventsUrl != nil{
			dictionary["events_url"] = eventsUrl
		}
		if followersUrl != nil{
			dictionary["followers_url"] = followersUrl
		}
		if followingUrl != nil{
			dictionary["following_url"] = followingUrl
		}
		if gistsUrl != nil{
			dictionary["gists_url"] = gistsUrl
		}
		if gravatarId != nil{
			dictionary["gravatar_id"] = gravatarId
		}
		if htmlUrl != nil{
			dictionary["html_url"] = htmlUrl
		}
		if id != nil{
			dictionary["id"] = id
		}
		if login != nil{
			dictionary["login"] = login
		}
		if nodeId != nil{
			dictionary["node_id"] = nodeId
		}
		if organizationsUrl != nil{
			dictionary["organizations_url"] = organizationsUrl
		}
		if receivedEventsUrl != nil{
			dictionary["received_events_url"] = receivedEventsUrl
		}
		if reposUrl != nil{
			dictionary["repos_url"] = reposUrl
		}
		if score != nil{
			dictionary["score"] = score
		}
		if siteAdmin != nil{
			dictionary["site_admin"] = siteAdmin
		}
		if starredUrl != nil{
			dictionary["starred_url"] = starredUrl
		}
		if subscriptionsUrl != nil{
			dictionary["subscriptions_url"] = subscriptionsUrl
		}
		if type != nil{
			dictionary["type"] = type
		}
		if url != nil{
			dictionary["url"] = url
		}
		return dictionary
	}

}