//
//  ScrollStackViewController.swift
//  FrancesGo
//
//  Created by Micaela Lean Cole on 04/05/2021.
//  Copyright © 2021 Wolox. All rights reserved.
//

import UIKit

class ScrollStackViewController: UIViewController {
    // MARK: - Private Properties
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()

    // MARK: - Lifecycle methods
    public override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        navigationItem.rightBarButtonItems = []
        setupView()
    }

    func addChildrenViewControllers() {
        // Override this function with the view sections
    }
    
    func setBackgroundColor(color: UIColor) {
        scrollView.backgroundColor = color
    }
}

extension ScrollStackViewController {
    // MARK: - view configuration methods
    private func setupView() {
        view.addSubview(scrollView)
        addChildrenViewControllers()
        scrollView.addSubview(stackView)
        scrollView.bounces = false
        stackView.axis = .vertical
        setupConstraints()
    }

    private func setupConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
        ])
    }

    func add(_ child: UIViewController) {
        addChild(child)
        stackView.addArrangedSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func add(_ child: UIView) {
        stackView.addArrangedSubview(child)
    }
}
