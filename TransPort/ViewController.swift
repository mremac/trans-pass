//
//  ViewController.swift
//  TransPort
//
//  Created by Eric McAllister on 08/04/2018.
//  Copyright © 2018 Eric McAllister. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,UIPopoverControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    var imagePickerController : UIImagePickerController!
    
    @IBAction func camera(_ sender: Any) {
        imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .camera
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        saveImage(imageName:"whatever")
    }
    
    @IBAction func load(_ sender: Any) {
        getImage(imageName:"whatever")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getImage(imageName: String){
        
        let fileManager = FileManager.default
        
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        
        if fileManager.fileExists(atPath: imagePath){
            imageView.image = UIImage(contentsOfFile: imagePath)
        }else{
            print("Panic! No Image!")
        }
    }
    
    func saveImage(imageName: String){
        //create an instance of the FileManager
        _ = FileManager.default
        //get the image path
        _ = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        //get the image we took with camera
        let image = imageView.image!
        //get the PNG data for this image
        _ = UIImagePNGRepresentation(image)
        //store it in the document directory    fileManager.createFile(atPath: imagePath as String, contents: data, attributes: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[String : Any]) {
        
        let tempImage:UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = tempImage
        print("hello")
        
        self.dismiss(animated:true, completion: nil)
    }
    
//    func imagePickerControllerDidCancel(picker: UIImagePickerController!) {
//        self.dismissModalViewControllerAnimated(true)
//    }
}
