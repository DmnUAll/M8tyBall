import UIKit
import MediaPlayer

// MARK: - MainPresenter
final class MainPresenter {

    // MARK: - Properties and Initializers
    weak var viewController: MainController?
    private var player: AVAudioPlayer?
    private let answers = Answers()

    init(viewController: MainController? = nil) {
        self.viewController = viewController
        viewController?.mainView.delegate = self
    }
}

// MARK: - Helpers
extension MainPresenter {

    private func playSound(_ soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "wav") else { return }
        guard let playerWithAudio = try? AVAudioPlayer(contentsOf: url) else { return }
        player = playerWithAudio
        player?.play()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: { [weak self] in
            guard let self = self else { return }
            self.player?.stop()
            self.player = nil
        })
    }

    func phoneShaked() {
        playSound("magic")
        viewController?.mainView.answerLabel.text = answers.ballAnswer
    }
}

// MARK: - MainViewDelegate
extension MainPresenter: MainViewDelegate {

    func ballTapped() {
        playSound("magic")
        viewController?.mainView.answerLabel.text = answers.ballAnswer
    }
}
