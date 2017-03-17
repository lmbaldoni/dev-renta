import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-hierarchies-comp',
  templateUrl: './hierarchies-comp.component.html',
  styleUrls: ['./hierarchies-comp.component.css']
})
export class HierarchiesCompComponent implements OnInit {

  constructor() { }

  CreateMemderbuttonWasClicked: boolean = false;
   SearchMemderbuttonWasClicked: boolean = true;

  setButtonClicked(clicked: boolean) {
      this.CreateMemderbuttonWasClicked = clicked;
      this.SearchMemderbuttonWasClicked = !clicked;
  }

  ngOnInit() {
  }

}
