//
//  AlcoRegisterView.swift
//  yellowCard
//
//  Created by 여정승 on 19/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import Foundation

protocol AlcoRegisterViewDelegate {
    func dismissButtonTapped()
}

class AlcoRegisterView: UIView {

    var delegate: AlcoRegisterViewDelegate?

    private let dismissButton = UIButton(frame: .zero).then {
        $0.setTitle("cancel", for: .normal)
        $0.titleLabel?.font = .spoqaFont(ofSize: 30, weight: .Light)
        $0.setTitleColor(UIColor.YellowCard.black, for: .normal)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {

        self.backgroundColor = .white

        addSubViews(dismissButton)

        dismissButton.snp.makeConstraints { make -> Void in
            make.left.equalToSuperview().offset(30)
            make.top.equalToSuperview().offset(100)
        }

        setupTouch()
    }

    private func setupTouch() {
        self.dismissButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
    }

    @objc
    private func dismissButtonTapped() {
        delegate?.dismissButtonTapped()
    }
}
