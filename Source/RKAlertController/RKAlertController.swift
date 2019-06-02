//
//  RKAlertController.swift
//  RebeloperKit
//
//  Created by Alex Nagy on 31/05/2019.
//

import UIKit

public struct RKAlertController {
    
    static public func showAlert(onViewController: UIViewController, style: UIAlertController.Style, title: String?, message: String?, actions: [UIAlertAction] = [UIAlertAction(title: "Ok", style: .cancel, handler: nil)], completion: (() -> Swift.Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        for action in actions {
            alert.addAction(action)
        }
        
        alert.popoverPresentationController?.sourceView = onViewController.view
        alert.popoverPresentationController?.sourceRect = CGRect(x: onViewController.view.bounds.midX, y: onViewController.view.bounds.midY, width: 0, height: 0)
        alert.popoverPresentationController?.permittedArrowDirections = []
        onViewController.present(alert, animated: true, completion: completion)
    }
    
    static public func showAlert(onViewController: UIViewController, style: UIAlertController.Style, title: String?, message: String?, textFields: [UITextField], completion: @escaping ([String]?) -> ()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        
        for textField in textFields {
            alert.addTextField(configurationHandler: { (theTextField) in
                theTextField.placeholder = textField.placeholder
            })
        }
        
        let textFieldAction = UIAlertAction(title: "Submit", style: .cancel) { (action) in
            var textFieldsTexts: [String] = []
            if let alertTextFields = alert.textFields {
                for textField in alertTextFields {
                    if let textFieldText = textField.text {
                        textFieldsTexts.append(textFieldText)
                    }
                }
                completion(textFieldsTexts)
            }
        }
        alert.addAction(textFieldAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (action) in
            completion(nil)
        }
        alert.addAction(cancelAction)
        
        alert.popoverPresentationController?.sourceView = onViewController.view
        alert.popoverPresentationController?.sourceRect = CGRect(x: onViewController.view.bounds.midX, y: onViewController.view.bounds.midY, width: 0, height: 0)
        alert.popoverPresentationController?.permittedArrowDirections = []
        onViewController.present(alert, animated: true, completion: nil)
    }
}
