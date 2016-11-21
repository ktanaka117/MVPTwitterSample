//
//  ViewController.swift
//  MVPTwitterSample
//
//  Created by 田中賢治 on 2016/11/21.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyView: UIView!
    
    fileprivate var timeline: Timeline? = nil {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var timelinePresenter: TimelinePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTimelinePresenter()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // HACK: VC内でVCを持つことに関しては別記事にて取り扱う
        if Account.twitterAccount == nil {
            transitionToLoginViewController()
        }
    }
    
    private func setupTimelinePresenter() {
        timelinePresenter = TimelinePresenter(output: self)
    }
    
    // HACK: VC内でVCを持つことに関しては別記事にて取り扱う
    private func transitionToLoginViewController() {
        guard let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else { return }
        
        loginVC.didLogin = { [weak self] in
            self?.timelinePresenter.getTimeline()
        }
        
        present(loginVC, animated: true, completion: nil)
    }

}
extension TimelineViewController: TimelineVCOutput {
    func showEmptyView() {
        emptyView.isHidden = false
    }
    
    func hideEmptyView() {
        emptyView.isHidden = true
    }
    
    func showTimeline(timeline: Timeline) {
        self.timeline = timeline
    }
}

extension TimelineViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 90
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
        
    }
    
}

extension TimelineViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeline?.numberOfItem ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TweetTableViewCell") as? TweetTableViewCell else {
            fatalError("Fail cell instantiate.")
        }
        
        if let timeline = timeline {
            cell.fill(withTweet: timeline[indexPath.row])
        }
        
        return cell
    }
    
}
