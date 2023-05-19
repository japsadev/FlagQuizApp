//
//  ViewController.swift
//  FlagQuiz
//
//  Created by Salih Yusuf Göktaş on 18.05.2023.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var baslaButtonSekil: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		baslaButton()
		veritabaniKopyala()
		
		func baslaButton() {
			
			// baslaButton Corner
			baslaButtonSekil.backgroundColor = UIColor.init(red: 52/255, green: 199/255, blue: 89/255, alpha: 1)
			baslaButtonSekil.layer.cornerRadius = 15.0
			baslaButtonSekil.tintColor = UIColor.white
			
			// baslaButton Shadow
			baslaButtonSekil.layer.shadowColor = UIColor.darkGray.cgColor
			baslaButtonSekil.layer.shadowRadius = 5
			baslaButtonSekil.layer.shadowOpacity = 0.3
			baslaButtonSekil.layer.shadowOffset = CGSize(width: 0, height: 0)
			
		}
		
		func veritabaniKopyala(){
			
			let bundleYolu = Bundle.main.path(forResource: "bayrakquiz", ofType: ".sqlite")
			
			let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
			
			let fileManager = FileManager.default
			
			let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("bayrakquiz.sqlite")
			
			if fileManager.fileExists(atPath: kopyalanacakYer.path) {
				print("Veritabanı zaten var.Kopyalamaya gerek yok")
			}else{
				do {
					
					try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
					
				}catch{
					print(error)
				}
			}
		}

		
	}


}

