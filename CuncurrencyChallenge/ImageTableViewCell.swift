//
//  ImageTableViewCell.swift
//  CuncurrencyChallenge
//
//  Created by 광리자 on 2023/02/21.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    static let identifier = "ImageTableViewCell"
    
    let myImageView = UIImageView()
    let loadButton = UIButton()
    let progressView = UIProgressView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(myImageView)
        self.addSubview(loadButton)
        self.addSubview(progressView)
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        myImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        myImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        myImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        myImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        loadButton.translatesAutoresizingMaskIntoConstraints = false
        loadButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        loadButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        loadButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        loadButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        progressView.leadingAnchor.constraint(equalTo: self.myImageView.trailingAnchor, constant: 10).isActive = true
        progressView.trailingAnchor.constraint(equalTo: self.loadButton.leadingAnchor, constant: -10).isActive = true
        progressView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        myImageView.backgroundColor = .blue
        loadButton.setTitle("다운로드", for: .normal)
        loadButton.setTitleColor(.black, for: .normal)
        loadButton.backgroundColor = .gray
    }
    
    func configureImage(stringUrl: String) {
        guard let url = URL(string: stringUrl) else {
            return
        }
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
        let downloadTask = session.downloadTask(with: url)
        downloadTask.resume()
    }
}

extension ImageTableViewCell: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        // Get the data from the download location
        guard let imageData = try? Data(contentsOf: location) else {
            print("Error retrieving image data")
            return
        }
        
        // Update the UI on the main thread with the downloaded image
        DispatchQueue.main.async {
            self.myImageView.image = UIImage(data: imageData)
        }
    }
    
    
    // This method is called periodically as the download progresses
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
        // Calculate the download progress as a fraction of the total bytes
        let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        
        // Update the progress bar on the main thread
        DispatchQueue.main.async {
            self.progressView.progress = progress
        }
    }
}
