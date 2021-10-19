//
//  ViewController.swift
//  2021-PlayingSound-Anh-Tran
//
//  Created by Anh Tran on 10/19/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    
    @IBOutlet weak var foodImageView: UIImageView!
    
    
    struct Dish {
        var Index: Int
        var name: String
        var price: Double
        var imageName: String
        var soundName: String
    }
    
    let foodMenu = [
        Dish(Index: 0, name: "Pizza", price: 19.99, imageName: "pizza", soundName: "movie"),
        Dish(Index: 1, name: "Hamburger", price: 15.99, imageName: "hamburger", soundName: "magic"),
        Dish(Index: 2, name: "pasta", price: 18.99, imageName: "pasta", soundName: "cheering01")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodImageView.image = UIImage(named: foodMenu[0].imageName)
        // Do any additional setup after loading the view.
        //tag the first image and set the atf to be 0
        foodImageView.tag = 0
    }
    
    @IBAction func nextDishButtonPressed(_ sender: UIButton) {
        
        var foodIndex = foodImageView.tag + 1
        if foodIndex == foodMenu.count {
            foodIndex = 0
        }
        
        let foodImageName = foodMenu[foodIndex].imageName
        
        foodImageView.image = UIImage(named: foodImageName)
        foodImageView.tag = foodIndex
        
        let foodSoundName = foodMenu[foodIndex].soundName
        
        if let sound = NSDataAsset(name: foodSoundName) {
            do {// this code wiil stop your app from creashing
                try audioPlayer = AVAudioPlayer(data: sound.data)
                //if we successfully access the sound  data we are going to play it
                audioPlayer.play()
            } catch {
                print("Error: Cannot play the sound")
            }
        } else {
            print("Error: cannot access sound clip called movie")
        }
        // if I can find this is sound clip
    }
}

