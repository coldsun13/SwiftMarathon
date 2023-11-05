import UIKit

final class ViewController: UIViewController {
    
    private enum Constants {
        static let textLabelBottomAnchor = -10.0
        static let stoneImageHeight = 200.0
        static let stoneImageWidth = 200.0
        static let textLabelText = "I am poor"
        static let fontName = "HelveticaNeue-Bold"
        static let fontSize = 40.0
        static let stoneImageName = "stone"
     
    }
    
    private lazy var textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.text = Constants.textLabelText
        let font = UIFont(name: Constants.fontName, size: Constants.fontSize) ?? UIFont.preferredFont(forTextStyle: .largeTitle)
        textLabel.font = font
        textLabel.adjustsFontForContentSizeCategory = true
        return textLabel
    }()
    
    private lazy var stoneImageView: UIImageView = {
        let image = UIImage(named: Constants.stoneImageName)
        let stoneImageView = UIImageView(image: image)
        stoneImageView.translatesAutoresizingMaskIntoConstraints = false
        stoneImageView.contentMode = .scaleAspectFit
        return stoneImageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawSelf()
    }
}

private extension ViewController {
    
    func drawSelf() {
        view.backgroundColor = .orange
        view.addSubview(stoneImageView)
        view.addSubview(textLabel)
        let textLabelConstraints = setTextLabelConstraints()
        let stoneImageViewConstraints = setStoneImageViewConstraints()
        NSLayoutConstraint.activate(textLabelConstraints + stoneImageViewConstraints)
    }
    
    func setTextLabelConstraints() -> [NSLayoutConstraint] {
        
        let centerXAnchor = textLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        let bottomAnchortextLabel = textLabel.bottomAnchor.constraint(equalTo: stoneImageView.topAnchor, constant: Constants.textLabelBottomAnchor)
        
        return [centerXAnchor, bottomAnchortextLabel]
    }
    
    func setStoneImageViewConstraints() -> [NSLayoutConstraint] {
        
        let centerYAnchor = stoneImageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        let centerXAnchor = stoneImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        let heightAnchor = stoneImageView.heightAnchor.constraint(equalToConstant: Constants.stoneImageHeight)
        let widthAnchor = stoneImageView.widthAnchor.constraint(equalToConstant: Constants.stoneImageWidth)
        
        return [centerXAnchor, centerYAnchor, heightAnchor, widthAnchor]
    }
}



