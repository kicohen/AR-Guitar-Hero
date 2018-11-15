import Foundation
import UIKit
import ARKit

struct Point {
    var x : CGFloat
    var y : CGFloat
}

class Game {
    
    private var notes : Array<Note>
    private var timer : Timer
    private var sceneView : UIView
    
    init(sceneView: UIView) {
        self.notes = Array<Note>()
        self.timer = Timer()
        self.sceneView = sceneView
        createFace()
    }
    
    func start() {
        timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(self.gameLoop), userInfo: nil, repeats: true)
    }
    
    @objc func gameLoop() {
        var notesToRemove = Array<Int>()
        for i in 0..<notes.count {
            let note = notes[i]
            note.moveDown()
            note.move(location: getPosition(note: note))
            
            if note.getPosition() > 105 {
                notesToRemove.append(i)
            }
        }
        
        if Int.random(in: 0..<100) < 3 {
            let newNote = Note()
            newNote.draw(sceneView: sceneView)
            notes.append(newNote)
        }
        
        for note in notesToRemove {
            notes[note].destroy()
            notes.remove(at: note)
        }
        
    }
    
    func getPosition(note: Note) -> Point {
        let col = note.getCol()
        var point: Point = Point(x: 0, y: 0)
        point.y = CGFloat(note.getPosition()) * 7
        if col == 0 {
            point.x = (CGFloat(point.y - 65) / -3.6) + 200
        } else if col == 1 {
            point.x = (CGFloat(point.y - 105) / -5.30) + 244
        } else if col == 2 {
            point.x = (CGFloat(point.y - 65) / -24.3) + 300
        }

        return point
    }
    
    func left() {
        var notesToRemove = Array<Int>()
        for i in 0..<notes.count {
            let note = notes[i]
            note.moveDown()
            note.move(location: getPosition(note: note))
            
            if note.isInKillZone() && note.getCol() == 0 {
                notesToRemove.append(i)
                print("Destroyed by winking left eye")
            }
        }
        
        for note in notesToRemove {
            notes[note].destroy()
            notes.remove(at: note)
        }
    }
    
    func tongue() {
        var notesToRemove = Array<Int>()
        for i in 0..<notes.count {
            let note = notes[i]
            note.moveDown()
            note.move(location: getPosition(note: note))
            
            if note.isInKillZone() && note.getCol() == 1 {
                notesToRemove.append(i)
                print("Destroyed by sticking tongue out")
            }
        }
        
        for note in notesToRemove {
            notes[note].destroy()
            notes.remove(at: note)
        }
    }
    
    func right() {
        var notesToRemove = Array<Int>()
        for i in 0..<notes.count {
            let note = notes[i]
            note.moveDown()
            note.move(location: getPosition(note: note))
            
            if note.isInKillZone() && note.getCol() == 2 {
                notesToRemove.append(i)
                print("Destroyed by winking right eye")
            }
        }
        
        for note in notesToRemove {
            notes[note].destroy()
            notes.remove(at: note)
        }
    }
    
    func createFace() {
        let leftEye = UILabel(frame: CGRect(x: 200, y: 65, width: 60, height: 60))
        leftEye.textAlignment = .center
        leftEye.font = .boldSystemFont(ofSize: 45.0)
        leftEye.text = "👁️"
        
        let rightEye = UILabel(frame: CGRect(x: 300, y: 65, width: 60, height: 60))
        rightEye.textAlignment = .center
        rightEye.font = .boldSystemFont(ofSize: 45.0)
        rightEye.text = "👁️"
        
        let tongue = UILabel(frame: CGRect(x: 244, y: 105, width: 60, height: 60))
        tongue.textAlignment = .center
        tongue.font = .boldSystemFont(ofSize: 45.0)
        tongue.text = "👅"
        
        sceneView.addSubview(leftEye)
        sceneView.addSubview(rightEye)
        sceneView.addSubview(tongue)
    }
    
    func createFace2() {
        let leftEye = UILabel(frame: CGRect(x: 40, y: 551, width: 60, height: 60))
        leftEye.textAlignment = .center
        leftEye.font = .boldSystemFont(ofSize: 45.0)
        leftEye.text = "👁️"
        
        let rightEye = UILabel(frame: CGRect(x: 280, y: 551, width: 60, height: 60))
        rightEye.textAlignment = .center
        rightEye.font = .boldSystemFont(ofSize: 45.0)
        rightEye.text = "👁️"
        
        let tongue = UILabel(frame: CGRect(x: 160, y: 551, width: 60, height: 60))
        tongue.textAlignment = .center
        tongue.font = .boldSystemFont(ofSize: 45.0)
        tongue.text = "👅"
        
        sceneView.addSubview(leftEye)
        sceneView.addSubview(rightEye)
        sceneView.addSubview(tongue)
    }
    
}

