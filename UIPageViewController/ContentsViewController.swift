//
//  ContentsViewController.swift
//  UIPageViewController
//
//  Created by andrew on 6.05.22.
//

import UIKit

class ContentsViewController: UIViewController {

    @IBOutlet weak var presentationText: UILabel!
    
    @IBOutlet weak var presentationEmoji: UILabel!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var button: UIButton!
    
    var presentText = "" //текст презентации
    var emoji = "" //эмоджи
    var currentPage = 0 //номер текущей страницы
    var numberOfPages = 0 //общее количество страниц
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentationText.text = presentText
        presentationEmoji.text = emoji
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = currentPage
      
        
    }
    
    @IBAction func buttonCancel(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard//также тут создадим экземпляр класса юзердефолтс,чтоб сохранить что презентауия была просмотрена, по факту потом делаем ключ в настройках приложения,он сохранится пока рабоатет приложение
        userDefaults.set(true, forKey: "Presentation was viewed")// по факту присвоили что презентация просмотрена когда будет полседний элемент массива
        dismiss(animated: true, completion: nil)
    }
    

}
