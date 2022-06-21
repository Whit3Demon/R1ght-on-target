//
//  ViewController.swift
//  Right on target
//
//  Created by Nikolai Kolmykov on 17.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var game: Game!
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        game = Game(startValue: 1, endValue: 50, rounds: 5)
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
        // Do any additional setup after loading the view.
    }

    override func loadView() {
        super.loadView()
        let versionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
        versionLabel.text = "Tvoya mat' sdohla(("
        self.view.addSubview(versionLabel)
    }
    
    @IBAction func checkNumber() {
        game.calculateScore(with: Int(slider.value))
        if game.isGameEnded{
            showAlertWith(score: game.score)
            game.restartGame()
        } else{
            game.startNewRound()
        }
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
        }
    private func updateLabelWithSecretNumber(newText:String){
        label.text = newText
    }
    
    private func showAlertWith(score: Int){
        let alert = UIAlertController(title: "Game over", message: "U get \(score)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
