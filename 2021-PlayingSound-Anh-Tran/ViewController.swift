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
    
    
    @IBOutlet weak var houseImageView: UIImageView!
    
    
    struct HouseModel {
        var index: Int
        var address: String
        var price: Double
        var imageName: String
        var soundName: String
    }
    
    let houseListing = [
           HouseModel(index: 0, address: "1600 Holloway Ave, San Francisco", price: 999999.99, imageName: "house01", soundName: "cheering01"),
           HouseModel(index: 1, address: "835 Market Street, San Francisco", price: 1599989.99, imageName: "house02", soundName: "magic"),
           HouseModel(index: 2, address: "1000 Palm Street, San Francisco", price: 2100000.00, imageName: "house03", soundName: "movie")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        houseImageView.image = UIImage(named: houseListing[0].imageName)
        // Do any additional setup after loading the view.
        //tag the first image and set the atf to be 0
        houseImageView.tag = 0
    }
    //create a function to play sound
        // the function takes one parameter which is the name of the sound file
    func playSound(soundName: String) {
            //soundName is actually passed in through the parameter of the function
        if let sound = NSDataAsset(name: soundName) {
                //if I can find this sound clip
                //the best thing i can do is try to play it, if not, I will catch the erro
            do { //this code will stop your app from crashing
                try audioPlayer = AVAudioPlayer(data: sound.data)
                    //if we successfully access the sound data we are going to play it
                    audioPlayer.play()
                } catch {
                print("😡 Error: cannot play the sound clip")
                }//end of catch
                
        } //end of if let
        else {
                //if I cannot find this sound clip
            print("😡 Error: cannot access sound clip called movie")
        } //end of else
    } //end of function
    
   
    
    
    
    
    @IBAction func nextHouseButtomPressed(_ sender: UIButton) {
           
        var houseIndex = houseImageView.tag + 1
               
               //figure out which is the next dish to display
               if houseIndex == houseListing.count {
                   houseIndex = 0
               }
               
               //figure out which image to display
               let houseImageName = houseListing[houseIndex].imageName
               
               houseImageView.image = UIImage(named: houseImageName)
               //update the tag for your imageview
               houseImageView.tag = houseIndex
               
               //figure out which sound to play
               let houseSoundName = houseListing[houseIndex].soundName
               
               //call playSound() to play sound named foodSoundName
               playSound(soundName: houseSoundName)
               
           }
       }

