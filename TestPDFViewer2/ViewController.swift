//
//  ViewController.swift
//  TestPDFViewer2
//
//  Created by Andrii on 12.06.2022.
//

import UIKit
import WebKit
import MobileCoreServices
import UniformTypeIdentifiers
import PDFJSReader

class ViewController: UIViewController, UIDocumentPickerDelegate, WKUIDelegate{
    @IBOutlet weak var containerView: UIView!
    
    private var webView: WKWebView? = nil
    
    
    @IBAction func pickFile(_ sender: Any) {
        let types = UTType.types(tag: "pdf",
                                     tagClass: UTTagClass.filenameExtension,
                                     conformingTo: nil)
//            let documentPickerController = UIDocumentPickerViewController(
//                    forOpeningContentTypes: types
//)
        
        let documentPickerController = UIDocumentPickerViewController(documentTypes: [String(kUTTypePDF)], in: .import)
            documentPickerController.delegate = self
            self.present(documentPickerController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let configuration = WKWebViewConfiguration()
        configuration.setValue(true, forKey: "_allowUniversalAccessFromFileURLs")
//        let configuration = WKWebViewConfiguration()
//            configuration.allowsInlineMediaPlayback = true
//            configuration.allowsAirPlayForMediaPlayback = true
//            configuration.mediaTypesRequiringUserActionForPlayback = []
//
            webView = WKWebView(frame: containerView.frame, configuration: configuration)
            webView!.translatesAutoresizingMaskIntoConstraints = false
            //containerView.addSubview(webView!)

//            NSLayoutConstraint.activate([
//                webView!.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
//                webView!.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
//                webView!.topAnchor.constraint(equalTo: containerView.topAnchor),
//                webView!.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
//            ])
        
        
        //OutletWeb.uiDelegate = self
        let filePath = Bundle.main.resourceURL?.appendingPathComponent("PDFjs/web/viewer.html").path
        
        let path = Bundle.main.url(forResource: "viewer", withExtension: "html", subdirectory: "pdfjs/web")
        
        let dir = path!.deletingLastPathComponent()
        
        let myUrl = URL(fileURLWithPath: filePath!)
       // webView!.loadFileURL(path!, allowingReadAccessTo: dir)
       // let nyReq = URLRequest(url: path!)
       // OutletWeb.loadFileURL(path!, allowingReadAccessTo: dir)

        //OutletWeb.load(nyReq)
        
       // if let filePath = Bundle.main.path(forResource: <#T##String?#>, ofType: <#T##String?#>)
        // Do any additional setup after loading the view.
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        
        let ii = 0
        
        let first = urls.first
        
       // let data = NSData(contentsOf: first!)
        let pp = first!.path
        
        let pdfjs = containerView as! PDFJSReader.PDFJSView
        
        pdfjs.source = first
        
       // let data = NSData(contentsOfFile: pp)
       // let iii = 0
//        let ttt = FileManager.default.contents(atPath: pp)
      //  let length = data?.length
        
      //  var myArray = [UInt8](repeating: 0, count: length!)
        
      //  data?.getBytes(&myArray, length: length!)
        
       // let str = "PDFViewerApplication.open(new Uint8Array(\(myArray)));"
        
//        let str2 = "pdfjsLib.getDocument('\(pp)').promise.then(doc => { PDFViewerApplication.load(doc); });"
//        pdfjsLib.getDocument("/Users/andrii/Library/Developer/CoreSimulator/Devices/2E498C8A-35E9-4B47-A634-F8627295AE4C/data/Containers/Shared/AppGroup/CB29BE4D-DC53-427E-9854-DA3E6994C633/File%20Provider%20Storage/Downloads/progit.pdf").promise.then(doc => { PDFViewerApplication.load(doc); });
        
//        webView?.evaluateJavaScript(str2, completionHandler: {ob, err in
//
//        })
       // OutletWeb?.evaluateJavaScript(str, completionHandler: { ob,err in
            
       // })
    }
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {

        // Create new WKWebView with custom configuration here
        let configuration = WKWebViewConfiguration()
        configuration.setValue(true, forKey: "_allowUniversalAccessFromFileURLs")
        
        return WKWebView(frame: webView.frame, configuration: configuration)
    }


}

