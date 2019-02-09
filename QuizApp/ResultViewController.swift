//
//  ResultViewController.swift
//  QuizApp
//
//  Created by 寺島 洋平 on 2019/02/09.
//  Copyright © 2019年 YoheiTerashima. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    // 正答率のラベル
    @IBOutlet weak var correctPercentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 問題数を取得する
        let questionCount = QuestionDataManager.sharedInstance.questionDataArray.count
        
        // 正答数を取得する
        var correctCount: Int = 0
        
        // 正答数を計算する
        for questionData in QuestionDataManager.sharedInstance.questionDataArray {
            if questionData.isCorrect() {
                // 正答数を増やす
                correctCount += 1
            }
        }
        
        // 正答率を計算する
        let correctPercent: Float = (Float(correctCount) / Float(questionCount)) * 100
        
        // 正答率を少数第一位まで計算して画面に反映する
        correctPercentLabel.text = String(format: "%.1f", correctPercent) + "%"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
