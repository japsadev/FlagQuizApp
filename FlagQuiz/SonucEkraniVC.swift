//
//  SonucEkraniVC.swift
//  FlagQuiz
//
//  Created by Salih Yusuf Göktaş on 18.05.2023.
//

import UIKit

class SonucEkraniVC: UIViewController {
	@IBOutlet weak var labelSonuc: UILabel!
	@IBOutlet weak var labelYuzde: UILabel!
	@IBOutlet weak var yenidenDeneButton: UIButton!
	
	var dogruSayisi:Int?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		yenidenDeneVelabelYuzde()

		func yenidenDeneVelabelYuzde() {
			
			// Yeniden Dene Corner
			yenidenDeneButton.backgroundColor = UIColor.init(red: 233/255, green: 79/255, blue: 29/255, alpha: 1)
			yenidenDeneButton.layer.cornerRadius = 15.0
			yenidenDeneButton.tintColor = UIColor.white
			
			// Yeniden Dene Shadow
			yenidenDeneButton.layer.shadowColor = UIColor.darkGray.cgColor
			yenidenDeneButton.layer.shadowRadius = 45
			yenidenDeneButton.layer.shadowOpacity = 0.3
			yenidenDeneButton.layer.shadowOffset = CGSize(width: 0, height: 0)
			
			// Label Yuzde
			labelYuzde.layer.cornerRadius = 15.0
			labelYuzde.layer.masksToBounds = true
		}
	
		
		navigationItem.hidesBackButton = true
		
		if let d = dogruSayisi {
			labelSonuc.text = "\(d) DOĞRU \(5-d) YANLIŞ"
			labelYuzde.text = "% \(d*100/5) BAŞARI"
		}
		
			
    }
	@IBAction func tekrarDene(_ sender: Any) {
		
		navigationController?.popToRootViewController(animated: true)
		
	}
	
}
