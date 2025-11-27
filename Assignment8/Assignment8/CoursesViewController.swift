//
//  CoursesViewController.swift
//  Assignment8
//
//  View Controller для отображения списка курсов
//

import UIKit

class CoursesViewController: UITableViewController {
    
    // MARK: - Properties
    var courses: [Course] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        loadData()
        setupTableView()
    }
    
    // MARK: - Setup
    private func setupUI() {
        title = "Courses"
        view.backgroundColor = .systemBackground
    }
    
    private func setupTableView() {
        tableView.rowHeight = 90
    }
    
    private func loadData() {
        courses = [
            Course(title: "iOS Development with SwiftUI", instructor: "Paul Hudson", imageName: "course1",
                   description: "A comprehensive course covering iOS app development using SwiftUI, Apple's modern declarative framework. Learn to build beautiful, responsive iOS apps from scratch. Topics include state management, navigation, data persistence, networking, animations, and publishing to the App Store. Includes real-world projects and best practices.",
                   review: "Outstanding course! Paul Hudson is an excellent teacher who explains complex concepts clearly. The projects are practical and engaging. I went from beginner to building my own apps. The SwiftUI coverage is thorough and up-to-date. Highly recommended for anyone serious about iOS development. 10/10"),
            
            Course(title: "Complete Web Development Bootcamp", instructor: "Angela Yu", imageName: "course2",
                   description: "Learn full-stack web development from the ground up. This bootcamp covers HTML, CSS, JavaScript, Node.js, React, MongoDB, and more. Build over 30 real-world projects including websites, web apps, and APIs. Perfect for beginners wanting to become professional web developers.",
                   review: "The best web development course I've taken! Angela's teaching style is engaging and easy to follow. The projects are diverse and build real skills. Going from complete beginner to building full-stack apps was amazing. Great value for the comprehensive content. 9.5/10"),
            
            Course(title: "Machine Learning A-Z", instructor: "Kirill Eremenko", imageName: "course3",
                   description: "Master Machine Learning with Python and R. Learn to create Machine Learning algorithms including Regression, Classification, Clustering, Deep Learning, and more. Understand the theory behind algorithms and get hands-on experience implementing them. No prior programming experience required.",
                   review: "Excellent introduction to machine learning! The instructors break down complex math into understandable concepts. The Python and R implementations are very helpful. Projects are practical and relevant to real-world applications. Great for beginners in ML. 9/10"),
            
            Course(title: "The Complete Digital Marketing Course", instructor: "Rob Percival", imageName: "course4",
                   description: "Learn SEO, YouTube Marketing, Facebook Marketing, Google Ads, Email Marketing, and much more. This comprehensive course covers 12 courses in 1, teaching you everything you need to know about digital marketing. Get certified and land your dream job or grow your business.",
                   review: "Incredibly comprehensive! Covers all aspects of digital marketing in depth. Rob's explanations are clear and actionable. I implemented strategies immediately and saw results. Great for both beginners and those looking to formalize their knowledge. 8.5/10"),
            
            Course(title: "Complete Python Bootcamp", instructor: "Jose Portilla", imageName: "course5",
                   description: "Go from zero to hero in Python 3. Learn Python like a professional with this comprehensive course. Build 10 real-world Python programs. Understand both Python 2 and 3. Learn advanced Python features like decorators, generators, and more. Perfect for beginners and those wanting to level up.",
                   review: "The definitive Python course! Jose is an exceptional teacher who makes programming accessible. The progression from basics to advanced topics is perfect. Projects are engaging and build confidence. I can now code confidently in Python. Absolutely worth it! 10/10"),
            
            Course(title: "UI/UX Design Specialization", instructor: "Scott Klemmer", imageName: "course6",
                   description: "Learn the design process from start to finish. This specialization covers user research, prototyping, user testing, and design principles. Create a portfolio of real-world projects. Learn industry-standard tools like Figma and Adobe XD. Perfect for aspiring designers and developers wanting to improve their design skills.",
                   review: "Transformed how I think about design! The emphasis on user research and testing is invaluable. Scott's teaching is engaging and backed by research. Projects force you to apply concepts immediately. Essential for anyone creating digital products. 9/10"),
            
            Course(title: "Data Science Specialization", instructor: "Johns Hopkins University", imageName: "course7",
                   description: "A 10-course specialization covering the entire data science pipeline. Learn R programming, statistical inference, regression models, machine learning, and more. Work with real datasets and complete a capstone project. Offered by Johns Hopkins University through Coursera.",
                   review: "Rigorous and comprehensive! The academic approach ensures deep understanding. R programming skills developed are directly applicable. The capstone project is challenging but rewarding. Great preparation for a data science career. Requires dedication but worth it. 9/10"),
            
            Course(title: "AWS Certified Solutions Architect", instructor: "Ryan Kroonenburg", imageName: "course8",
                   description: "Prepare for the AWS Certified Solutions Architect Associate exam. Learn to design and deploy scalable, highly available systems on AWS. Cover EC2, S3, RDS, VPC, IAM, and many other services. Includes hands-on labs and practice exams. Get certified and boost your cloud computing career.",
                   review: "Perfect exam preparation! Ryan covers every topic thoroughly with practical examples. The labs are essential for understanding AWS services. Passed the exam on first attempt! Great for both learning AWS and certification. Highly recommended. 9.5/10"),
            
            Course(title: "Complete Blender Creator", instructor: "Grant Abbitt", imageName: "course9",
                   description: "Learn 3D modeling and animation with Blender, the free and open-source 3D creation suite. Create characters, props, and environments. Learn modeling, texturing, lighting, and animation. Build a portfolio of impressive 3D projects. Perfect for aspiring 3D artists and game developers.",
                   review: "Amazing course for learning Blender! Grant's teaching style is patient and encouraging. The projects progressively build your skills. Going from complete beginner to creating impressive 3D art was incredible. Blender is powerful and this course unlocks it. 9/10"),
            
            Course(title: "Algorithmic Trading with Python", instructor: "Nick McCullum", imageName: "course10",
                   description: "Learn to build algorithmic trading strategies using Python. Cover quantitative finance fundamentals, backtesting strategies, and live trading. Use popular libraries like pandas, NumPy, and more. Build real trading algorithms based on technical indicators and machine learning. For those interested in quantitative finance.",
                   review: "Fascinating intersection of finance and programming! Nick explains complex concepts clearly. The strategies taught are practical and can be implemented. Great introduction to quantitative trading. Requires Python knowledge but very rewarding. 8.5/10")
        ]
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCourseDetail",
           let detailVC = segue.destination as? CourseDetailViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            detailVC.course = courses[indexPath.row]
        }
    }
}

// MARK: - UITableViewDataSource
extension CoursesViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CourseCell", for: indexPath) as? CourseTableViewCell else {
            return UITableViewCell()
        }
        
        let course = courses[indexPath.row]
        cell.configure(with: course)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CoursesViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showCourseDetail", sender: nil)
    }
}
