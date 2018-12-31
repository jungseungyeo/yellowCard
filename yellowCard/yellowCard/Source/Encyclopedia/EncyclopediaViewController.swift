//
//  EncyclopediaController.swift
//  yellowCard
//
//  Created by 여정승 on 30/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class EncyclopediaViewController: RootVC {

    @IBOutlet var encyclopediaView: EncyclopediaView!

    private var indicator: NVActivityIndicatorView? = nil

    private var isFilterOpen: Bool = false

    static func instance() -> EncyclopediaViewController? {
        return UIStoryboard(name: "Encyclopedia", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? EncyclopediaViewController
    }

    override func setup() {
        super.setup()

        let title = "술과사전"
        self.navigationItem.title = title
        self.navigationController?.navigationBar.titleTextAttributes = [NSMutableAttributedString.Key.font: UIFont.spoqaFont(ofSize: 20, weight: .Bold)]

        let filterInitBarButton = UIBarButtonItem(title: nil, style: UIBarButtonItem.Style.plain, target: self, action: #selector(cancelBarButtonItemTapped))
        filterInitBarButton.image = UIImage(named: "backBtn.png")
        filterInitBarButton.tintColor = .black
        self.navigationItem.leftBarButtonItem = filterInitBarButton

        self.encyclopediaView.delegate = self
    }

    @objc
    private func cancelBarButtonItemTapped() {
        navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.indicator = NVIndicatiorView.instance(self)
        self.indicator?.startAnimating()
        if UserViewModel.shared.encylopediaModels != nil {
            self.indicator?.stopAnimating()
            encyclopediaView.fetch()
        } else {
            EncyclopediaViewModel.requestAlcol(success: {
                self.indicator?.stopAnimating()
                self.encyclopediaView.fetch()
            }, failure: { error in
                self.indicator?.stopAnimating()
            })
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }

}


extension EncyclopediaViewController: EncyclopediaViewDelegate {
    func searchClick() {

    }

    func filterTapped() {

//        let height = 30 * 5
        let x = self.encyclopediaView.filterTableView.frame.minX
        let y = self.encyclopediaView.filterTableView.frame.minY
        let width = self.encyclopediaView.filterTableView.frame.width

        if isFilterOpen == false {
            isFilterOpen = true
            UIView.animate(withDuration: 0.3, animations: {
                self.encyclopediaView.filterTableView.frame = CGRect(x: x, y: y, width: width, height: 150)
                self.encyclopediaView.filterTableView.layoutIfNeeded()
            })
            return
        } else {
            isFilterOpen = false
            UIView.animate(withDuration: 0.3, animations: {
                self.encyclopediaView.filterTableView.frame = CGRect(x: x, y: y, width: width, height: 0)
                self.encyclopediaView.layoutIfNeeded()
            })
            return
        }
    }


}
