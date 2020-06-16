

class ListItem{
  String task;
  bool isChecked;
  ListItem(this.task,this.isChecked);

  void toggle(){
    isChecked=!isChecked;
  }

}