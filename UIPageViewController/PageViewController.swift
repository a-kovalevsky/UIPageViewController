//
//  PageViewController.swift
//  UIPageViewController
//
//  Created by andrew on 6.05.22.
//

import UIKit

class PageViewController: UIPageViewController {

    let presentScreenContent = ["Первая страница рассказывает о том что представляет из себя приложение","Вторая страница презентации приложения расскзаывает о какой-то удобной фишке приложения", "Третья страница презентации приложения рассказывает о чем-то интересном", "Ну  наконец последняя страница презентации с напутствием в добрый путь"]
    
    let emojiArray = ["👋","🦾","🖕🏿","👀"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self 
        
//отображаем вызывая функцию контент вью контроллер
        if let contentViewController = showViewControllerAtIndex(0) {
            setViewControllers([contentViewController], direction: .forward, animated: true, completion: nil)//то тогда обращаемсся к методу который делает массив вью контроллеров ,direction это направление движения
            //немного хз зачем етот массив
        }
        
    }
    func showViewControllerAtIndex(_ index: Int) -> ContentsViewController? {
        
        guard index >= 0 else {return nil}//проверки на номер страницы,общее кол-во страниц
        guard index < presentScreenContent.count else {
            
//            let userDefaults = UserDefaults.standard//также тут создадим экземпляр класса юзердефолтс,чтоб сохранить что презентауия была просмотрена, по факту потом делаем ключ в настройках приложения,он сохранится пока рабоатет приложение
//            userDefaults.set(true, forKey: "Presentation was viewed")// по факту присвоили что презентация просмотрена когда будет полседний элемент массива
//            dismiss(animated: true, completion: nil)
            return nil

        }//закроем вью контроллер,когда будет более 4 элементов массива,но и создаем 5 элемент пустой массива ,чтоб пользователь мог почитать
        guard let contentViewController = storyboard?.instantiateViewController(withIdentifier: "ContentsViewController") as? ContentsViewController else {return nil} //кастим до вью контролера(создаем экземпляр класса) с контентом через идентификатор, а на выходе с функции получаем его из пейджвью контроллер,или она сразу на выходе запускается ??
        contentViewController.presentText = presentScreenContent[index]
        contentViewController.emoji = emojiArray[index]
        contentViewController.currentPage = index
        contentViewController.numberOfPages = presentScreenContent.count
        
        return contentViewController //и получается возращаем экземпляр класса ContentsViewControlle и его надо отобразить,делаем во вью дидлоу
        
    }   //так как пэйдж вью контроллер не имеет вью,его надо создать(вернуть) с помощью етой функции
    

}


//для того,чтобы реализовать свайпы ,нужно подписаться под протокол соурс пэйдж вью контроллер,есть два обязательных методав ниже
extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var pageNumber = (viewController as! ContentsViewController).currentPage//нужно взять одно свойство,конкретный номер страницы
        pageNumber -= 1
      return showViewControllerAtIndex(pageNumber)//ну и по факут вызываем функцию с вычитаемым карэнт пэйдж к конкретным элементам массивам по этой цифре
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var pageNumber = (viewController as! ContentsViewController).currentPage
        pageNumber += 1
        if pageNumber == 4 {
            let pageButton = (viewController as! ContentsViewController).button
            pageButton?.isHidden = false
            return showViewControllerAtIndex(pageNumber)
        } else {
      return showViewControllerAtIndex(pageNumber)
    }
    }
    
    
}
