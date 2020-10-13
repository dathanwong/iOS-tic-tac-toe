//
//  ViewController.swift
//  TicTacToe
//
//  Created by Dathan Wong on 10/11/20.
//  Copyright © 2020 Dathan Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var topLeftButton: UIButton!
    @IBOutlet weak var topMidButton: UIButton!
    @IBOutlet weak var topRightButton: UIButton!
    @IBOutlet weak var midLeftButton: UIButton!
    @IBOutlet weak var midMidButton: UIButton!
    @IBOutlet weak var midRightButton: UIButton!
    @IBOutlet weak var botLeftButton: UIButton!
    @IBOutlet weak var botMidButton: UIButton!
    @IBOutlet weak var botRightButton: UIButton!
    @IBAction func topLeftClick(_ sender: UIButton) {
        if(!gameOver){
            topLeftButton.backgroundColor = handleClick(row: 0, col: 0)
            checkWin()
        }
    }
    @IBAction func topMidClick(_ sender: UIButton) {
        if(!gameOver){
            topMidButton.backgroundColor = handleClick(row: 0, col: 1)
            checkWin()
        }
    }
    @IBAction func topRightClick(_ sender: UIButton) {
        if(!gameOver){
            topRightButton.backgroundColor = handleClick(row: 0, col: 2)
            checkWin()
        }
    }
    @IBAction func midLeftClick(_ sender: UIButton) {
        if(!gameOver){
            midLeftButton.backgroundColor = handleClick(row: 1, col: 0)
            checkWin()
        }
    }
    @IBAction func midMidClick(_ sender: UIButton) {
        if(!gameOver){
            midMidButton.backgroundColor = handleClick(row: 1, col: 1)
            checkWin()
        }
    }
    @IBAction func midRightClick(_ sender: UIButton) {
        if(!gameOver){
            midRightButton.backgroundColor = handleClick(row: 1, col: 2)
            checkWin()
        }
    }
    @IBAction func botLeftClick(_ sender: UIButton) {
        if(!gameOver){
            botLeftButton.backgroundColor = handleClick(row: 2, col: 0)
            checkWin()
        }
        
    }
    @IBAction func botMidClick(_ sender: UIButton) {
        if(!gameOver){
            botMidButton.backgroundColor = handleClick(row: 2, col: 1)
            checkWin()
        }
        
    }
    @IBAction func botRightClick(_ sender: UIButton) {
        if(!gameOver){
            botRightButton.backgroundColor = handleClick(row: 2, col: 2)
            checkWin()
        }
        
    }
    @IBAction func resetClick(_ sender: UIButton) {
        resetBoard()
    }
    
    var tiles = [[0, 0, 0], [0,0,0], [0,0,0]]
    var blueTurn = true
    var gameOver = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winnerLabel.text = ""
    }

    
    /// Handle tile click
    /// - Parameters:
    ///   - row: row of clicked tile
    ///   - col: col of clicked tile
    func handleClick(row: Int, col: Int) -> UIColor{
        //Check if tile has already been clicked
        if(tiles[row][col] == 0){
            if(blueTurn){
                tiles[row][col] = 1
                blueTurn.toggle()
                return UIColor.blue
            }else{
                tiles[row][col] = 2
                blueTurn.toggle()
                return UIColor.red
            }
        }else{
            if(tiles[row][col] == 1){
                return UIColor.blue
            }else{
                return UIColor.red
            }
        }
    }

    
    /// Check if somebody has won
    /// - Returns: 1 if blue wins, 2 if red wins, 3 if draw, 0 if game not over
    func checkWin(){
        if(checkDraw()){
            setLabel(winner: 3)
            gameOver = true
        }
        let winRow = checkRows()
        let winCol = checkCols()
        let winCross = checkCross()
        if(winRow != 0){
            setLabel(winner: winRow)
            gameOver = true
        }
        if(winCol != 0){
            setLabel(winner: winCol)
            gameOver = true
        }
        if(winCross != 0){
            setLabel(winner: winCross)
            gameOver = true
        }
    }
    
    func setLabel(winner: Int){
        if(winner == 0){
            winnerLabel.text="Draw"
        }
        if(winner == 1){
            winnerLabel.text = "Blue wins"
        }
        if(winner == 2){
            winnerLabel.text = "Red wins"
        }
    }
    
    func checkDraw() -> Bool{
        for i in 0...2 {
            for j in 0...2 {
                if(tiles[i][j] == 0){
                    return false
                }
            }
        }
        return true
    }
    
    func checkRows() -> Int{
        for i in 0...2{
            if tiles[i][0] > 0 && tiles[i][0] == tiles[i][1] && tiles[i][1] == tiles[i][2]{
                return tiles[i][0]
            }
        }
        return 0
    }
    
    func checkCols() -> Int{
        for i in 0...2{
            if tiles[0][i] > 0 && tiles[0][i] == tiles[1][i] && tiles[1][i] == tiles[2][i]{
                return tiles[0][i]
            }
        }
        return 0
    }
    
    func checkCross() -> Int{
        if tiles[0][0] == tiles[1][1] && tiles[1][1] == tiles[2][2]{
            return tiles[0][0]
        }
        if(tiles[0][2] == tiles[1][1] && tiles[1][1] == tiles[2][0]){
            return tiles[0][2]
        }
        return 0
    }
    
    func resetBoard(){
        gameOver = false
        blueTurn = true
        tiles = [[0, 0, 0], [0,0,0], [0,0,0]]
        winnerLabel.text = ""
        topMidButton.backgroundColor = UIColor.gray
        topLeftButton.backgroundColor = UIColor.gray
        topRightButton.backgroundColor = UIColor.gray
        midLeftButton.backgroundColor = UIColor.gray
        midMidButton.backgroundColor = UIColor.gray
        midRightButton.backgroundColor = UIColor.gray
        botLeftButton.backgroundColor = UIColor.gray
        botMidButton.backgroundColor = UIColor.gray
        botRightButton.backgroundColor = UIColor.gray
    }
}

