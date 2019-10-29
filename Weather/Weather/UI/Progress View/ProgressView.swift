//
//  ProgressView.swift
//  Weather
//
//  Created by Patricia Zambrano on 10/28/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import UIKit

class ProgressView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var lblLoading: UILabel!

    fileprivate let deviceSize = UIScreen.main.bounds.size
    fileprivate var delegate: ProgressViewDelegate!
    
    init(delegate: ProgressViewDelegate) {
        let frame = CGRect(x: 0, y: 0, width: deviceSize.width, height: deviceSize.height)
        super.init(frame: frame)
        Bundle.main.loadNibNamed(TextsApps.progressView.rawValue, owner: self, options: nil)
        self.delegate = delegate
        self.contentView!.frame = frame
        self.delegate.add(view: self, isProgressView: true)
        self.addSubview(self.contentView!)
        self.lblLoading.text = TextsApps.loading.rawValue
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func show() {
        self.bringSubviewToFront(self)
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
            self.contentView.alpha = 1
            self.layoutIfNeeded()
        }, completion: nil)
    }
    
    func close() {
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
            self.contentView.alpha = 0
            self.layoutIfNeeded()
        }, completion: { finished in
            self.removeFromSuperview()
        })
    }
}
