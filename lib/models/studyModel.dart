class Document{
  String? doc_title;
   String? doc_url;
   String? img;
  static const String? ml =  "assets//images/white.png";
   // String? doc_date;
   // int? page_num;

    Document( this.doc_title,this.doc_url, this.img
   // this.doc_date, this.page_num
    );
  // Image.asset(
            //   'assets//images/white.png',
            //   fit: BoxFit.cover,
            //   width: 55,
            //   height: 55,
            // ),

    static List<Document> doc_list = [
      Document("Machine Learning",
       "https://www.tutorialspoint.com/machine_learning/machine_learning_tutorial.pdf", 
      "assets/images/ml.png"
    
       ),
        Document("Cybersecurity",
       "https://www.ftc.gov/system/files/attachments/cybersecurity-small-business/cybersecuirty_sb_factsheets_all.pdf", 
       "assets/images/cyber.jpg"
     
       ),
        Document("Blockchain",
       "https://ccl.yale.edu/sites/default/files/files/A%20Brief%20Introduction%20to%20Blockchain%20(Final%20without%20Notes).pdf", 
       "assets/images/block.jpg"
      
       ),

         Document("Operating System",
       "https://www.tutorialspoint.com/operating_system/operating_system_tutorial.pdf", 
       "assets/images/os.jpg"
      
       ),
         Document("Data Structures and Algorithms",
       "https://www.tutorialspoint.com/data_structures_algorithms/data_structures_algorithms_tutorial.pdf", 
       "assets/images/dsaa.jpg"
      
       ),
         Document("Computer Networks",
       "https://ncert.nic.in/textbook/pdf/lecs110.pdf", 
       "assets/images/cn.jpg"
      
       ),
        Document("Mobile Application Development",
       "https://baou.edu.in/assets/pdf/MSCIT_302_slm.pdf", 
       "assets/images/appp.jpg"
     
       ),
        Document("Artifical Intelligence",
       "https://www.tutorialspoint.com/artificial_intelligence/artificial_intelligence_tutorial.pdf", 
       "assets/images/ai.jpg"
      
       ),

         Document("Software Engineering",
       "https://www.tutorialspoint.com/software_engineering/software_engineering_tutorial.pdf", 
       "assets/images/sw.jpg"
      
       ),
         Document("Website Development",
       "https://www.tutorialspoint.com/website_development/website_development_tutorial.pdf", 
       "assets/images/webb.jpg"
      
       ),
         Document("Data Science",
       "https://www.tutorialspoint.com/agile_data_science/agile_data_science_tutorial.pdf", 
       "assets/images/ds.jpg"
      
       ),
    ];

}