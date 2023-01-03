import UIKit

final class MainController: UIViewController {

    private var presenter: MainPresenter?
    lazy var mainView: MainView = {
        let view = MainView()
        return view
    }()

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainView)
        setupConstraints()
        presenter = MainPresenter(viewController: self)
    }

    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard event?.subtype == UIEvent.EventSubtype.motionShake else { return }
        presenter?.phoneShaked()
    }
}

extension MainController {
    private func setupConstraints() {
        let constraints = [
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
