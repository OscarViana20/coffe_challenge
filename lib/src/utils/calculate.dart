  double textMovePosition(double width, int page, int index) {
    //double width = MediaQuery.of(context).size.width;
    if (index == page) {        
      return width / 2 - 125;
    }

    if (index > page) {
      return -width * 2;
    }
    return width * 2;
  }
  
  double textOpacity(int page, int index) {
    if (index == page) {        
      return 1;
    }
    return 0;
  }

  double assignPosition(double height, int page, int index) {
    //double height = MediaQuery.of(context).size.height;
    if (index == page) {
      return height * 0.45;
    }

    if (page - index == 1) {
      return height * 0.38;
    }

    if (page - index == 2) {
      return height * 0.33;
    }

    return height;
  }

  double assignOpacity(int page, int index) {
    if (index >= page ) {
      return 1.0;
    }
    if (page - index == 1) {
      return 1.0;
    }
    if (page - index == 2) {
      return 0.5;
    }
    return 0.0;
  }

  double assignHeight(double width , int page, int index) {
    //double width = MediaQuery.of(context).size.width;
    if (index >= page) {
        return width;
    }

    if (page - index == 1) {
      return width / 2;
    }

    if (page - index == 2) {      
      return width / 3;
    }      

    return 0.0;
  }