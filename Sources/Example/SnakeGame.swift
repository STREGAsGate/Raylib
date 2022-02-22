/**
 * Copyright (c) 2022 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

/* Based on raysan5's original game https://github.com/raysan5/raylib-games/blob/master/classics/src/snake.c */

import Raylib

//MARK: - Types and Structures Definition
extension SnakeGame {
    struct Snake {
        var position: Vector2 = .zero
        var size: Vector2 = .zero
        var speed: Vector2 = .zero
        var color: Color = .darkBlue
    }
    
    struct Food {
        var position: Vector2 = .zero
        var size: Vector2 = .zero
        var isActive: Bool = true
        var color: Color = .skyBlue
    }
}

class SnakeGame {
    //MARK: - Some Defines
    let squareSize: Float = 31
    
    //MARK: - Global Variables Declaration
    let screenWidth: Int32 = 800
    let screenHeight: Int32 = 450
    
    var framesElapsed: Int32 = 0
    var isGameOver: Bool = false
    var isGamePaused: Bool = false
    
    static let snakeMaxSegments: Int = 256
    var snake: [Snake] = Array(repeating: Snake(), count: snakeMaxSegments)
    var snakePosition: [Vector2] = Array(repeating: .zero, count: snakeMaxSegments)
    var allowMove: Bool = false
    var offset: Vector2 = .zero
    var snakeSegmentCount = 0
    var fruit: Food = Food()
    
    
    func run() {
        //MARK: - Initialization
        Raylib.initWindow(screenWidth, screenHeight, "Classic Game: Snake")
        Raylib.setTargetFPS(60)
        self.setupGame()
        
        //MARK: - Main game loop
        while Raylib.windowShouldClose == false /* Detect window close button or ESC key */ {
            //MARK: - Update and Draw
            self.updateGame()
            self.drawGame()
        }
        
        //MARK: - De-Initialization
        
        // Close window and OpenGL context
        Raylib.closeWindow()
    }
    
    deinit {
        // Unload loaded data (textures, sounds, models...)
    }
}

//MARK: - Initialize game variables
extension SnakeGame {
    func setupGame() {
        framesElapsed = 0
        isGameOver = true
        isGamePaused = false
        
        snakeSegmentCount = 1
        allowMove = false
        
        offset.x = Float(screenWidth).truncatingRemainder(dividingBy: squareSize)
        offset.y = Float(screenHeight).truncatingRemainder(dividingBy: squareSize)
        
        for i in 0 ..< SnakeGame.snakeMaxSegments {
            snake[i].position = Vector2(x: offset.x / 2, y: offset.y / 2)
            snake[i].size = Vector2(x: squareSize, y: squareSize)
            snake[i].speed = Vector2(x: squareSize, y: 0)
            
            if i == 0 {
                snake[i].color = .darkBlue
            }else{
                snake[i].color = .blue
            }
        }
        
        for i in 0 ..< SnakeGame.snakeMaxSegments {
            snakePosition[i] = .zero
        }
        
        fruit.size = Vector2(x: squareSize, y: squareSize)
        fruit.color = .skyBlue
        fruit.isActive = false
    }
}

//MARK: - Update game (one frame)
extension SnakeGame {
    func updateGame() {
        if isGameOver == false {
            if Raylib.isKeyPressed(.letterP) {
                isGamePaused = !isGamePaused
            }
            
            guard isGamePaused == false else {return}
            
            // Player control
            if Raylib.isKeyPressed(.right) && snake[0].speed.x == 0 && allowMove {
                snake[0].speed = Vector2(x: squareSize, y: 0)
                allowMove = false
            }
            if Raylib.isKeyPressed(.left) && snake[0].speed.x == 0 && allowMove {
                snake[0].speed = Vector2(x: -squareSize, y: 0)
                allowMove = false
            }
            if Raylib.isKeyPressed(.up) && snake[0].speed.y == 0 && allowMove {
                snake[0].speed = Vector2(x: 0, y: -squareSize)
                allowMove = false;
            }
            if Raylib.isKeyPressed(.down) && snake[0].speed.y == 0 && allowMove {
                snake[0].speed = Vector2(x: 0, y: squareSize)
                allowMove = false
            }
            
            // Snake movement
            for i in 0 ..< snakeSegmentCount {
                snakePosition[i] = snake[i].position
            }
            
            if (framesElapsed % 5) == 0 {
                for i in 0 ..< snakeSegmentCount {
                    if i == 0 {
                        snake[0].position.x += snake[0].speed.x
                        snake[0].position.y += snake[0].speed.y
                        allowMove = true
                    }else{
                        snake[i].position = snakePosition[i - 1]
                    }
                }
            }
            
            // Wall behaviour
            if (snake[0].position.x > Float(screenWidth) - offset.x) || (snake[0].position.y > Float(screenHeight) - offset.y) || (snake[0].position.x < 0) || (snake[0].position.y < 0) {
                isGameOver = true
            }
            
            // Collision with yourself
            for i in 1 ..< snakeSegmentCount {
                if (snake[0].position.x == snake[i].position.x) && (snake[0].position.y == snake[i].position.y) {
                    isGameOver = true
                }
            }
            
            // Fruit position calculation
            if fruit.isActive == false {
                fruit.isActive = true;
                func getPosition() -> Vector2 {
                    let positionX: Float = Float(Int32.random(in: 0 ..< Int32(screenWidth) / Int32(squareSize))) * squareSize + offset.x / 2
                    let positionY: Float = Float(Int32.random(in: 0 ..< Int32(screenHeight) / Int32(squareSize))) * squareSize + offset.y / 2
                    return Vector2(x: positionX, y: positionY)
                }
                fruit.position = getPosition()
                
                for var i in 0 ..< snakeSegmentCount {
                    while fruit.position.x == snake[i].position.x && fruit.position.y == snake[i].position.y {
                        fruit.position = getPosition()
                        i = 0
                    }
                }
            }
            
            // Collision
            if snake[0].position.x < fruit.position.x + fruit.size.x && snake[0].position.x + snake[0].size.x > fruit.position.x &&
                snake[0].position.y < fruit.position.y + fruit.size.y && snake[0].position.y + snake[0].size.y > fruit.position.y {
                snake[snakeSegmentCount].position = snakePosition[snakeSegmentCount - 1]
                snakeSegmentCount += 1
                fruit.isActive = false
            }
            
            framesElapsed += 1
        }else{
            if Raylib.isKeyPressed(.enter) {
                setupGame()
                isGameOver = false
            }
        }
    }
}

//MARK: - Draw game (one frame)
extension SnakeGame {
    func drawGame() {
        Raylib.beginDrawing()
        Raylib.clearBackground(.rayWhite)
        
        if isGameOver == false {
            // Draw grid lines
            for i in 0 ... screenWidth / Int32(squareSize) {
                let position1 = Vector2(x: squareSize * Float(i) + offset.x / 2, y: offset.y / 2)
                let position2 = Vector2(x: squareSize * Float(i) + offset.x / 2, y: Float(screenHeight) - offset.y / 2)
                Raylib.drawLineV(position1, position2, .lightGray)
            }
            
            for i in 0 ... screenHeight / Int32(squareSize) {
                let position1 = Vector2(x: offset.x / 2, y: squareSize * Float(i) + offset.y / 2)
                let position2 = Vector2(x: Float(screenWidth) - offset.x / 2, y: squareSize * Float(i) + offset.y / 2)
                Raylib.drawLineV(position1, position2, .lightGray)
            }
            
            // Draw snake
            for i in 0 ..< snakeSegmentCount {
                Raylib.drawRectangleV(snake[i].position, snake[i].size, snake[i].color)
            }
            
            // Draw fruit to pick
            Raylib.drawRectangleV(fruit.position, fruit.size, fruit.color)
            
            if isGamePaused {
                let text = "GAME PAUSED"
                let fontSize: Int32 = 40
                let textWidth = Raylib.measureText(text, fontSize)
                Raylib.drawText(text, screenWidth / 2 - textWidth / 2, screenHeight / 2 - fontSize, fontSize, .gray)
            }
        }else{
            let text = "PRESS [ENTER] TO PLAY AGAIN"
            let fontSize: Int32 = 20
            let textWidth = Raylib.measureText(text, fontSize)
            Raylib.drawText(text, screenHeight / 2 - textWidth / 2, screenHeight / 2 - 50, fontSize, .gray)
        }
        
        Raylib.endDrawing()
    }
}
