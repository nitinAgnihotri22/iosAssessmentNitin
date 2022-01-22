//
//	Users.swift
//
//	Create by Nitin Agnihotri on 15/1/2022
//	Copyright © 2022. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Users{

	var incompleteResults : Bool!
	var items : [Item]!
	var totalCount : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		incompleteResults = dictionary["incomplete_results"] as? Bool
		items = [Item]()
		if let itemsArray = dictionary["items"] as? [NSDictionary]{
			for dic in itemsArray{
				let value = Item(fromDictionary: dic)
				items.append(value)
			}
		}
		totalCount = dictionary["total_count"] as? Int
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if incompleteResults != nil{
			dictionary["incomplete_results"] = incompleteResults
		}
		if items != nil{
			var dictionaryElements = [NSDictionary]()
			for itemsElement in items {
				dictionaryElements.append(itemsElement.toDictionary())
			}
			dictionary["items"] = dictionaryElements
		}
		if totalCount != nil{
			dictionary["total_count"] = totalCount
		}
		return dictionary
	}

}