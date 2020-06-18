//Class that manages tasks (The list items) and whether they are done or not 

class ListItem{
  String task;
  bool isChecked;
  ListItem(this.task,this.isChecked);

  void toggle(){
    isChecked=!isChecked;
  }

}
