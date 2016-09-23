//
//  NumericScreen.swift
//  Calculator
//
//  Created by JAVIER CALATRAVA LLAVERIA on 21/09/16.
//  Copyright © 2016 JAVIER CALATRAVA LLAVERIA. All rights reserved.
//

import UIKit

protocol KeypadDelegate: class {
    func onKeyPressed(_ key: Key)
}

class Keypad: UIView {
    
    weak var delegate:KeypadDelegate?
    
    @IBOutlet weak var btnKey0: UIButton!{
        didSet{
            btnKey0.tag = Key.key0.rawValue
            btnKey0.layer.borderWidth = 1
            btnKey0.layer.borderColor = UIColor.gray.cgColor
        }
    }
    
    @IBOutlet weak var btnKey1: UIButton!{
        didSet{
            btnKey1.tag = Key.key1.rawValue
            btnKey1.layer.borderWidth = 1
            btnKey1.layer.borderColor = UIColor.gray.cgColor
        }
    }
    
    @IBOutlet weak var btnKey2: UIButton!{
        didSet{
            btnKey2.tag = Key.key2.rawValue
            btnKey2.layer.borderWidth = 1
            btnKey2.layer.borderColor = UIColor.gray.cgColor
        }
    }
    
    @IBOutlet weak var btnKey3: UIButton!{
        didSet{
            btnKey3.tag = Key.key3.rawValue
            btnKey3.layer.borderWidth = 1
            btnKey3.layer.borderColor = UIColor.gray.cgColor
        }
    }
    
    @IBOutlet weak var btnKey4: UIButton!{
        didSet{
            btnKey4.tag = Key.key4.rawValue
            btnKey4.layer.borderWidth = 1
            btnKey4.layer.borderColor = UIColor.gray.cgColor
        }
    }
    
    @IBOutlet weak var btnKey5: UIButton!{
        didSet{
            btnKey5.tag = Key.key5.rawValue
            btnKey5.layer.borderWidth = 1
            btnKey5.layer.borderColor = UIColor.gray.cgColor
        }
    }
    
    @IBOutlet weak var btnKey6: UIButton!{
        didSet{
            btnKey6.tag = Key.key6.rawValue
            btnKey6.layer.borderWidth = 1
            btnKey6.layer.borderColor = UIColor.gray.cgColor
        }
    }
    
    @IBOutlet weak var btnKey7: UIButton!{
        didSet{
            btnKey7.tag = Key.key7.rawValue
            btnKey7.layer.borderWidth = 1
            btnKey7.layer.borderColor = UIColor.gray.cgColor
        }
    }
    
    @IBOutlet weak var btnKey8: UIButton!{
        didSet{
            btnKey8.tag = Key.key8.rawValue
            btnKey8.layer.borderWidth = 1
            btnKey8.layer.borderColor = UIColor.gray.cgColor
        }
    }
    
    @IBOutlet weak var btnKey9: UIButton!{
        didSet{
            btnKey9.tag = Key.key9.rawValue
            btnKey9.layer.borderWidth = 1
            btnKey9.layer.borderColor = UIColor.gray.cgColor
        }
    }
    
    @IBOutlet weak var btnKeyAdd: UIButton!{
        didSet{
            btnKeyAdd.tag = Key.keyAdd.rawValue
            btnKeyAdd.layer.borderWidth = 1
            btnKeyAdd.layer.borderColor = UIColor.orange.cgColor
        }
    }
    
    @IBOutlet weak var btnKeySubstract: UIButton!{
        didSet{
            btnKeySubstract.tag = Key.keySubstract.rawValue
            btnKeySubstract.layer.borderWidth = 1
            btnKeySubstract.layer.borderColor = UIColor.gray.cgColor
        }
    }
    
    @IBOutlet weak var btnKeyEqual: UIButton!{
        didSet{
            btnKeyEqual.tag = Key.keyEqual.rawValue
            btnKeyEqual.layer.borderWidth = 1
            btnKeyEqual.layer.borderColor = UIColor.gray.cgColor
        }
    }
    
    @IBOutlet weak var btnKeyPoint: UIButton!{
        didSet{
            btnKeyPoint.tag = Key.keyPoint.rawValue
            btnKeyPoint.layer.borderWidth = 1
            btnKeyPoint.layer.borderColor = UIColor.gray.cgColor
        }
    }
    
    var onKeyPress: ((Key) -> Void)?
    
    @IBAction func keyPressed(_ sender: UIButton) {
        self.delegate!.onKeyPressed(Key(rawValue: sender.tag)!)
    }
    
}
