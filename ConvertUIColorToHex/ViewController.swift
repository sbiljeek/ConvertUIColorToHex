//
//  ViewController.swift
//  ConvertUIColorToHex
//
//  Created by Salman Biljeek on 2/20/23.
//

import UIKit

class ViewController: UIViewController {
    
    let uiColor: UIColor = .systemIndigo
    
    let hexLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 40)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return label
    }()
    
    lazy var uiColorView: UIView = {
        let view = UILabel()
        view.backgroundColor = self.uiColor
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 80).isActive = true
        view.heightAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        
        let hex = self.uiColorToHex(uiColor: self.uiColor)
        self.hexLabel.text = hex
        
        let convertLabel: UILabel = {
            let label = UILabel()
            label.text = "Convert"
            label.textColor = .label.withAlphaComponent(0.8)
            label.font = .systemFont(ofSize: 40, weight: .heavy)
            return label
        }()
        
        let toLabel: UILabel = {
            let label = UILabel()
            label.text = "to"
            label.textColor = .secondaryLabel
            label.font = .systemFont(ofSize: 24, weight: .heavy)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.heightAnchor.constraint(equalToConstant: 80).isActive = true
            return label
        }()
        
        let hexTitleLabel: UILabel = {
            let label = UILabel()
            label.text = "Hex"
            label.textColor = .secondaryLabel
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 24, weight: .regular)
            return label
        }()
        
        let uiColorTitleLabel: UILabel = {
            let label = UILabel()
            label.text = "UIColor"
            label.textColor = .secondaryLabel
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 24, weight: .regular)
            return label
        }()
        
        let headingStack = UIStackView(arrangedSubviews: [
            hexTitleLabel,
            uiColorTitleLabel
        ])
        headingStack.axis = .horizontal
        headingStack.spacing = 80
        headingStack.alignment = .center
        
        let hexStack = UIStackView(arrangedSubviews: [
            hexTitleLabel,
            hexLabel
        ])
        hexStack.axis = .vertical
        hexStack.spacing = 6
        hexStack.alignment = .center
        
        let uiColorStack = UIStackView(arrangedSubviews: [
            uiColorTitleLabel,
            uiColorView
        ])
        uiColorStack.axis = .vertical
        uiColorStack.spacing = 6
        uiColorStack.alignment = .center
        
        let bottomStack = UIStackView(arrangedSubviews: [
            uiColorStack,
            toLabel,
            hexStack
        ])
        bottomStack.axis = .horizontal
        bottomStack.spacing = 30
        bottomStack.alignment = .bottom
        
        let mainStack = UIStackView(arrangedSubviews: [
            convertLabel,
            bottomStack
        ])
        mainStack.axis = .vertical
        mainStack.spacing = 15
        mainStack.alignment = .center
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(mainStack)
        mainStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -60).isActive = true
    }
    
    func uiColorToHex(uiColor: UIColor) -> String {
        let components = uiColor.cgColor.components
        let r: CGFloat = components?[0] ?? 0.0
        let g: CGFloat = components?[1] ?? 0.0
        let b: CGFloat = components?[2] ?? 0.0
        
        let hexString = String.init(format: "#%02lX%02lX%02lX", lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255)))
        return hexString
    }
}

