//
//  PageViewController.swift
//  HW.28.03
//
//  Created by zalkarbek on 28/3/23.
//

import UIKit

class PageViewController: UIViewController {
    
    @IBOutlet weak var navigationB: UINavigationBar!
    
    @IBOutlet weak var statusCollectionView: UICollectionView!
    
    @IBOutlet weak var latestCollectionView: UICollectionView!
    
    @IBOutlet weak var flashCollectionView: UICollectionView!
    
    
    private let statusViewModel = StatusViewModel()
    private let latestViewModel = LatestViewModel()
    private let flashViewModel = FlashViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureStatusCollectionView()
        configureLatestCollectionView()
        fetchLatest()
        configureFlashCollectionView()
        fetchFlash()
    }
    
    private func configureStatusCollectionView() {
        statusCollectionView.dataSource = self
        statusCollectionView.delegate = self
        statusCollectionView.register(
            UINib(nibName: StatusCollectionViewCell.reuseId, bundle: nil), forCellWithReuseIdentifier: StatusCollectionViewCell.reuseId)
    }
    
    private func configureLatestCollectionView() {
        latestCollectionView.dataSource = self
        latestCollectionView.delegate = self
        latestCollectionView.register(
            UINib(nibName: LatestCollectionViewCell.reuseId, bundle: nil), forCellWithReuseIdentifier: LatestCollectionViewCell.reuseId)
    }
    
    private func fetchLatest() {
        Task {
            do {
                latestViewModel.latest = try await latestViewModel.fetchLatest()
                DispatchQueue.main.async {
                    self.latestCollectionView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func configureFlashCollectionView() {
        flashCollectionView.dataSource = self
        flashCollectionView.delegate = self
        flashCollectionView.register(UINib(nibName: FlashSaleCollectionViewCell.reuseId, bundle: nil), forCellWithReuseIdentifier: FlashSaleCollectionViewCell.reuseId)
    }
    
    private func fetchFlash() {
        Task {
            do {
                flashViewModel.flash = try await flashViewModel.fetchFlshSale()
                DispatchQueue.main.async {
                    self.flashCollectionView.reloadData()
                }
            } catch {
                print("Error \(error.localizedDescription)")
            }
        }
    }
    
}

extension PageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == latestCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LatestCollectionViewCell.reuseId, for: indexPath) as? LatestCollectionViewCell else {fatalError()}
            let latest = latestViewModel.latest[indexPath.row]
            cell.displayLatest(latest)
            return cell
        } else if collectionView == flashCollectionView{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlashSaleCollectionViewCell.reuseId, for: indexPath) as? FlashSaleCollectionViewCell else { fatalError() }
            let flashSale = flashViewModel.flash[indexPath.row]
            cell.displayFlash(flashSale)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StatusCollectionViewCell.reuseId, for: indexPath) as? StatusCollectionViewCell else {fatalError()}
            let status = statusViewModel.status[indexPath.row]
             cell.displayStatus(status)
             return cell
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        if collectionView == latestCollectionView {
           return latestViewModel.latest.count
        } else if collectionView == flashCollectionView {
          return  flashViewModel.flash.count
        } else {
            return statusViewModel.status.count
        }
    }
}

extension PageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == latestCollectionView {
            return CGSize(width: 150, height: 180)
        } else if collectionView == flashCollectionView {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        } else {
            return CGSize(width: 100, height: 110)
        }
    }
}
