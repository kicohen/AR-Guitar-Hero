import Foundation
import UIKit
import ARKit

class Note {
    
    private var x: Int
    private var y: Int
    private var noteRect: UIView
    private var col: Int
    private var position: Int
    
    init(){
        self.x = 0
        self.y = -50
        self.col = Int.random(in: 0..<3)
        self.position = 0
        noteRect = UIView()
    }
    
    func move(location: Point) {
        noteRect.frame = CGRect(x: location.x, y: location.y, width: CGFloat(50), height: CGFloat(50))
    }
    
    func draw(sceneView: UIView) {
        noteRect.frame = CGRect(x: x, y: y, width: 50, height: 50)
        let emoji = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        emoji.textAlignment = .center
        emoji.font = .boldSystemFont(ofSize: 45.0)
        if (col == 1) {
            emoji.text = "👅"
        } else {
            emoji.text = "👁️"
        }
        noteRect.addSubview(emoji)
        sceneView.addSubview(noteRect)
    }
    
    func moveDown() {
        self.position += 1
    }
    
    func getPosition() -> Int {
        return self.position
    }
    
    func getCol() -> Int {
        return self.col
    }
    
    func isInKillZone() -> Bool {
        return self.position > Constants.START_KILL_ZONE && self.position < Constants.END_KILL_ZONE
    }
    
    func destroy() {
        noteRect.removeFromSuperview()
    }
}
