//
//  HelpViewController.swift
//  CodeKeeper
//
//  Created by Alexandr Yanski on 24.03.17.
//  Copyright © 2017 Alexandr Yanski. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {
    
    @IBOutlet weak var helpText: UITextView!
    @IBOutlet weak var dismissHelpButton: UIButton!

    var helpTemp = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        helpText.layer.cornerRadius = 5
        dismissHelpButton.layer.cornerRadius = 5
        
        switch helpTemp {
            case 1:
            self.view.backgroundColor = UIColor(red: 255/255, green: 60/255, blue: 78/255, alpha: 1)
            self.helpText.text = "Java — строго типизированный объектно-ориентированный язык программирования, разработанный компанией Sun Microsystems (в последующем приобретённой компанией Oracle). Приложения Java обычно транслируются в специальный байт-код, поэтому они могут работать на любой компьютерной архитектуре, с помощью виртуальной Java-машины.\nДругой важной особенностью технологии Java является гибкая система безопасности, в рамках которой исполнение программы полностью контролируется виртуальной машиной. Любые операции, которые превышают установленные полномочия программы (например, попытка несанкционированного доступа к данным или соединения с другим компьютером), вызывают немедленное прерывание."
            break
            
            case 2:
            self.view.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
            self.helpText.text = "C++ — компилируемый, статически типизированный язык программирования общего назначения. Поддерживает такие парадигмы программирования, как процедурное программирование, объектно-ориентированное программирование, обобщённое программирование, обеспечивает модульность, раздельную компиляцию, обработку исключений, абстракцию данных, объявление типов (классов) объектов, виртуальные функции.\nСтандартная библиотека включает, в том числе, общеупотребительные контейнеры и алгоритмы. C++ сочетает свойства как высокоуровневых, так и низкоуровневых языков. В сравнении с его предшественником — языком C, — наибольшее внимание уделено поддержке объектно-ориентированного и обобщённого программирования.\nC++ широко используется для разработки программного обеспечения, являясь одним из самых распространенных, наиболее часто используемых языков программирования"
            break
            
            case 3:
            self.view.backgroundColor = UIColor(red: 250/255, green: 105/255, blue: 47/255, alpha: 1)
            self.helpText.text = "Swift — открытый мультипарадигмальный компилируемый язык программирования общего назначения. Создан компанией Apple в первую очередь для разработчиков iOS и OS X. Swift работает с фреймворками Cocoa и Cocoa Touch и совместим с основной кодовой базой Apple, написанной на Objective-C. Swift задумывался как более легкий для чтения и устойчивый к ошибкам программиста язык, нежели предшествовавший ему Objective-C. Программы на Swift компилируются при помощи LLVM, входящей в интегрированную среду разработки Xcode 6 и выше. Swift может использовать рантайм Objective-C, что делает возможным использование обоих языков (а также С) в рамках одной программы."
            break
            default: return
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissViewController(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
