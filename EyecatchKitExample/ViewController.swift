/*
 The MIT License (MIT)
 
 Copyright (c) 2018 salexkidd.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */
import Cocoa
import EyecatchKit


let ImagesNames: [Int: NSImage.Name] = [
    0: NSImage.Name(rawValue: "Hellox1"),
    1: NSImage.Name(rawValue: "Hellox2"),
    2: NSImage.Name(rawValue: "funx1"),
    3: NSImage.Name(rawValue: "funx2"),

]


class EyecatchData: NSObject {
    @objc dynamic var imageNumber: Int = 0
    @objc dynamic var fadeoutInterval: Float = 0.45
    @objc dynamic var fadeoutDulation: Float = 0.2
    @objc dynamic var XAxisPercentage: Float = 0.5
    @objc dynamic var YAxisPercentage: Float = 0.5
    @objc dynamic var imageAlphaValue: Float = 0.9
}

class ViewController: NSViewController {

    @IBOutlet var eyeCatchData: EyecatchData!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func flashingEyecatch(_ sender: Any) {
        
        let image = NSImage(named: ImagesNames[eyeCatchData.imageNumber]!)
        ECEyecatch.flash(
            sender: self,
            image: image!,
            fadeoutInterval: TimeInterval(eyeCatchData.fadeoutInterval),
            fadeoutDulation: TimeInterval(eyeCatchData.fadeoutDulation),
            imageAlphaValue: CGFloat(eyeCatchData.imageAlphaValue),
            XAxisPercentage: eyeCatchData.XAxisPercentage,
            YAxisPercentage: eyeCatchData.YAxisPercentage
        ) {
            print("Flash End.")
        }
    }
    
}

