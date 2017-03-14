import { Component, OnInit, Input } from '@angular/core';
import { DataManagementCompComponent } from './data-management-comp/data-management-comp.component';
import { PftCompComponent } from './pft-comp/pft-comp.component';

@Component({
  selector: 'app-main-comp',
  templateUrl: './main-comp.component.html',
  styleUrls: ['./main-comp.component.css']
})
export class MainCompComponent implements OnInit {

  constructor() {
   

   }

   @Input() dataManagementClicked: boolean;

 /*dataManagementClicked: boolean = false;*/

 /*  setDataManagementClicked(clicked: boolean) {
    this.dataManagementClicked = clicked;
}*/

  ngOnInit() {
  }

}
