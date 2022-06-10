//
//  ViewController.swift
//  UIPageViewController
//
//  Created by andrew on 6.05.22.
//

import UIKit

class ViewController: UIViewController {

    //тут запустим функцию старт презентэйшн через вью дид апир
    override func viewDidAppear (_ animated:Bool) {//срабатывает этот метод как вью отобразился на экране
     super.viewDidAppear(animated)

        startPresentation()
        
    }
    
  //необходим метод,который запустит pageviewcontroller
    func startPresentation() {
        
        //проверка на юзер дефолтс есть ли такой ключ что мы смотрели презентацию
        let userDefaults = UserDefaults.standard
        let presentationWasViewed = userDefaults.bool(forKey: "Presentation was viewed")//инфа тру фолс есть ли ключ
        if presentationWasViewed == false {
            if let pageViewController = storyboard?.instantiateViewController(withIdentifier: "PageViewController") as? PageViewController {//добираемся и создаем тут экземпляр pageviewcontroller
            present(pageViewController,animated: true, completion: nil)//отображаем вью контролер
            }
        }
    
    


}
}
