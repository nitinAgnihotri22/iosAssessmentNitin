//
//	UserData.swift
//
//	Create by Nitin Agnihotri on 21/1/2022
//	Copyright © 2022. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct UserData{

	var avatarUrl : String!
	var bio : AnyObject!
	var blog : String!
	var company : AnyObject!
	var createdAt : String!
	var email : AnyObject!
	var eventsUrl : String!
	var followers : Int!
	var followersUrl : String!
	var following : Int!
	var followingUrl : String!
	var gistsUrl : String!
	var gravatarId : String!
	var hireable : AnyObject!
	var htmlUrl : String!
	var id : Int!
	var location : AnyObject!
	var login : String!
	var name : AnyObject!
	var nodeId : String!
	var organizationsUrl : String!
	var publicGists : Int!
	var publicRepos : Int!
	var receivedEventsUrl : String!
	var reposUrl : String!
	var siteAdmin : Bool!
	var starredUrl : String!
	var subscriptionsUrl : String!
	var twitterUsername : AnyObject!
	var type : String!
	var updatedAt : String!
	var url : String!
    var message : String!
    var docUrl : String!

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		avatarUrl = dictionary["avatar_url"] as? String
		bio = dictionary["bio"] as? AnyObject
		blog = dictionary["blog"] as? String
		company = dictionary["company"] as? AnyObject
		createdAt = dictionary["created_at"] as? String
		email = dictionary["email"] as? AnyObject
		eventsUrl = dictionary["events_url"] as? String
		followers = dictionary["followers"] as? Int
		followersUrl = dictionary["followers_url"] as? String
		following = dictionary["following"] as? Int
		followingUrl = dictionary["following_url"] as? String
		gistsUrl = dictionary["gists_url"] as? String
		gravatarId = dictionary["gravatar_id"] as? String
		hireable = dictionary["hireable"] as? AnyObject
		htmlUrl = dictionary["html_url"] as? String
		id = dictionary["id"] as? Int
		location = dictionary["location"] as? AnyObject
		login = dictionary["login"] as? String
		name = dictionary["name"] as? AnyObject
		nodeId = dictionary["node_id"] as? String
		organizationsUrl = dictionary["organizations_url"] as? String
		publicGists = dictionary["public_gists"] as? Int
		publicRepos = dictionary["public_repos"] as? Int
		receivedEventsUrl = dictionary["received_events_url"] as? String
		reposUrl = dictionary["repos_url"] as? String
		siteAdmin = dictionary["site_admin"] as? Bool
		starredUrl = dictionary["starred_url"] as? String
		subscriptionsUrl = dictionary["subscriptions_url"] as? String
		twitterUsername = dictionary["twitter_username"] as? AnyObject
		type = dictionary["type"] as? String
		updatedAt = dictionary["updated_at"] as? String
        url = dictionary["url"] as? String
        message = dictionary["message"] as? String
        docUrl = dictionary["documentation_url"] as? String
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
		if bio != nil{
			dictionary["bio"] = bio
		}
		if blog != nil{
			dictionary["blog"] = blog
		}
		if company != nil{
			dictionary["company"] = company
		}
		if createdAt != nil{
			dictionary["created_at"] = createdAt
		}
		if email != nil{
			dictionary["email"] = email
		}
		if eventsUrl != nil{
			dictionary["events_url"] = eventsUrl
		}
		if followers != nil{
			dictionary["followers"] = followers
		}
		if followersUrl != nil{
			dictionary["followers_url"] = followersUrl
		}
		if following != nil{
			dictionary["following"] = following
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
		if hireable != nil{
			dictionary["hireable"] = hireable
		}
		if htmlUrl != nil{
			dictionary["html_url"] = htmlUrl
		}
		if id != nil{
			dictionary["id"] = id
		}
		if location != nil{
			dictionary["location"] = location
		}
		if login != nil{
			dictionary["login"] = login
		}
		if name != nil{
			dictionary["name"] = name
		}
		if nodeId != nil{
			dictionary["node_id"] = nodeId
		}
		if organizationsUrl != nil{
			dictionary["organizations_url"] = organizationsUrl
		}
		if publicGists != nil{
			dictionary["public_gists"] = publicGists
		}
		if publicRepos != nil{
			dictionary["public_repos"] = publicRepos
		}
		if receivedEventsUrl != nil{
			dictionary["received_events_url"] = receivedEventsUrl
		}
		if reposUrl != nil{
			dictionary["repos_url"] = reposUrl
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
		if twitterUsername != nil{
			dictionary["twitter_username"] = twitterUsername
		}
		if type != nil{
			dictionary["type"] = type
		}
		if updatedAt != nil{
			dictionary["updated_at"] = updatedAt
		}
        if url != nil{
            dictionary["url"] = url
        }
        if message != nil{
            dictionary["message"] = url
        }
        if docUrl != nil{
            dictionary["documentation_url"] = url
        }
		return dictionary
	}

}
