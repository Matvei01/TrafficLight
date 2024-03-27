//
//  TLViewController.swift
//  TrafficLight
//
//  Created by Matvei Khlestov on 27.03.2024.
//

import UIKit

// MARK: - TLViewController
final class TLViewController: UIViewController {
    
    // MARK: - Private Properties
    /// Свойство с текущим цветом
    private var currentLight = CurrentLight.red
    private let lightIsOn = 1.0
    private let lightIsOff = 0.3
    
    // MARK: - UI Elements
    private lazy var redLight: UIView = {
        setupLight(color: .red)
    }()
    
    private lazy var yellowLight: UIView = {
        setupLight(color: .yellow)
    }()
    
    private lazy var greenLight: UIView = {
        setupLight(color: .green)
    }()
    
    private lazy var TLStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            redLight, yellowLight, greenLight
        ])
        stackView.contentMode = .scaleToFill
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 43
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: - Private Methods
private extension TLViewController {
    func setupView() {
        view.backgroundColor = .secondarySystemBackground
        addSubviews()
        setConstraints()
    }
    
    func addSubviews() {
        setupSubviews(
            TLStackView
        )
    }
    
    func setupSubviews(_ subviews: UIView... ) {
        for subview in subviews {
            view.addSubview(subview)
        }
    }
    
    func setupLight(color: UIColor) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = lightIsOff
        view.backgroundColor = color
        
        return view
    }
}

// MARK: - Constraints
private extension TLViewController {
    func setConstraints() {
        setConstraintsForTLStackView()
        setConstraintsForRedLight()
    }
    
    func setConstraintsForTLStackView() {
        NSLayoutConstraint.activate([
            TLStackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60
            ),
            TLStackView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            TLStackView.heightAnchor.constraint(
                equalTo: view.heightAnchor, multiplier: 0.603873
            )
        ])
    }
    
    func setConstraintsForRedLight() {
        NSLayoutConstraint.activate([
            redLight.widthAnchor.constraint(
                equalTo: redLight.heightAnchor, multiplier: 1/1
            )
        ])
    }
}

// MARK: - CurrentLight
private extension TLViewController {
    enum CurrentLight {
        case red
        case yellow
        case green
    }
}
