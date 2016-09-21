//
//  NumericScreen.swift
//  Calculator
//
//  Created by JAVIER CALATRAVA LLAVERIA on 21/09/16.
//  Copyright © 2016 JAVIER CALATRAVA LLAVERIA. All rights reserved.
//

import UIKit

enum Key: Int {
    case key0 = 0
    case key1
    case key2
    case key3
    case key4
    case key5
    case key6
    case key7
    case key8
    case key9
    case keyAdd
    case keySubstract
    case keyEqual
}

class Keypad: UIView {
    
    @IBOutlet weak var btnKey0: UIButton!{
        didSet{
            btnKey0.tag = Key.key0.rawValue
        }
    }
    
    @IBOutlet weak var btnKey1: UIButton!{
        didSet{
            btnKey1.tag = Key.key1.rawValue
        }
    }
    
    @IBOutlet weak var btnKey2: UIButton!{
        didSet{
            btnKey2.tag = Key.key2.rawValue
        }
    }
    
    @IBOutlet weak var btnKey3: UIButton!{
        didSet{
            btnKey3.tag = Key.key3.rawValue
        }
    }
    
    @IBOutlet weak var btnKey4: UIButton!{
        didSet{
            btnKey4.tag = Key.key4.rawValue
        }
    }
    
    @IBOutlet weak var btnKey5: UIButton!{
        didSet{
            btnKey5.tag = Key.key5.rawValue
        }
    }
    
    @IBOutlet weak var btnKey6: UIButton!{
        didSet{
            btnKey6.tag = Key.key6.rawValue
        }
    }
    
    @IBOutlet weak var btnKey7: UIButton!{
        didSet{
            btnKey7.tag = Key.key7.rawValue
        }
    }
    
    @IBOutlet weak var btnKey8: UIButton!{
        didSet{
            btnKey8.tag = Key.key8.rawValue
        }
    }
    
    @IBOutlet weak var btnKey9: UIButton!{
        didSet{
            btnKey9.tag = Key.key9.rawValue
        }
    }
    
    @IBOutlet weak var btnKeyAdd: UIButton!{
        didSet{
            btnKeyAdd.tag = Key.keyAdd.rawValue
        }
    }
    
    @IBOutlet weak var btnKeySubstract: UIButton!{
        didSet{
            btnKeySubstract.tag = Key.keySubstract.rawValue
        }
    }
    
    @IBOutlet weak var btnKeyEqual: UIButton!{
        didSet{
            btnKeyEqual.tag = Key.keyEqual.rawValue
        }
    }
    
    
    var onKeyPress: ((Key) -> Void)?
    
    @IBAction func keyPressed(sender: AnyObject) {
        
        guard let button = sender as? UIButton else {
            return
        }
        
        guard let _ = onKeyPress else{
            return
        }
        
        self.onKeyPress!(Key(rawValue: button.tag)!)

    }
    
}
