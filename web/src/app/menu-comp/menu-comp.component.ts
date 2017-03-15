import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-menu-comp',
  templateUrl: './menu-comp.component.html',
  styleUrls: ['./menu-comp.component.css']
})
export class MenuCompComponent implements OnInit {

  constructor() { }

  membersClicked: boolean = false;
  attributesClicked: boolean = false;
  hierarchiesClicked: boolean = false;
  filtersClicked: boolean = false;

  setMembersClicked(clicked: boolean) {
      this.membersClicked = clicked;
      /*ocultar*/
      this.attributesClicked = !clicked;
      this.hierarchiesClicked = !clicked;
      
  }

  setAttributesClicked(clicked: boolean) {
      this.attributesClicked = clicked;
      /*ocultar*/
      this.membersClicked = !clicked;
      this.hierarchiesClicked = !clicked;
  }


  setHierarchiesClicked(clicked: boolean) {
      this.hierarchiesClicked = clicked;
      /*ocultar*/
      this.attributesClicked = !clicked;
      this.membersClicked = !clicked;
  }

   setFiltersClicked(clicked: boolean) {
      this.filtersClicked = clicked;
      /*ocultar*/
      this.attributesClicked = !clicked;
      this.membersClicked = !clicked;
      this.hierarchiesClicked = !clicked;
  }



  ngOnInit() {
  }

}
