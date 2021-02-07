import 'dart:core';

class CreditObject
{
  String icon;
  String creator;
  String creatorLink;
  String source;
  String sourceLink;

  CreditObject(this.icon, this.creator, this.creatorLink, this.source, this.sourceLink);
  
  static List<CreditObject> getCredits()
  {
    return 
    [
      CreditObject("teacher", "iconixar","https://www.flaticon.com/free-icon/teacher_2883743?related_item_id=2883939&term=teacher", "Flaticon","https://www.flaticon.com/" ),
      CreditObject("student", "Freepik","http://www.freepik.com/", "Flaticon","https://www.flaticon.com/" ),
      CreditObject("options", "Freepik","https://www.flaticon.com/authors/freepik", "Flaticon","https://www.flaticon.com/" ),
      CreditObject("data center", "monkik","https://www.flaticon.com/authors/monkik", "Flaticon","https://www.flaticon.com/" ),
      CreditObject("home", "Freepik","http://www.freepik.com/", "Flaticon","https://www.flaticon.com/" ),
      CreditObject("student", "Freepik","https://www.flaticon.com/authors/freepik", "Flaticon","https://www.flaticon.com/" ),
      CreditObject("exam", "Freepik","http://www.freepik.com/", "Flaticon","https://www.flaticon.com/" ),
      CreditObject("books", "Freepik","http://www.freepik.com/", "Flaticon","https://www.flaticon.com/" ),
      CreditObject("clipboard", "Freepik","http://www.freepik.com/", "Flaticon","https://www.flaticon.com/" ),
      CreditObject("Papyrus", "Freepik","http://www.freepik.com/", "Flaticon","https://www.flaticon.com/" ),
      CreditObject("teacher ", "Freepik","http://www.freepik.com/", "Flaticon","https://www.flaticon.com/" ),
      CreditObject("send mail", "Freepik","https://www.flaticon.com/authors/freepik", "Flaticon","https://www.flaticon.com/" ),
      CreditObject("Document","Freepik","https://www.flaticon.com/authors/freepik","Flaticon","https://www.flaticon.com/"),
      CreditObject("Down arrow","Pixel perfect","https://www.flaticon.com/authors/pixel-perfect","Flaticon","https://www.flaticon.com/"),

    ];
  }
}