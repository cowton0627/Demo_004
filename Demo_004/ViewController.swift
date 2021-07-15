//
//  ViewController.swift
//  Demo_004
//
//  Created by 鄭淳澧 on 2021/7/13.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var myTextField: UITextField!
    

    /* 暫存輸入框元件 */
        var currentTextField: UITextField?
        /* 暫存 View 的範圍 */
        var rect: CGRect?
        
    func textFieldDidBeginEditing(_ textField: UITextField) {
            /* 開始輸入時，將輸入框實體儲存 */
            currentTextField = textField
    }

//        myScrollView.setContentOffset(CGPoint(x: 0, y: 200), animated: true)
//    }
//
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        myScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        myTextField.delegate = self
        
        
        /* 監聽 鍵盤顯示/隱藏 事件 */
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)

            NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)

        /* 將 View 原始範圍儲存 */
        rect = view.bounds
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /* 這個地方寫法有問題，請看文章下方補充
        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            /* 移除監聽 */
            NotificationCenter.default.removeObserver(
                self,
                name: UIResponder.keyboardWillShowNotification,
                object: nil
            )
            NotificationCenter.default.removeObserver(
                self,
                name: UIResponder.keyboardWillHideNotification,
                object: nil
            )
        }  */
         
        @objc func keyboardWillShow(note: NSNotification) {
            if currentTextField == nil {
                return
            }

            let userInfo = note.userInfo!
            /* 取得鍵盤尺寸 */
            let keyboard = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
            let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
            /* 取得焦點輸入框的位置 */
            let origin = (currentTextField?.frame.origin)!
            /* 取得焦點輸入框的高度 */
            let height = (currentTextField?.frame.size.height)!
            /* 計算輸入框最底部Y座標，原Y座標為上方位置，需要加上高度 */
            let targetY = origin.y + height
            /* 計算扣除鍵盤高度後的可視高度 */
            let visibleRectWithoutKeyboard = self.view.bounds.size.height - keyboard.height

            /* 如果輸入框Y座標在可視高度外，表示鍵盤已擋住輸入框 */
            if targetY >= visibleRectWithoutKeyboard {
                var rect = self.rect!
                /* 計算上移距離，若想要鍵盤貼齊輸入框底部，可將 + 5 部分移除 */
                rect.origin.y -= (targetY - visibleRectWithoutKeyboard) + 5

                UIView.animate(
                    withDuration: duration,
                    animations: { () -> Void in
                        self.view.frame = rect
                    }
                )
            }
        }

        @objc func keyboardWillHide(note: NSNotification) {
            /* 鍵盤隱藏時將畫面下移回原樣 */
            let keyboardAnimationDetail = note.userInfo as! [String: AnyObject]
            let duration = TimeInterval(truncating: keyboardAnimationDetail[UIResponder.keyboardAnimationDurationUserInfoKey]! as! NSNumber)

            UIView.animate(
                withDuration: duration,
                animations: { () -> Void in
                    self.view.frame = self.view.frame.offsetBy(dx: 0, dy: -self.view.frame.origin.y)
                }
            )
        }
    }
    
    
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


