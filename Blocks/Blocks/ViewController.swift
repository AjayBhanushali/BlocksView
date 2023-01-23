//
//  ViewController.swift
//  Blocks
//
//  Created by Ajay Bhanushali on 23/01/23.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createBlocks(for: 3)
    }

    func createBlocks(for n: Int) {
        
        let blockWidth = view.bounds.width/CGFloat(n+2)
        let stackWidth = blockWidth*CGFloat(n)
        
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.distribution  = .fillEqually
        
        for r in 0..<n {
            let horizontalStackView = UIStackView()
            horizontalStackView.axis = .horizontal
            horizontalStackView.distribution  = .fillEqually
            
            for c in 0..<n {
                
                let blockView = UIView()
                if (r == 0 || r == n-1)
                    || (c == 0 || c == n-1)
                    || (r == c)
                    || ((r + c) == n-1)
                {
                    blockView.backgroundColor = .blue
                } else {
                    blockView.backgroundColor = .gray
                }

                horizontalStackView.addArrangedSubview(blockView)
            }
            
            verticalStackView.addArrangedSubview(horizontalStackView)
        }
        
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(verticalStackView)
        
        NSLayoutConstraint.activate([
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            verticalStackView.heightAnchor.constraint(equalToConstant: stackWidth),
            verticalStackView.widthAnchor.constraint(equalToConstant: stackWidth)
        ])
    }
    
}

