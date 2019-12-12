//
//  Main.swift
//  Simple_App_Unit_Tests
//
//  Created by Alvaro Vinicius do Nascimento Fernandes on 09/12/19.
//  Copyright © 2019 Alvaro Vinicius do Nascimento Fernandes. All rights reserved.
//

import Foundation
import UIKit

class Main: UIViewController {
    
    let home = HomeViewController()
    
    @IBAction func go(_ sender: Any) {
        present(home, animated: true)
    }
}
