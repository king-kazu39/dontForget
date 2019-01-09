//
//  subQuestionViewController.swift
//  myPrApp
//
//  Created by 仲里和也 on 2019/01/09.
//  Copyright © 2019 Kazuya Nakazato. All rights reserved.
//

import UIKit

var labelArray:[String?] = []


class subQuestionViewController: UIViewController {

    // section毎の画像配列
    let singleManImg: [String?] = [
        "key","pc",
        "wallet","doc",
        "camera","plus"]
    
    let singleWomanImg: [String?] = [
        "key","pc",
        "wallet","cosme",
        "camera","plus"]
    
    let petImg: [String?] = [
        "key","pc",
        "pet","window",
        "camera","plus"]
    
    let marriedImg: [String?] = [
        "key","pc",
        "food","married",
        "camera","plus"]
    
    let studentImg: [String?] = [
        "key","pc",
        "wallet","book",
        "camera","plus"]
    
    let childImg: [String?] = [
        "key","lunchbox",
        "cap","book",
        "camera","plus"]
    
    let userTypeImg: [String?] = ["camera","plus"]
    
    
    //section毎の質問配列(Japanese)
    let jpnSmLabel: [String?] = [
        "鍵持った？","PC持った？",
        "財布持った？","会議で使う資料持った？",
        "身だしなみを整えよう","確認項目を追加する"]
    
    let jpnSwLabel: [String?] = [
        "鍵持った？","PC持った？",
        "財布持った？","化粧ポーチ持った？",
        "身だしなみを整えよう","確認項目を追加する"]
    
    let jpnPetLabel: [String?] = [
        "鍵持った？","PC持った？",
        "ペットに餌やった？","戸締りした？",
        "身だしなみを整えよう","確認項目を追加する"]
    
    let jpnMarriedLabel: [String?] = [
        "鍵持った？","PC持った？",
        "ご飯食べた？","ハニーに行ってきますした？",
        "身だしなみを整えよう","確認項目を追加する"]
    
    let jpnStudentLabel: [String?] = [
        "鍵持った？","PC持った？",
        "財布持った？","教科書持った？",
        "身だしなみを整えよう","確認項目を追加する"]
    
    let jpnChildLabel: [String?] = [
        "鍵持った？","帽子持った？",
        "弁当持った？","教科書持った？",
        "身だしなみを整えよう","確認項目を追加する"]
    
    let jpnUserTypeLabel: [String?] = ["身だしなみを整えよう","確認項目を追加する"]
    
    
    //section毎の質問配列(English)
    let engSmLabel: [String?] = [
        "Do you have your key？","Do you have your PC？",
        "Do you have your wallet？","Do you have your document?",
        "When you are well-groomed,Take a picture.","add a question"]
    
    let engSwLabel: [String?] = [
        "Do you have your key？","Do you have your PC？",
        "Do you have your wallet？","Do you have your cosmetic？",
        "When you are well-groomed,Take a picture.","add a question"]
    
    let engPetLabel: [String?] = [
        "Do you have your key？","Do you have your PC？",
        "Did you give your pet his food？","Do you look up your house？",
        "When you are well-groomed,Take a picture.","add a question"]
    
    let engMarriedLabel: [String?] = [
        "Do you have your key？","Do you have your PC？",
        "Did you eat breakfast？",
        "Did you say to your sweetheart,「I'm going!」？",
        "When you are well-groomed,Take a picture.","add a question"]
    
    let engStudentLabel: [String?] = [
        "Do you have your key？","Do you have your PC？",
        "Do you have your wallet？","Do you have your textbook？",
        "When you are well-groomed,Take a picture.","add a question"]
    
    let engChildLabel: [String?] = [
        "Do you have your key？","Do you have your cap？",
        "Do you have your lunchbox？","Do you have your textbook？",
        "When you are well-groomed,Take a picture.","add a question"]
    
    let engUserTypeLabel: [String?] = ["When you are well-groomed,Take a picture.","add a question"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    //日本語の質問をする関数
    func selectJpn(selectedImg: String){
        
    
        if selectedImg == "singleman" {
            questImg = singleManImg
            labelArray = jpnSmLabel
        } else if selectedImg == "singlewoman"{
            questImg = singleWomanImg
            labelArray = jpnSwLabel
        } else if selectedImg == "pet" {
            questImg = petImg
            labelArray = jpnPetLabel
        } else if selectedImg == "married" {
            questImg = marriedImg
            labelArray = jpnMarriedLabel
        } else if selectedImg == "student" {
            questImg = studentImg
            labelArray = jpnStudentLabel
        } else if selectedImg == "child" {
            questImg = childImg
            labelArray = jpnChildLabel
        } else if selectedImg == "usertype" {
            questImg = userTypeImg
            labelArray = jpnUserTypeLabel
        }
    
    }
    
    
    //英語の質問をする関数
    func selectEng(selectedImg: String){
        
        
        if selectedImg == "singleman" {
            questImg = singleManImg
            labelArray = engSmLabel
        } else if selectedImg == "singlewoman"{
            questImg = singleWomanImg
            labelArray = engSwLabel
        } else if selectedImg == "pet" {
            questImg = petImg
            labelArray = engPetLabel
        } else if selectedImg == "married" {
            questImg = marriedImg
            labelArray = engMarriedLabel
        } else if selectedImg == "student" {
            questImg = studentImg
            labelArray = engStudentLabel
        } else if selectedImg == "child" {
            questImg = childImg
            labelArray = engChildLabel
        } else if selectedImg == "usertype" {
            questImg = userTypeImg
            labelArray = engUserTypeLabel
        }
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
