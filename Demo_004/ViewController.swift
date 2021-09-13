//
//  ViewController.swift
//  Demo_004
//
//  Created by 鄭淳澧 on 2021/7/13.
//

import UIKit
import SwiftUI
import AVFoundation



class ViewController: UIViewController {
    
    @IBOutlet weak var changeSpeechTextfield: UITextField!
    
    @IBAction func speakAction(_ sender: Any) {
        let speechUtterance = AVSpeechUtterance(string:  self.changeSpeechTextfield.text!)
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(speechUtterance)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
       

//        let firstView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        firstView.backgroundColor = .red
        
        
//        self.view.addSubview(firstView)
    }
    
}
    
    
    

    
//        struct ViewControllerView: UIViewControllerRepresentable {
//            func makeUIViewController(context: Context) -> ViewController {
//                 UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController") as! ViewController
//            }
//
//            func updateUIViewController(_ uiViewController: ViewController, context: Context) {
//            }
//
//            typealias UIViewControllerType = ViewController
//
//        }
//
//
//        struct ViewControllerView_Previews: PreviewProvider {
//            static var previews: some View {
//                Group {
//                    ViewControllerView()
//                        .previewDevice("iPhone 12 mini")
//                }
//            }
//        }


//    - (void)textFieldDidBeginEditing:(UITextField *)textField{
//        //設定頁面上拉動畫
//        [UIView beginAnimations:@"Animation" context:nil];
//        [UIView setAnimationDuration:0.3];
//        [UIView setAnimationBeginsFromCurrentState: YES];
//        //設定畫面位移位置
//        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y - 150, self.view.frame.size.width, self.view.frame.size.height);
//        //動畫結束
//        [UIView commitAnimations];
//    }
//
//    - (void)textFieldDidEndEditing:(UITextField *)textField{
//        //設定頁面下拉動畫
//        [UIView beginAnimations:@"Animation" context:nil];
//        [UIView setAnimationDuration:0.3];
//        [UIView setAnimationBeginsFromCurrentState: YES];
//        //設定畫面位移位置
//        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y + 150, self.view.frame.size.width, self.view.frame.size.height);
//        //動畫結束
//        [UIView commitAnimations];
//    }

