import 'package:polymer/polymer.dart';

import 'dart:html';
import 'dart:async';

import 'package:rikulo_ui/effect.dart';


@CustomTag("snake-game")
class SnakeGame extends PolymerElement {
  
  final int speed = 100;
  final int width = 400;
  final int height = 250;
  final num grid = 10; // size of the elements in the game
  
  num _score = 0;
  num get score => _score;
  set score(num score) {
    _score = score;
    scoreBar.text = "Your score is: ${score}";
  }
  
  CanvasElement canvas;
  Element scoreBar;
  CanvasRenderingContext2D ctx2d;
  StreamSubscription<MouseEvent> streamsub;
  
  SnakeGame.created() : super.created() {
      canvas = shadowRoot.querySelector("#snake_game canvas");
      scoreBar = shadowRoot.querySelector("#snake_game p");

      config();
      
      startGame();
    } 
  
  void config() {
    canvas.attributes.putIfAbsent("width", () => "${width}px");
    canvas.attributes.putIfAbsent("height", () => "${height}px");
    ctx2d = canvas.context2D;
    
    this.scoreBar = scoreBar;
    scoreBar.attributes.putIfAbsent("width", () => "flex");
    scoreBar.attributes.putIfAbsent("height", () => "30");
    scoreBar.text = "Your score is: ${score}";
    
    document.onKeyDown.listen(changePosition);
  }
  
  void animateGame() {
    int lastCycle = 0;
    
    new Animator().add((int time) {
      int timeSinceCycle = time - lastCycle;
      bool alive = true;
      
      if(timeSinceCycle > speed) {
        lastCycle = time;
        alive = updateGame();
      }
      
      return alive;
    });
  }
  
  void gameOver() {
    // Update text
    scoreBar.text = "Game Over, your score was ${score}. Click to retry.";
    streamsub = canvas.onClick.listen((event) => restartGame());
    
    // Fire "score-updated" event to warn other components
    this.fire("score-updated", detail: score);
  }
  
  void restartGame() {
    streamsub.cancel();
    startGame();
  }
  
  void startGame() {
    score = 0;
    
    // TODO : initialize snake
    
    // TODO : initialize food 

      animateGame();
  }
  

  
  /**
   * Update the situation of the game
   */
  bool updateGame() {
    bool alive = true;
    
    // TODO : move snake
    
    // TODO : apply rules
    
    // update view
    this.draw(ctx2d);
    
    return alive;
  }
  
  
  void changePosition(KeyboardEvent event) {
      if(event.keyCode == 37){
        // TODO : go left        
      } else if(event.keyCode == 39) {
        // TODO : go right        
      } else if(event.keyCode == 38) {
        // TODO : go up        
      } else if(event.keyCode == 40) {
        // go down        
      }
  }
  
  void draw(CanvasRenderingContext2D context) {
    context.clearRect(0, 0, width, height);
    // TODO : draw snake
    // TODO : draw food
  }
  
  
}