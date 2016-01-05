//
//  ShotDetailContoller.swift
//  DribbbleShot
//
//  Created by angelito on 3/14/15.
//  Copyright (c) 2015 Angelito. All rights reserved.
//

import UIKit

class ShotDetailContoller: UIViewController {
    
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var topGradientView: UIView!
    @IBOutlet weak var dateImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var viewsCount: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var likesCount: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var commentsCount: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!


    var shot : Shot!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.font = UIFont(name: MegaTheme.fontName, size: 21)
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.text = shot.title
        
        dateLabel.font = UIFont(name: MegaTheme.fontName, size: 10)
        dateLabel.textColor = UIColor.whiteColor()
        dateLabel.text = shot.date
        
        dateImageView.image = UIImage(named: "clock")?.imageWithRenderingMode(.AlwaysTemplate)
        dateImageView.tintColor = UIColor.whiteColor()

        // Do any additional setup after loading the view.
        if let imageData = shot.imageData {
            topImageView.image = UIImage(data: imageData)
        }else{
            Utils.asyncLoadShotImage(shot, imageView: topImageView)
        }
        
        nameLabel.font = UIFont(name: MegaTheme.fontName, size: 16)
        nameLabel.textColor = UIColor.blackColor()
        nameLabel.text = "by \(shot.user.name)"
        
        Utils.asyncLoadUserImage(shot.user, imageView: profileImageView)
        profileImageView.layer.cornerRadius = 18
        profileImageView.clipsToBounds = true
        
        
        let statsCountFontSize : CGFloat = 16
        let statsLabelFontSize : CGFloat = 12
        let statsCountColor = UIColor(red: 0.32, green: 0.61, blue: 0.94, alpha: 1.0)
        let statsLabelColor = UIColor(white: 0.7, alpha: 1.0)
        
        viewsCount.font = UIFont(name: MegaTheme.boldFontName, size: statsCountFontSize)
        viewsCount.textColor = statsCountColor
        viewsCount.text = "\(shot.viewsCount)"
        
        viewsLabel.font = UIFont(name: MegaTheme.fontName, size: statsLabelFontSize)
        viewsLabel.textColor = statsLabelColor
        viewsLabel.text = "VIEWS"
        
        likesCount.font = UIFont(name: MegaTheme.boldFontName, size: statsCountFontSize)
        likesCount.textColor = statsCountColor
        likesCount.text = "\(shot.likesCount)"
        
        likesLabel.font = UIFont(name: MegaTheme.fontName, size: statsLabelFontSize)
        likesLabel.textColor = statsLabelColor
        likesLabel.text = "LIKES"
        
        commentsCount.font = UIFont(name: MegaTheme.boldFontName, size: statsCountFontSize)
        commentsCount.textColor = statsCountColor
        commentsCount.text = "\(shot.commentCount)"
        
        commentsLabel.font = UIFont(name: MegaTheme.fontName, size: statsLabelFontSize)
        commentsLabel.textColor = statsLabelColor
        commentsLabel.text = "COMMENTS"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        addShotGradient()
    }
    
    func addShotGradient(){
        topGradientView.clipsToBounds = true
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRectMake(0, 0, 1000, 90)
        gradientLayer.colors = [UIColor(white: 0.0, alpha: 0.0).CGColor, UIColor(white: 0.0, alpha: 0.5).CGColor]
        
        self.topGradientView.layer.addSublayer(gradientLayer)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
