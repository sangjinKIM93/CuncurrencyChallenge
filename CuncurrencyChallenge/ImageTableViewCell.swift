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
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        myImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        myImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        myImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        myImageView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        
        loadButton.translatesAutoresizingMaskIntoConstraints = false
        loadButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        loadButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        loadButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        loadButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        myImageView.backgroundColor = .blue
        loadButton.setTitle("다운로드", for: .normal)
        loadButton.setTitleColor(.black, for: .normal)
        loadButton.backgroundColor = .gray
    }
    
    func configureImage(stringUrl: String) {
        guard let url = URL(string: stringUrl) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data = data,
                  let image = UIImage(data: data) else {
                return
            }

            DispatchQueue.main.async() {[weak self] in
                self?.myImageView.image = image
            }
        }.resume()
    }
}
