import UIKit

class ViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var labelCima: UILabel!
    @IBOutlet weak var labelBaixo: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: Actions
    @IBAction func inciar(_ sender: UIButton) {
        
        //Abrindo a tarefa assincrono
        DispatchQueue.global().async {
            
            //Primeira label que será atualizada em tempo real
            DispatchQueue.global().sync(execute: {
                
                for i in 1...10 {
                    DispatchQueue.main.async(execute: {self.labelCima.text = "\(i)"})
                    Thread.sleep(forTimeInterval: 1.0)
                }
            
            })
            
            //Segunda label que será atualizada em tempo real, logo apos a primeira
            DispatchQueue.global().sync {
                
                for i in 11...20 {
                    DispatchQueue.main.async(execute: {self.labelBaixo.text = "\(i)"})
                    Thread.sleep(forTimeInterval: 1.0)
                }
                
            }
        }
        
    }

}

