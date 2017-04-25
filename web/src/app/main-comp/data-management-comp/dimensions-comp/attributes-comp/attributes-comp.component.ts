import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-attributes-comp',
  templateUrl: './attributes-comp.component.html',
  styleUrls: ['./attributes-comp.component.css']
})
export class AttributesCompComponent implements OnInit {

  constructor() { }

   CreateMemderbuttonWasClicked: boolean = false;
   SearchMemderbuttonWasClicked: boolean = true;

  setButtonClicked(clicked: boolean) {
      this.CreateMemderbuttonWasClicked = clicked;
      this.SearchMemderbuttonWasClicked = !clicked;
  }
  public members = [];

  ngOnInit() {
  }

}
