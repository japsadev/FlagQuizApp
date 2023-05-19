//
//  Bayraklar.swift
//  FlagQuiz
//
//  Created by Salih Yusuf Göktaş on 18.05.2023.
//

import Foundation

class Bayraklar:Equatable,Hashable {
	var bayrak_id:Int?
	var bayrak_ad:String?
	var bayrak_resim:String?
	
	init() {
		
	}
	
	init(bayrak_id:Int,bayrak_ad:String,bayrak_resim:String) {
		self.bayrak_id = bayrak_id
		self.bayrak_ad = bayrak_ad
		self.bayrak_resim = bayrak_resim
	}
	
	var hashValue : Int {
		get {
			return bayrak_id.hashValue
		}
	}
	static func == (lhs:Bayraklar,rsh:Bayraklar) -> Bool {
		return lhs.bayrak_id == rsh.bayrak_id
	}
}
