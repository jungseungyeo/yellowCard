//
//  AlertViewController+.swift
//  yellowCard
//
//  Created by 여정승 on 05/01/2019.
//  Copyright © 2019 linsaeng. All rights reserved.
//

import UIKit

public extension UIAlertController{


    //alert


    @discardableResult
    public static func alert(_ title: String = "", message: String) -> UIAlertController{
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        return alertController
    }


    @discardableResult
    public static func alert(_ title: String = "", message: String, cancelString: String, cancelHandler: (() -> Void)? = nil) -> UIAlertController{
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: cancelString, style: .cancel, handler: { (_) in
            cancelHandler?()
        }))
        return alertController
    }

    @discardableResult
    public static func alert(_ title: String = "", message: String, defaultString: String, defaultHandler: (() -> Void)? = nil) -> UIAlertController{
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: defaultString, style: .default, handler: { (_) in
            defaultHandler?()
        }))
        return alertController
    }


    @discardableResult
    public static func alert(_ title: String = "", message: String, defaultString: String, cancelString: String, defaultHandler: @escaping (() -> Void), cancelHandler: (() -> Void)? = nil) -> UIAlertController{
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: defaultString, style: .default, handler: { (_) in
            defaultHandler()
        }))
        alertController.addAction(UIAlertAction(title: cancelString, style: .cancel, handler: { (_) in
            cancelHandler?()
        }))
        return alertController
    }


    //sheet

    @discardableResult
    public static func sheet(_ title: String = "", message: String) -> UIAlertController{
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        return alertController
    }

    @discardableResult
    public static func sheetCancel(_ title: String = "", message: String, cancelString: String, cancelHandler: (() -> Void)? = nil) -> UIAlertController{
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: cancelString, style: .cancel, handler: { (_) in
            cancelHandler?()
        }))
        return alertController
    }

    @discardableResult
    public static func sheetConfirm(_ title: String = "", message: String, defaultString: String, defaultHandler: (() -> Void)? = nil) -> UIAlertController{
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: defaultString, style: .default, handler: { (_) in
            defaultHandler?()
        }))
        return alertController
    }


    @discardableResult
    public static func sheet(_ title: String = "", message: String, defaultString: String, cancelString: String, defaultHandler: @escaping (() -> Void), cancelHandler: (() -> Void)? = nil) -> UIAlertController{
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: defaultString, style: .default, handler: { (_) in
            defaultHandler()
        }))
        alertController.addAction(UIAlertAction(title: cancelString, style: .cancel, handler: { (_) in
            cancelHandler?()
        }))
        return alertController
    }





    //action

    private func action(_ title: String, style: UIAlertAction.Style, handler: ((UIAlertController) -> Void)? = nil) -> UIAlertController{
        self.addAction(UIAlertAction(title: title, style: .default, handler: { (_) in
            handler?(self)
        }))
        return self
    }

    @discardableResult
    public func add(_ title: String, handler: ((UIAlertController) -> Void)? = nil) -> UIAlertController{
        return self.action(title, style: .default, handler: handler)
    }

    @discardableResult
    public func cancel(_ title: String, handler: ((UIAlertController) -> Void)? = nil) -> UIAlertController{
        return self.action(title, style: .cancel, handler: handler)
    }

    //show

    @discardableResult
    public func show(_ viewController: UIViewController) -> UIAlertController{
        DispatchQueue.main.async {
            viewController.present(self, animated: true, completion: nil)
        }
        return self
    }
}

