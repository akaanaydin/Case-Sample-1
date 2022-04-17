//
//  ITunesViewModel.swift
//  CaseSample-1
//
//  Created by Arslan Kaan AYDIN on 16.04.2022.
//

import Foundation
import UIKit

protocol IITunesViewModel {
    func fetchItems()
    
    var iTunesResults: [Result] { get set }
    var iTunesService: IITunesService { get }
    var iTunesOutput: ITunesOutput? { get }
    
    func setDelegate(output: ITunesOutput)
}

final class ITunesViewModel: IITunesViewModel {
    var iTunesResults: [Result] = []
    
    var iTunesService: IITunesService
    
    var iTunesOutput: ITunesOutput?
    
    init() {
        iTunesService = ITunesService()
    }
    
    func setDelegate(output: ITunesOutput) {
        iTunesOutput = output
    }
    
    func fetchItems() {
        iTunesService.fetchAllDatas(searchText: "Harry") { [weak self] response in
            self?.iTunesResults = response ?? []
            self?.iTunesOutput?.saveDatas(values: self?.iTunesResults ?? [])
        }
    }
    
}
