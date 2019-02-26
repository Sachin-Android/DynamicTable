//
//  ViewController.swift
//  DynamicHeight
//
//  Created by WIthYouHamesh on 14/02/19.
//  Copyright © 2019 SachinDaingade. All rights reserved.
//

import UIKit


class Circle
{
    
    var radius : Double = 0.0
    {
        willSet
        {
            print("New value set \(newValue)")
        }
        didSet
        {
              print("New value set \(oldValue)")
            if radius < 0
            {
                radius = 0
            }
            
            
        }
    }
    
    
    
    public private(set) var area: Double = 0
    public private(set) var diameter: Double = 0
    private func calculateFigure()
    {
        area = Double.pi * radius * radius
        diameter = 2 * Double.pi * radius
    }
    
}


class lazyInitial
{
    lazy var name: String  =   {
        print("Data initialized )")
        return "Hello World"
        
    }()
    
    
    var lastName: String = "Hello Data"
}



class ViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{
    
    
    
    
    
    @IBOutlet weak var tblProduct: UITableView!
    
    var arrTitle = [""]
    var arrDesc = [""]
    var arrCarDesc = [""]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let obj = Circle()
        obj.radius = 10
        print("area = \(obj.area)")
        print("Diameter = \(obj.diameter)")
        
     //   obj.area = 30
        
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tblProduct.register(UINib.init(nibName: "DynamicCell", bundle: nil), forCellReuseIdentifier: "DynamicCell")
        tblProduct.estimatedRowHeight = 80
        tblProduct.rowHeight = UITableView.automaticDimension
        
        arrTitle = ["1","2","3","Warning once only: Detected a case where constraints ambiguously suggest a height of zero for a tableview cell's content view. We're considering the collapse unintentional and using standard height instead.","5"]
        
        arrDesc = ["Warning once only","2","3","Warning once only: Detected a case where constraints ambiguously suggest a height of zero for a tableview cell's content view. We're considering the collapse unintentional and using standard height instead.","2019-02-14 12:12:32.530426+0530 DynamicHeight[5457:239625] [Warning] Warning once only: Detected a case where constraints ambiguously suggest a height of zero for a tableview cell's content view. We're considering the collapse unintentional and using standard height instead."]
        
        arrCarDesc = ["Strong engine, long equipment list, ride quality Why I would avoid it? Rear seat comfort could be better, interior fit and finish not the best in class There is a lot that can be said about how far compact SUVs have come in just a few years’ time. The car that you see here, Mahindra’s all-new XUV300, is a prime example of a carmaker ordained to go all-out, in what can only be described as a definitive move towards a premium offering. The XUV300 is galaxies apart from Mahindra’s other compact SUV, the TUV300, and is set to lead the brand’s mantra of offering a whole lot of features and comfort at an affordable price.From the outside, it is impossible to muddle up the XUV300 for anything else with its well-defined nose that sits pointy with the signature Mahindra six-slat grille and the heavy bumper. What’s new to the 300 is the tear-drop layout for the daytime running lights which look rather unique. Speaking of which, we also like the swirly design of the 17-inch alloys and the high upright stance that this car has. That said, the thing that we are not sure of is the way the XUV300 looks in profile – the long hood and front overhang combined with the high stance and the complete lack of rear overhang make the whole car look quite disproportionate. In terms of dimensions, the XUV300 is marginally wider and taller than the Tata Nexon and its 2600mm wheelbase is the best-in-segment, too. All in all, it’s a good looking car with plenty of appetising details like the kink on the rear door and the smartly designed LED taillights but there is no meat to the design and the silhouette could have been executed better as well. The exterior may not be to everyone’s taste but the interior of the XUV300 puts up a solid case for itself. The two-tone cabin, in fact, offers a commanding view over the road with a high seating position that immediately inspires confidence. Unlike the all-black insides of the Brezza and the Nexon, there is an insulated ambience to the 300’s cabin with a sea of gloss black and silver trim giving it that stately, premium appearance. Speaking of premium, we really like the look of the leather finished steering wheel and the bright coloured upholstery. However, there are some ill-fitting bits as well – the climate control dial and the switches around it, for instance, feel tacky and the lack of soft-touch materials dampens the overall perceived quality. Space upfront is great with plenty of knee room to stretch out. The seats are big and supportive as well and it’s the same story at the back, which offers more than enough headroom. What’s not so great though is the lack of under thigh support and the modest legroom. Despite having the longest wheelbase in its segment, the knee-room is just about average. The cushioning is also a little too firm for our liking. No such groaning when it comes to storage. Throughout the cabin, there are enough storage spaces for your phone, wallet, bottles and lots more. You get a deep glove box that can fit a laptop, plenty of cubby holes between the front seats, open tray on the dash and big bottle holders on all four doors.When it comes to equipment, the XUV300 is simply unbeatable. The top-spec W8 (O) variant that we had on test is loaded with segment-first features including 7 airbags, dual zone climate control with memory function, front parking sensors, heated mirrors, and disc brakes for all four wheels. Other noteworthy features include a sunroof, cruise control, push button start, leather seats, hill hold function and a 7-inch infotainment system with smartphone mirroring tech and navigation. Even though it’s absolutely feature loaded, the infotainment system lacks the outright display crispness and ease of use that the competition offers.How does it drive?   For this test we have the diesel-powered XUV300 which gets a 1.5-litre, four-cylinder diesel engine. Also found in the Marazzo MPV, this engine makes 115bhp at 3,750nm and 300Nm between 1,500 and 2,500rpm. Straightway, the most impressive thing about this engine is that it makes maximum torque from as low as 1,500rpm which is always good for low speed drivability. Naturally, the XUV300 is effortless right from the word go – everything from low speed pull to a highway pass is done with ease thanks to the strong bottom end and mid-range. This engine pulls particularly hard in the midrange, with a steady flow of torque right until 4,000rpm.","This diesel engine is also among the most silent performers in this segment. It’s a little louder than we expected at high revs but for daily duties, it is plenty refined and has more than enough grunt to get up to speed with minimal turbo lag. Even at triple digit speeds, the XUV300’s strong midrange keeps it punching away as it cruises in a fairly refined manner. All in all, this baby XUV punches above its weight and offers strong performance – as we found out, it didn’t feel weighed down or underpowered even with four adults and some luggage. Sadly, the 6-speed manual is bit of a let-down in comparison. Although its light and easy to row through the gears, it isn’t precise at all – the gearshift action is very vague and the throws are long, too.Drive it through bad patches of any road and you can be sure that the XUV300 is a true Mahindra at heart. Low speed bumps and undulations are dealt with minimal vibrations, however, the ride is a little noisy. Similarly, the ride remains composed at highway speeds as the bumps are soaked up with ease. In terms of handling, the XUV300 is nimble enough to feel confident behind the wheel. The feedback from the steering can be changed using different modes namely Normal, Comfort and Sport. Honestly, there isn’t much difference in normal or comfort but in sport, the steering delivers more of that crucial weighty reassurance at everyday speeds.", "This diesel engine is also among the most silent performers in this segment. It’s a little louder than we expected at high revs but for daily duties, it is plenty refined and has more than enough grunt to get up to speed with minimal turbo lag. Even at triple digit speeds, the XUV300’s strong midrange keeps it punching away as it cruises in a fairly refined manner. All in all, this baby XUV punches above its weight and offers strong performance – as we found out, it didn’t feel weighed down or underpowered even with four adults and some luggage. Sadly, the 6-speed manual is bit of a let-down in comparison. Although its light and easy to row through the gears, it isn’t precise at all – the gearshift action is very vague and the throws are long, too.Drive it through bad patches of any road and you can be sure that the XUV300 is a true Mahindra at heart. Low speed bumps and undulations are dealt with minimal vibrations, however, the ride is a little noisy. Similarly, the ride remains composed at highway speeds as the bumps are soaked up with ease. In terms of handling, the XUV300 is nimble enough to feel confident behind the wheel. The feedback from the steering can be changed using different modes namely Normal, Comfort and Sport. Honestly, there isn’t much difference in normal or comfort but in sport, the steering delivers more of that crucial weighty reassurance at everyday speeds.","This diesel engine is also among the most silent performers in this segment. It’s a little louder than we expected at high revs but for daily duties, it is plenty refined and has more than enough grunt to get up to speed with minimal turbo lag. Even at triple digit speeds, the XUV300’s strong midrange keeps it punching away as it cruises in a fairly refined manner. All in all, this baby XUV punches above its weight and offers strong performance – as we found out, it didn’t feel weighed down or underpowered even with four adults and some luggage. Sadly, the 6-speed manual is bit of a let-down in comparison. Although its light and easy to row through the gears, it isn’t precise at all – the gearshift action is very vague and the throws are long, too.Drive it through bad patches of any road and you can be sure that the XUV300 is a true Mahindra at heart. Low speed bumps and undulations are dealt with minimal vibrations, however, the ride is a little noisy. Similarly, the ride remains composed at highway speeds as the bumps are soaked up with ease. In terms of handling, the XUV300 is nimble enough to feel confident behind the wheel. The feedback from the steering can be changed using different modes namely Normal, Comfort and Sport. Honestly, there isn’t much difference in normal or comfort but in sport, the steering delivers more of that crucial weighty reassurance at everyday speeds.","This diesel engine is also among the most silent performers in this segment. It’s a little louder than we expected at high revs but for daily duties, it is plenty refined and has more than enough grunt to get up to speed with minimal turbo lag. Even at triple digit speeds, the XUV300’s strong midrange keeps it punching away as it cruises in a fairly refined manner. All in all, this baby XUV punches above its weight and offers strong performance – as we found out, it didn’t feel weighed down or underpowered even with four adults and some luggage. Sadly, the 6-speed manual is bit of a let-down in comparison. Although its light and easy to row through the gears, it isn’t precise at all – the gearshift action is very vague and the throws are long, too.Drive it through bad patches of any road and you can be sure that the XUV300 is a true Mahindra at heart. Low speed bumps and undulations are dealt with minimal vibrations, however, the ride is a little noisy. Similarly, the ride remains composed at highway speeds as the bumps are soaked up with ease. In terms of handling, the XUV300 is nimble enough to feel confident behind the wheel. The feedback from the steering can be changed using different modes namely Normal, Comfort and Sport. Honestly, there isn’t much difference in normal or comfort but in sport, the steering delivers more of that crucial weighty reassurance at everyday speeds."]
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        
        tableView.estimatedRowHeight = 84.0 // standard tableViewCell height
        tableView.rowHeight = UITableView.automaticDimension
        return 5
        
        
    }


    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return   UITableView.automaticDimension 
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: "DynamicCell") as! DynamicCell
        cell.lblTitle.text = arrTitle[indexPath.row]
        cell.lblDesc.text = arrDesc[indexPath.row]
        cell.lblCarDesc.text = arrCarDesc [indexPath.row];
        return cell;
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        self.navigationController?.pushViewController(vc, animated: true)

//        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ListViewController") as? ListViewController
//
//        self.navigationController?.pushViewController(vc!, animated: true)
   
    }
   


}

