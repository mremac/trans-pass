//
//  ViewController.swift
//  TransPort
//
//  Created by Eric McAllister on 08/04/2018.
//  Copyright © 2018 Eric McAllister. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,UIPopoverControllerDelegate,UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(8)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var floatHeight = 50.0
        switch(indexPath.row) {
        case 0:
            break
        case 1:
            floatHeight = 540.0
            break
        case 2:
            floatHeight = 420.0
            break
        default:
            break
        }
        return(CGFloat(floatHeight))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "blankCell")
        switch(indexPath.row) {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "titleCell")
            break
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "govText")
            break
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: "equActText")
            break
        case 3:
            cell = tableView.dequeueReusableCell(withIdentifier: "moreInfoText")
            break
        default:
            cell = tableView.dequeueReusableCell(withIdentifier: "blankCell")
            break
        }
        
        print("hello")
        
        return cell!
    }
    
    
    @IBOutlet weak var imageView: UIImageView!
    var imagePickerController : UIImagePickerController!
    
    @IBAction func camera(_ sender: Any) {
        print("hello")
        imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .camera
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        saveImage(imageName:"111")
    }
    
    @IBAction func load(_ sender: Any) {
        getImage(imageName:"111")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getImage(imageName:"111")
        
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
        let fileManager = FileManager.default
        //get the image path
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        print(imagePath)
        //get the image we took with camera
        let image = imageView.image!
        //get the PNG data for this image
        let data = UIImagePNGRepresentation(image)
        //store it in the document directory
        fileManager.createFile(atPath: imagePath as String, contents: data, attributes: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[String : Any]) {
        
        let tempImage:UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = tempImage
        
        saveImage(imageName:"111")
        
        self.dismiss(animated:true, completion: nil)
    }
    
//    func imagePickerControllerDidCancel(picker: UIImagePickerController!) {
//        self.dismissModalViewControllerAnimated(true)
//    }
}
