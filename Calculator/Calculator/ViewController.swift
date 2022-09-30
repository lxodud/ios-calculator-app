//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var formulaStackView: UIStackView!
    
    private var operand: String = ""
    private var arithmeticOperator: String = ""
    private var isDotButtonTapped: Bool = false
    private var isFirstInput: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setOperandLabelToZero()
        setOperatorLabelEmpty()
    }
    
    @IBAction func oneToNineOperandButtonTapped(_ sender: UIButton) {
        guard let selectedOperand = Operand.matchOperandButtonTag(location: sender.tag) else {
            return
        }
        
        updateOperandLabel(with: selectedOperand.bringOperandSymbol)
        isFirstInput = false
    }
    
    @IBAction func dotButtonTapped(_ sender: Any) {
        if !operand.isEmpty && !isDotButtonTapped {
            updateOperandLabel(with: ".")
            isDotButtonTapped = true
        }
    }
    
    @IBAction func zeroButtonTapped(_ sender: Any) {
        if !operand.isEmpty {
            updateOperandLabel(with: "0")
        }
    }
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        guard let selectedOperator = sender.currentTitle else {
            return
        }
        
        if isFirstInput {
            return
        }
        
        creatStackView()
        updateOperatorLabel(with: selectedOperator)
        setOperandLabelToZero()
        operand.removeAll()
        isDotButtonTapped = false
    }
    
    func creatStackView() {
        let operandLabel: UILabel = {
            let label = UILabel()
            label.text = operand
            label.textColor = .white
            return label
        }()
        
        let operatorLabel: UILabel = {
            let label = UILabel()
            label.text = arithmeticOperator
            label.textColor = .white
            return label
        }()
        
        let stackView = UIStackView(arrangedSubviews: [operatorLabel, operandLabel])
        formulaStackView.addArrangedSubview(stackView)
    }
    
    func updateOperandLabel(with input: String) {
        operand += input
        operandLabel.text = operand
    }
    
    func updateOperatorLabel(with input: String) {
        arithmeticOperator = input
        operatorLabel.text = arithmeticOperator
    }

    func setOperandLabelToZero() {
        operandLabel.text = "0"
    }
    
    func setOperatorLabelEmpty() {
        operatorLabel.text = ""
    }
}

