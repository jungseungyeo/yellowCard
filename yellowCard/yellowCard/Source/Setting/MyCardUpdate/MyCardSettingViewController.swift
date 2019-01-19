//
//  MyCardSettingViewController.swift
//  yellowCard
//
//  Created by 여정승 on 30/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

enum AlcolType: String {
    case beer = "맥주"
    case soju = "소주"
    case wine = "와인"
    case makgeolli = "막걸리"
    case driking = "음료수"
}

class MyCardSettingViewController: RootVC {

    static func instance() -> MyCardSettingViewController? {
        return UIStoryboard(name: "Setting", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? MyCardSettingViewController
    }

    private var arrayCell: [AlcolSelectedCollectionViewCell] = []

    private var mainCardView: MainCardView? = nil

    private var myCardSettingView: MyCardSettingView? = nil

    override func setup() {
        super.setup()
        myCardSettingView = MyCardSettingView(frame: self.view.frame)
        self.view = myCardSettingView
        let title = "메인 카드 세팅"
        self.navigationItem.title = title
        self.navigationController?.navigationBar.titleTextAttributes = [NSMutableAttributedString.Key.font: UIFont.spoqaFont(ofSize: 20, weight: .Bold)]
        myCardSettingView?.myCardCollectionView.delegate = self
        myCardSettingView?.myCardCollectionView.dataSource = self
        myCardSettingView?.myCardCollectionView.register(MyCardSettingCell.self, forCellWithReuseIdentifier: MyCardSettingCell.registerId)

        let filterInitBarButton = UIBarButtonItem(title: nil, style: UIBarButtonItem.Style.plain, target: self, action: #selector(cancelBarButtonItemTapped))
        filterInitBarButton.image = UIImage(named: "backBtn.png")
        filterInitBarButton.tintColor = .black
        self.navigationItem.leftBarButtonItem = filterInitBarButton

    }

    @objc
    private func cancelBarButtonItemTapped() {
        navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MyCardSettingViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return 1
        } else {
            return 5
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCardSettingCell.registerId, for: indexPath) as! MyCardSettingCell
            cell.delegate = self
            cell.mainCardView.alcolCollectionView.register(AlcolSelectedCollectionViewCell.self, forCellWithReuseIdentifier: AlcolSelectedCollectionViewCell.registerId)
            cell.mainCardView.alcolCollectionView.delegate = self
            cell.mainCardView.alcolCollectionView.dataSource = self
            mainCardView = cell.mainCardView
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlcolSelectedCollectionViewCell.registerId, for: indexPath) as! AlcolSelectedCollectionViewCell
            cell.delegate = self
            switch indexPath.row {
            case 0:
                cell.alcolButton.setTitle("맥주", for: .normal)
                cell.alcolType = AlcolType.beer
                cell.alcolButton.backgroundColor = .black
                cell.alcolButton.setTitleColor(.white, for: .normal)
                cell.alcolButton.layer.borderColor = UIColor.clear.cgColor
                cell.tag = 0
                arrayCell.append(cell)
            case 1:
                cell.alcolButton.setTitle("소주", for: .normal)
                cell.alcolType = AlcolType.soju
                cell.tag = 1
                arrayCell.append(cell)
            case 2:
                cell.alcolButton.setTitle("와인", for: .normal)
                cell.alcolType = AlcolType.wine
                cell.tag = 2
                arrayCell.append(cell)
            case 3:
                cell.alcolButton.setTitle("막걸리", for: .normal)
                cell.alcolType = AlcolType.makgeolli
                cell.tag = 3
                arrayCell.append(cell)
            case 4:
                cell.alcolButton.setTitle("음료수", for: .normal)
                cell.alcolType = AlcolType.driking
                cell.tag = 4
                arrayCell.append(cell)
            default: break
            }
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 1 {
            var height = collectionView.frame.height
            if height < 701 {
                height = 701
            }else {
                collectionView.isScrollEnabled = false
            }
            return CGSize(width: collectionView.frame.width, height: height)
        } else {
            return CGSize(width: 70, height: 28)
        }
    }
}

extension MyCardSettingViewController: MyCardSettingCelldelegate {
    func mainCardTapped() {

    }

    func cardManagerTapped() {

    }
}

extension MyCardSettingViewController: AlcolSelectedCollectionViewCellDelegate {
    func alcolButtonTapped(alcolType: AlcolType?, view: AlcolSelectedCollectionViewCell, number: Int) {
        view.alcolButton.backgroundColor = .black
        view.alcolButton.setTitleColor(.white, for: .normal)
        view.alcolButton.layer.borderColor = UIColor.clear.cgColor

        for cell in arrayCell {
            if cell.tag == number {
                changeAlcolView(view: cell)
            } else {
                cell.alcolButton.backgroundColor = .white
                cell.alcolButton.setTitleColor(UIColor(r: 17, g: 17, b: 17), for: .normal)
                cell.alcolButton.layer.borderColor = UIColor(r: 17, g: 17, b: 17).cgColor
            }
        }
    }

    private func changeAlcolView(view: AlcolSelectedCollectionViewCell) {
        let falg = true
        if view.tag == 0 {
            mainCardView?.boadView.backgroundColor = UIColor.YellowCardYellow
            mainCardView?.firstLabel.text = "내가 가장 좋아하는 맥주"
            mainCardView?.secondLabel.text = "2000cc까지는"
            mainCardView?.inputText.becomeFirstResponder()
        } else if view.tag == 1 {
            mainCardView?.boadView.backgroundColor = UIColor(r: 122, g: 236, b: 80)
            mainCardView?.firstLabel.text = "내가 가장 좋아하는 소주"
            mainCardView?.secondLabel.text = "1병까지는"
            mainCardView?.inputText.becomeFirstResponder()
        } else if view.tag == 2 {
            mainCardView?.boadView.backgroundColor = UIColor(r: 251, g: 122, b: 194)
            mainCardView?.firstLabel.text = "내가 가장 좋아하는 와인"
            mainCardView?.secondLabel.text = "1병까지는"
            mainCardView?.inputText.becomeFirstResponder()
        } else if view.tag == 3 {
            mainCardView?.boadView.backgroundColor = UIColor(r: 117, g: 209, b: 248)
            mainCardView?.firstLabel.text = "내가 가장 좋아하는 막걸리"
            mainCardView?.secondLabel.text = "1병까지는"
            mainCardView?.inputText.becomeFirstResponder()
        } else if view.tag == 4 {
            mainCardView?.boadView.backgroundColor = UIColor(r: 234, g: 234, b: 234)
            mainCardView?.firstLabel.text = "술은 못하지만,"
            mainCardView?.thirdLabel.text = "함께 즐길 수 있어요."
            mainCardView?.drinkingText.becomeFirstResponder()
        }

        if view.tag == 4 {
            mainCardView?.secondLabel.isHidden = falg
            mainCardView?.inputText.isHidden = falg
            mainCardView?.drinkingText.isHidden = !falg
        }  else {
            mainCardView?.secondLabel.isHidden = !falg
            mainCardView?.inputText.isHidden = !falg
            mainCardView?.drinkingText.isHidden = falg
        }
    }
}
