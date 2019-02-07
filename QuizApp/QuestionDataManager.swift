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
    
    // MARK: Methods
    // クラスが生成された時の処理
    init(questionsourceDataArray: [String]) {
        question = questionsourceDataArray[0]
        answer1 = questionsourceDataArray[1]
        answer2 = questionsourceDataArray[2]
        answer3 = questionsourceDataArray[3]
        answer4 = questionsourceDataArray[4]
        correctAnswerNumber = Int(questionsourceDataArray[5])!
    }
   
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

// クイズデータ全般の管理と成績を管理するクラス
class QuestionDataManager {
    
    // MARK: Properties
    
    // シングルトンオブジェクトを生成
    static let sharedInstance = QuestionDataManager()
    
    // 問題を格納するための配列
    var questionDataArray = [QuestionData]()
    
    // 現在の問題のインデックス
    var nowQuestionIndex: Int = 0
    
    // MARK: Methods
    // 初期化処理
    // シングルトンであることを保証するためにprivateで宣言しておく
    private init() {
        
    }
    
    // 問題文の読み込み処理
    func loadQuestion() {
        // 格納済みの問題文があれば一旦削除しておく
        questionDataArray.removeAll()
        
        // 現在の問題のインデックスを初期化
        nowQuestionIndex = 0
        
        // csvファイルパスを取得
        guard let csvFilePath = Bundle.main.path(forResource: "question", ofType: "csv") else {
            // csvファイルがない
            print("csvファイルが存在しません")
            return
        }
        
        // csvファイルを読み込み
        do {
            let csvStringData = try String(contentsOfFile: csvFilePath, encoding: String.Encoding.utf8)
            // csvデータを1行づつ読み込む
            csvStringData.enumerateLines(invoking: { (line, stop) in
                // カンマ区切りで分割
                let questionDataSourceArray = line.components(separatedBy: ",")
                // 問題データを格納するオブジェクトを作成
                let questionData = QuestionData(questionsourceDataArray: questionDataSourceArray)
                // 問題を追加
                self.questionDataArray.append(questionData)
                // 問題番号を設定
                questionData.questionNo = self.questionDataArray.count
            })
        } catch let error {
            print("csvファイル読み込みエラーが発生しました:\(error)")
            return
        }
    }
    
    // 次の問題文を取り出す
    func nextQuestion() -> QuestionData? {
        if nowQuestionIndex < questionDataArray.count {
            let nextQuestion = questionDataArray[nowQuestionIndex]
            nowQuestionIndex += 1
            return nextQuestion
        }
        return nil
    }
    
    
}
