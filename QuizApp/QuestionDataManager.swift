//
//  QuestionDataManager.swift
//  QuizApp
//
//  Created by 寺島 洋平 on 2019/02/07.
//  Copyright © 2019年 YoheiTerashima. All rights reserved.
//

import Foundation

// 一つの問題に関する情報を格納するデータクラス
class QuestionData {
    
    // MARK: Properties
    // 問題文
    var question: String
    
    // 選択肢1
    var answer1: String
    
    // 選択肢2
    var answer2: String

    // 選択肢3
    var answer3: String

    // 選択肢4
    var answer4: String

    // 正解の番号
    var correctAnswerNumber: Int
    
    // ユーザーが選択した選択肢の番号
    var userChoiceAnswerNumber: Int?
    
    // 問題文の番号
    var questionNo: Int = 0
    
    // クラスが生成された時の処理
    init(questionsourceDataArray: [String]) {
        question = questionsourceDataArray[0]
        answer1 = questionsourceDataArray[1]
        answer2 = questionsourceDataArray[2]
        answer3 = questionsourceDataArray[3]
        answer4 = questionsourceDataArray[4]
        correctAnswerNumber = Int(questionsourceDataArray[5])!
    }
    
    // MARK: Methods
    // ユーザーが選択した答えが正解かどうか判定する
    func isCorrect() -> Bool {
        // 答えが一致しているかどうか判定する
        if correctAnswerNumber == userChoiceAnswerNumber {
            // 正解
            return true
        }
        // 不正解
        return false
    }
}
