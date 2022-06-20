//
//  ViewController.swift
//  Right on target
//
//  Created by Nikolai Kolmykov on 17.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    
    var number = 0
    var round = 1
    var points = 0
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.number = Int.random(in: 1...50)
        self.label.text = String(self.number)
      
        // Do any additional setup after loading the view.
    }

    override func loadView() {
        super.loadView()
        let versionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
        versionLabel.text = "Tvoya mat' sdohla(("
        self.view.addSubview(versionLabel)
    }
    
    @IBAction func checkNumber() {
       
      
            let numSlider = Int(self.slider.value.rounded())
            if numSlider > self.number {
                self.points += 50 - numSlider + self.number
        
            }
            else if numSlider < self.number {
                self.points += 50 - self.number + numSlider
            }
            else{
            self.points += 50
            }
        
        if self.round == 5 {
            let alert = UIAlertController(
                title: "Игра окончена",
                message: "Вы заработали \(self.points) очков", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            self.round = 1
            self.points = 0
            self.number = Int.random(in: 1...50)
            self.label.text = String(self.number)
            }
            else {
                self.round += 1
            }
            self.number = Int.random(in: 1...50)
            self.label.text = String(self.number)
        }
   
    
    lazy var secondViewController: SecondViewController = getSecondViewController()
    
    private func getSecondViewController() -> SecondViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "SecondViewController")
        return viewController as! SecondViewController
    }
    
    @IBAction func showNextScreen(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "SecondViewController")
        self.present(viewController, animated: true, completion: nil)
    }
    
}

