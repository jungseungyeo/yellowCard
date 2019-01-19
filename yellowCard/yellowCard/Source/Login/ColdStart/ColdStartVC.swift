//
//  ColdStartVC.swift
//  yellowCard
//
//  Created by 여정승 on 12/01/2019.
//  Copyright © 2019 linsaeng. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import NVActivityIndicatorView

@objc
protocol KeyboardVisible {
    @objc
    func keyboardState(notification: Notification)
}

extension KeyboardVisible {
    func setUpKeyboardNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardState(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardState(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
}


class ColdStartVC: RootVC {
    private var beforeContentInset: UIEdgeInsets?

    private let viewmodel = ColdStartViewModel()
    private let bag = DisposeBag()

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var profileView: UIImageView!
    
    @IBOutlet weak var nickNameView: UIImageView!
    @IBOutlet weak var stateView: UIImageView!

    public var indicator: NVActivityIndicatorView? = nil

    @IBOutlet weak var completeButton: UIButton!
    //    private let completeButton = UIButton(type: .system).then {
//        $0.setTitle("다 끝났어요! 엘리우 카드 시작하기", for: .normal)
//        $0.backgroundColor = .black
//        $0.titleLabel?.font = .spoqaFont(ofSize: 16, weight: .Bold)
//        $0.titleLabel?.numberOfLines = 0
//        $0.titleLabel?.textAlignment = .center
//        $0.isHidden = true
//    }

    private let nickFieldName = UITextField(frame: .zero).then {
        $0.placeholder = "옐로카드에서 쓸 이름을 작성해 주세요."
        $0.textColor = .black
        $0.font = .spoqaFont(ofSize: 14, weight: .Light)
    }

    private let stateField = UITextField(frame: .zero).then {
        $0.placeholder = "나만의 음주 스타일을 자유롭게 써주세요."
        $0.textColor = .black
        $0.font = .spoqaFont(ofSize: 14, weight: .Light)
    }

    static func instance() -> ColdStartVC? {
        return ColdStartVC.init(nibName: classNameToString, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bind()
        setupScrollView()
        setUpKeyboardNotification()

//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    private func setupScrollView() {
        let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        singleTapGestureRecognizer.numberOfTapsRequired = 1
        singleTapGestureRecognizer.isEnabled = true
        singleTapGestureRecognizer.cancelsTouchesInView = false
        scrollView.addGestureRecognizer(singleTapGestureRecognizer)
    }

    private func setupUI() {
        indicator = NVIndicatiorView.instance(self)

        self.profileView.kf.setImage(with: UserViewModel.shared.demoInfo?.profileImageURL!)
        self.profileView.layer.cornerRadius = 56
        self.profileView.layer.borderColor = UIColor.black.cgColor
        self.profileView.layer.borderWidth = 1
        self.profileView.clipsToBounds = true

        self.nickNameView.backgroundColor = UIColor(r: 234, g: 234, b: 234)
        self.nickNameView.layer.cornerRadius = 25

        self.stateView.backgroundColor = UIColor(r: 234, g: 234, b: 234)
        self.stateView.layer.cornerRadius = 25

        completeButton.setTitle("다 끝났어요! 엘리우 카드 시작하기", for: .normal)
        completeButton.backgroundColor = .black
        completeButton.titleLabel?.font = .spoqaFont(ofSize: 16, weight: .Bold)
        completeButton.titleLabel?.numberOfLines = 0
        completeButton.titleLabel?.textAlignment = .center
        completeButton.isHidden = true


        completeButton.addTarget(self, action: #selector(completeTap), for: .touchUpInside)


        self.view.addSubview(completeButton)
        self.view.addSubview(nickFieldName)
        self.view.addSubview(stateField)

        completeButton.snp.makeConstraints { make -> Void in
            make.height.equalTo(60)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(0)
        }

        self.nickFieldName.snp.makeConstraints { make -> Void in
            make.height.equalTo(20)
            make.left.equalTo(self.nickNameView.snp.left).offset(24)
            make.right.equalTo(self.nickNameView.snp.right).offset(-39)
            make.centerY.equalTo(self.nickNameView.snp.centerY).offset(0)
        }

        self.stateField.snp.makeConstraints { make -> Void in
            make.height.equalTo(20)
            make.left.equalTo(self.stateView.snp.left).offset(24)
            make.right.equalTo(self.stateView.snp.right).offset(-39)
            make.centerY.equalTo(self.stateView.snp.centerY).offset(0)
        }
    }

    private func bind() {
        _ = self.nickFieldName.rx.text.map{ $0 ?? "" }.bind(to: viewmodel.isNickName)
        _ = self.stateField.rx.text.map{ $0 ?? "" }.bind(to: viewmodel.isStateWord)

        _ = viewmodel.isSignIn.subscribe( onNext: { [weak self] isSignIn in
            guard let `self` = self else { return }
            self.completeButton.isHidden = !isSignIn
            }).disposed(by: bag)
    }
}

extension ColdStartVC: KeyboardVisible {
    @objc
    private func completeTap() {
        indicator?.startAnimating()
        viewmodel.requesetSingIn(token: UserViewModel.shared.session!, nickName: self.nickFieldName.text, stateWord: self.stateField.text, success: { [weak self] in
            guard let `self` = self else { return }
            self.requestMainData()
            }, failure: { [weak self] error in
                guard let `self` = self else { return }
                self.indicator?.stopAnimating()
        })
    }

    private func requestMainData() {
        viewmodel.requestMainData(success: {
            self.indicator?.stopAnimating()
            self.nextView()
        }, failure: { error in
            print("reqeusetMainData error")
        })
    }

    private func nextView() {
        self.dismiss(animated: false, completion: {
            UIApplication.shared.keyWindow?.rootViewController = YellowCardNavigationController.instance()!
            UIApplication.shared.keyWindow?.makeKeyAndVisible()
        })
    }

    @objc
    func keyboardState(notification: Notification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        let keyboardHeight = keyboardSize.height
        //        guard let duration = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSValue) as? TimeInterval else {
        //            return
        //        }
        if notification.name == UIResponder.keyboardWillShowNotification {
            beforeContentInset = scrollView.contentInset
            let contentInsets: UIEdgeInsets = UIEdgeInsets(top: scrollView.contentInset.top,
                                                           left: scrollView.contentInset.left,
                                                           bottom: keyboardHeight,
                                                           right: scrollView.contentInset.right)
            scrollView.contentInset = contentInsets
        } else if notification.name == UIResponder.keyboardWillHideNotification {
            if let beforeInset = beforeContentInset {
                scrollView.contentInset = beforeInset
                scrollView.scrollIndicatorInsets = scrollView.contentInset
                beforeContentInset = nil
            }
        }
    }

//    @objc func keyboardWillShow(notification: NSNotification) {
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
//            if self.view.frame.origin.y == 0 {
//                self.view.frame.origin.y -= (keyboardSize.height + 60)
//            }
//        }
//    }
//
//    @objc func keyboardWillHide(notification: NSNotification) {
//        if self.view.frame.origin.y != 0 {
//            self.view.frame.origin.y = 0
//        }
//    }

    @objc
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
