//
//  SearchTextField.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 17.05.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import UIKit

@IBDesignable class SearchTextField: UITextField {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configureView()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		configureView()
	}
	
	func configureView() {
		self.backgroundColor = #colorLiteral(red: 0.9493874303, green: 0.9493874303, blue: 0.9493874303, alpha: 1)
		self.layer.cornerRadius = 5
		self.clipsToBounds = true
	}
	
	override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
		var rect = super.leftViewRect(forBounds: bounds)
		rect.origin.x += 35
		return rect
	}
	
	override func textRect(forBounds bounds: CGRect) -> CGRect {
		return bounds.insetBy(dx: 10, dy: 0)
	}
	
	override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
		return bounds.insetBy(dx: 10, dy: 0)
	}
	
	override func editingRect(forBounds bounds: CGRect) -> CGRect {
		return bounds.insetBy(dx: 10, dy: 0)
	}

}
