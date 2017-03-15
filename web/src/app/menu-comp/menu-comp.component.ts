import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-menu-comp',
  templateUrl: './menu-comp.component.html',
  styleUrls: ['./menu-comp.component.css']
})
export class MenuCompComponent implements OnInit {

  constructor() { }


/*hide show DATA MANAGEMENT*/

  membersClicked: boolean = false;
  attributesClicked: boolean = false;
  hierarchiesClicked: boolean = false;
  filtersClicked: boolean = false;

  setMembersClicked(clicked: boolean) {
      this.membersClicked = clicked;
      /*ocultar*/
      this.attributesClicked = !clicked;
      this.hierarchiesClicked = !clicked;
      this.filtersClicked = !clicked;
      
  }

  setAttributesClicked(clicked: boolean) {
      this.attributesClicked = clicked;
      /*ocultar*/
      this.membersClicked = !clicked;
      this.hierarchiesClicked = !clicked;
      this.filtersClicked = !clicked;
  }


  setHierarchiesClicked(clicked: boolean) {
      this.hierarchiesClicked = clicked;
      /*ocultar*/
      this.attributesClicked = !clicked;
      this.membersClicked = !clicked;
      this.filtersClicked = !clicked;
  }

   setFiltersClicked(clicked: boolean) {
      this.filtersClicked = clicked;
      /*ocultar*/
      this.attributesClicked = !clicked;
      this.membersClicked = !clicked;
      this.hierarchiesClicked = !clicked;
    }

/*hide show OPERATIONS*/

  batchManteClicked: boolean = false;
  batchExeClicked: boolean = false;
  batchMoniClicked: boolean = false;
  
  setBatchManteClicked(clicked: boolean) {
      this.batchManteClicked = clicked;
      /*ocultar*/
      this.batchExeClicked = !clicked;
      this.batchMoniClicked = !clicked;
  }

  setBatchExeClicked(clicked: boolean) {
      this.batchExeClicked = clicked;
      /*ocultar*/
      this.batchManteClicked = !clicked;
      this.batchMoniClicked = !clicked;
  }


  setBatchMoniClicked(clicked: boolean) {
      this.batchMoniClicked = clicked;
      /*ocultar*/
      this.batchExeClicked = !clicked;
      this.batchManteClicked = !clicked;
  }

  ngOnInit() {
  }

}
