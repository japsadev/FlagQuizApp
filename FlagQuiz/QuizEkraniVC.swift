//
//  QuizEkraniVC.swift
//  FlagQuiz
//
//  Created by Salih Yusuf Göktaş on 18.05.2023.
//

import UIKit

class QuizEkraniVC: UIViewController {
	@IBOutlet weak var labelDogru: UILabel!
	@IBOutlet weak var labelYanlis: UILabel!
	@IBOutlet weak var labelSoruSayisi: UILabel!
	@IBOutlet weak var imageViewBayrak: UIImageView!
	
	@IBOutlet weak var buttonAsekil: UIButton!
	@IBOutlet weak var buttonBsekil: UIButton!
	@IBOutlet weak var buttonCsekil: UIButton!
	@IBOutlet weak var buttonDsekil: UIButton!
	
	var sorular = [Bayraklar]()
	var yanlisSecenekler = [Bayraklar]()
	var dogruSoru = Bayraklar()
	
	var soruSayac = 0
	var dogruSayac = 0
	var yanlisSayac = 0
	
	var secenekler = [Bayraklar]()
	var seceneklerKaristirmaListesi = Set <Bayraklar>()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		buttonOzellikler()
		
		imageViewBayrak.layer.cornerRadius = 15.0
		
		func buttonOzellikler() {
			
			// Button A Corner
			buttonAsekil.backgroundColor = UIColor.init(red: 88/255, green: 86/255, blue: 214/255, alpha: 1)
			buttonAsekil.layer.cornerRadius = 15.0
			buttonAsekil.tintColor = UIColor.white
			
			// Button A Shadow
			buttonAsekil.layer.shadowColor = UIColor.darkGray.cgColor
			buttonAsekil.layer.shadowRadius = 45
			buttonAsekil.layer.shadowOpacity = 0.3
			buttonAsekil.layer.shadowOffset = CGSize(width: 0, height: 0)
			
			// Button B Corner
			buttonBsekil.backgroundColor = UIColor.init(red: 88/255, green: 86/255, blue: 214/255, alpha: 1)
			buttonBsekil.layer.cornerRadius = 15.0
			buttonBsekil.tintColor = UIColor.white
			
			// Button B Shadow
			buttonBsekil.layer.shadowColor = UIColor.darkGray.cgColor
			buttonBsekil.layer.shadowRadius = 5
			buttonBsekil.layer.shadowOpacity = 0.3
			buttonBsekil.layer.shadowOffset = CGSize(width: 0, height: 0)
			
			// Button C Corner
			buttonCsekil.backgroundColor = UIColor.init(red: 88/255, green: 86/255, blue: 214/255, alpha: 1)
			buttonCsekil.layer.cornerRadius = 15.0
			buttonCsekil.tintColor = UIColor.white
			
			// Button C Shadow
			buttonCsekil.layer.shadowColor = UIColor.darkGray.cgColor
			buttonCsekil.layer.shadowRadius = 5
			buttonCsekil.layer.shadowOpacity = 0.3
			buttonCsekil.layer.shadowOffset = CGSize(width: 0, height: 0)
			
			// Button D Corner
			buttonDsekil.backgroundColor = UIColor.init(red: 88/255, green: 86/255, blue: 214/255, alpha: 1)
			buttonDsekil.layer.cornerRadius = 15.0
			buttonDsekil.tintColor = UIColor.white
			
			// Button D Shadow
			buttonDsekil.layer.shadowColor = UIColor.darkGray.cgColor
			buttonDsekil.layer.shadowRadius = 5
			buttonDsekil.layer.shadowOpacity = 0.3
			buttonDsekil.layer.shadowOffset = CGSize(width: 0, height: 0)
			
		}
		
		sorular = Bayraklardao().rastgele5Getir()
	
		for s in sorular {
			print(s.bayrak_ad!)
		}
		
		soruYukle()
		
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		let gidilecekVC = segue.destination as! SonucEkraniVC
		gidilecekVC.dogruSayisi = dogruSayac
	}
		
		func soruYukle() {
			labelSoruSayisi.text = "\(soruSayac+1). SORU"
			labelDogru.text = "Doğru : \(dogruSayac)"
			labelYanlis.text = "Yanlış : \(yanlisSayac)"
		
			dogruSoru = sorular[soruSayac]
			
			imageViewBayrak.image = UIImage(named: dogruSoru.bayrak_resim!)
			
			yanlisSecenekler = Bayraklardao().rastgele3YanlisGetir(bayrak_id: dogruSoru.bayrak_id!)
			
			seceneklerKaristirmaListesi.removeAll()
			
			seceneklerKaristirmaListesi.insert(dogruSoru)
			seceneklerKaristirmaListesi.insert(yanlisSecenekler[0])
			seceneklerKaristirmaListesi.insert(yanlisSecenekler[1])
			seceneklerKaristirmaListesi.insert(yanlisSecenekler[2])
			
			secenekler.removeAll()
			
			for s in seceneklerKaristirmaListesi {
				secenekler.append(s)
			}
			
			buttonAsekil.setTitle(secenekler[0].bayrak_ad, for: .normal)
			buttonBsekil.setTitle(secenekler[1].bayrak_ad, for: .normal)
			buttonCsekil.setTitle(secenekler[2].bayrak_ad, for: .normal)
			buttonDsekil.setTitle(secenekler[3].bayrak_ad, for: .normal)
		
}
	
	func dogruKontrol(button:UIButton){
		let buttonYazi = button.titleLabel?.text
		let dogruCevap = dogruSoru.bayrak_ad
		
		print("Button Yazi : \(buttonYazi!)")
		print("Dogru Cevap : \(dogruCevap!)")
		
		if dogruCevap == buttonYazi {
			dogruSayac += 1
		}else{
			yanlisSayac += 1
		}
		
		labelDogru.text = "Doğru : \(dogruSayac)"
		labelYanlis.text = "Yanlış : \(yanlisSayac)"
	}
	
	func soruSayacKontrol(){
		soruSayac += 1
		
		if soruSayac != 5 {
			soruYukle()
		}else{
			performSegue(withIdentifier: "toSonucEkrani", sender: nil)
		}
		
	}
		
	@IBAction func buttonAtikla(_ sender: Any) {
		dogruKontrol(button: buttonAsekil)
		soruSayacKontrol()
	}
	@IBAction func buttonBtikla(_ sender: Any) {
		dogruKontrol(button: buttonBsekil)
		soruSayacKontrol()
	}
	@IBAction func buttonCtikla(_ sender: Any) {
		dogruKontrol(button: buttonCsekil)
		soruSayacKontrol()
	}
	@IBAction func buttonDtikla(_ sender: Any) {
		dogruKontrol(button: buttonDsekil)
		soruSayacKontrol()
	}
}
