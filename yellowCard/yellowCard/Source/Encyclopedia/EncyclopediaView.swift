//
//  EncyclopediaView.swift
//  yellowCard
//
//  Created by 여정승 on 30/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

protocol EncyclopediaViewDelegate {
    func searchClick()
    func filterTapped()
}

class EncyclopediaView: RootView {

    var delegate: EncyclopediaViewDelegate?

    private let filterList = ["인기순", "도수 쎈 순", "도수 약한 순", "비싼 순", "저렴한 순"]

    private let filterButton = UIButton(type: .system).then {
        $0.setTitle("필터", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 15
        $0.backgroundColor = .black
    }

    private let searchFieldBar = UIView(frame: .zero).then {
        $0.layer.cornerRadius = 15
        $0.layer.borderColor = UIColor.YellowCardBorderColor.cgColor
        $0.layer.borderWidth = 2
    }

    private let searchButton = UIButton(frame: .zero).then {
        $0.setImage(UIImage(named: "register.png"), for: .normal)
    }

    private let serachTextFiled = UITextField(frame: .zero)

//    private let alcolListTableView = UITableView(frame: .zero, style: .plain)

    public var alcolListCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 6
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    public var filterTableView = UITableView(frame: .zero, style: .plain)

    override func setup() {
        super.setup()
        addSubviews(filterButton,
                    searchFieldBar,
                    alcolListCollectionView,
                    filterTableView)

        searchFieldBar.addSubviews(serachTextFiled,
                                   searchButton)

        alcolListCollectionView.delegate = self
        alcolListCollectionView.dataSource = self

        alcolListCollectionView.register(EncyclopediaCollectionViewCell.self, forCellWithReuseIdentifier: EncyclopediaCollectionViewCell.registerId)
    }

    override func setupUI() {
        super.setupUI()

        filterButton.snp.makeConstraints { make -> Void in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(22)
            make.right.equalToSuperview().offset(-20)
            make.width.equalTo(74)
            make.height.equalTo(30)
        }

        searchFieldBar.snp.makeConstraints { make -> Void in
            make.top.equalTo(filterButton.snp.top).offset(0)
            make.left.equalToSuperview().offset(20)
            make.right.equalTo(filterButton.snp.left).offset(-4)
            make.height.equalTo(30)
        }

        serachTextFiled.snp.makeConstraints { make -> Void in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalTo(20)
            make.right.equalTo(-30)
        }

        searchButton.snp.makeConstraints { make -> Void in
            make.height.equalToSuperview().offset(-6)
            make.width.equalTo(searchButton.snp.height).offset(0)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-6)
        }

        alcolListCollectionView.snp.makeConstraints { make -> Void in
            make.top.equalTo(searchFieldBar.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview()
        }

        filterTableView.snp.makeConstraints { make -> Void in
            make.top.equalTo(filterButton.snp.bottom).offset(0)
            make.left.equalTo(filterButton.snp.left).offset(0)
            make.right.equalTo(filterButton.snp.right).offset(0)
            make.height.equalTo(0)
        }

        filterTableView.delegate = self
        filterTableView.dataSource = self
        filterTableView.register(EncyclopediaTableCell.self, forCellReuseIdentifier: EncyclopediaTableCell.registerId)
        filterTableView.separatorStyle = .none
        filterTableView.isScrollEnabled = false
    }

    override func setupTapped() {
        super.setupTapped()
        searchButton.addTarget(self, action: #selector(searchClick), for: .touchUpInside)
        filterButton.addTarget(self, action: #selector(filterTapped), for: .touchUpInside)
    }

    public func fetch() {
        self.alcolListCollectionView.reloadData()
    }
}


extension EncyclopediaView {

    @objc
    private func searchClick() {
        delegate?.searchClick()
    }

    @objc
    private func filterTapped() {
        delegate?.filterTapped()
    }
}

extension EncyclopediaView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return UserViewModel.shared.encylopediaModels?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EncyclopediaCollectionViewCell.registerId, for: indexPath) as! EncyclopediaCollectionViewCell
//        cell.title = UserViewModel.shared.encylopediaModels[indexPath.row]
        cell.title.text = UserViewModel.shared.encylopediaModels?[indexPath.row].name
        cell.detailTitle.text = UserViewModel.shared.encylopediaModels?[indexPath.row].description
        cell.proof.text = "\(String(describing: UserViewModel.shared.encylopediaModels?[indexPath.row].proof ?? 0))"
        
        cell.price.text = "\(String(describing: UserViewModel.shared.encylopediaModels?[indexPath.row].price ?? 0))"
        cell.likeNumber.text = "\(String(describing: UserViewModel.shared.encylopediaModels?[indexPath.row].number_of_like ?? 0))"
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 146)
    }
}


extension EncyclopediaView: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EncyclopediaTableCell.registerId, for: indexPath) as! EncyclopediaTableCell
        cell.filterButton.setTitle(filterList[indexPath.row], for: .normal)
//        cell.selectionStyle = .none
        return cell
    }

}
