import UIKit

// MARK: - MainViewDelegate protocol
protocol MainViewDelegate: AnyObject {
    func ballTapped()
}

// MARK: - MainView
final class MainView: UIView {

    // MARK: - Properties and Initializers
    weak var delegate: MainViewDelegate?

    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutolayout()
        imageView.image = UIImage(named: "background")
        return imageView
    }()

    private lazy var infoLabel: UILabel = {
        makeLabel(withText: "Ask a question and shake your phone or press on the ball...",
                  size: 25, andColor: .mbBlueSky)
    }()

    lazy var answerLabel: UILabel = {
        makeLabel(withText: "", size: 24, andColor: .mbCream)
    }()

    private lazy var ballButton: UIButton = {
        let button = UIButton()
        button.toAutolayout()
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(ballTapped), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        toAutolayout()
        addSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Helpers
extension MainView {

    @objc private func ballTapped() {
        delegate?.ballTapped()
    }

    private func addSubviews() {
        addSubview(backgroundImageView)
        addSubview(infoLabel)
        addSubview(answerLabel)
        addSubview(ballButton)
    }

    private func setupConstraints() {
        let constraints = [
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            infoLabel.topAnchor.constraint(equalTo: topAnchor, constant: UIScreen.screenSize(heightDividedBy: 8)),
            infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            answerLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 6),
            answerLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -6),
            answerLabel.widthAnchor.constraint(equalToConstant: UIScreen.screenSize(heightDividedBy: 6.5)),
            answerLabel.heightAnchor.constraint(equalToConstant: UIScreen.screenSize(heightDividedBy: 6.5)),
            ballButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            ballButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -24),
            ballButton.widthAnchor.constraint(equalToConstant: UIScreen.screenSize(heightDividedBy: 2.5)),
            ballButton.heightAnchor.constraint(equalToConstant: UIScreen.screenSize(heightDividedBy: 2.5))
        ]
        NSLayoutConstraint.activate(constraints)
    }

    private func makeLabel(withText text: String, size: CGFloat, andColor color: UIColor) -> UILabel {
        let label = UILabel()
        label.toAutolayout()
        label.text = text
        label.font = UIFont(name: "Bradley Hand Bold", size: size)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = color
        label.shadowColor = .mbPurple
        label.isHighlighted = true
        return label
    }
}
