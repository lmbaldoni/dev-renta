import { Component, OnInit, Input } from '@angular/core';
import { DataManagementCompComponent } from './data-management-comp/data-management-comp.component';
import { PftRuleCompComponent } from './pft-comp/pft-rule-comp/pft-rule-comp.component';

@Component({
  selector: 'app-main-comp',
  templateUrl: './main-comp.component.html',
  styleUrls: ['./main-comp.component.css']
})
export class MainCompComponent implements OnInit {

  constructor() {
   

   }


   closepft(event):void{
        event.hiderule;
        this.setAllDataManagement();
      this.setAllOperations();
      this.setAllMigration();
      this.allocationModelClicked = false;
      this.allocationHistoryClicked = false;
      this.headerClicked = true;
      this.menuClicked = true;
      /*mostrar*/
      this.allocationClicked = false;
      this.panelMainClicked = false;
    }

  /*hide show header and menu*/
headerClicked = true;
menuClicked = true;
panelMainClicked = false;

/*hide show DATA MANAGEMENT*/

  membersClicked: boolean = false;
  attributesClicked: boolean = false;
  hierarchiesClicked: boolean = false;
  filtersClicked: boolean = false;

  setAllDataManagement(){
    this.membersClicked = false;
    this.attributesClicked = false;
    this.hierarchiesClicked = false;
    this.filtersClicked = false;
    
  }

  setMembersClicked(clicked: boolean) {
      this.panelMainClicked = clicked;
      this.membersClicked = clicked;
      /*ocultar*/
      this.setAllOperations();
      this.setAllMigration();
      this.attributesClicked = !clicked;
      this.hierarchiesClicked = !clicked;
      this.filtersClicked = !clicked;
      
  }

  setAttributesClicked(clicked: boolean) {
      this.attributesClicked = clicked;
      this.panelMainClicked = clicked;
      /*ocultar*/
      this.setAllOperations();
      this.setAllMigration();
      this.membersClicked = !clicked;
      this.hierarchiesClicked = !clicked;
      this.filtersClicked = !clicked;
  }


  setHierarchiesClicked(clicked: boolean) {
      this.hierarchiesClicked = clicked;
      this.panelMainClicked = clicked;
      /*ocultar*/
      this.setAllOperations();
      this.setAllMigration();
      this.attributesClicked = !clicked;
      this.membersClicked = !clicked;
      this.filtersClicked = !clicked;
  }

   setFiltersClicked(clicked: boolean) {
      this.filtersClicked = clicked;
      this.panelMainClicked = clicked;
      /*ocultar*/
      this.setAllOperations();
      this.setAllMigration();
      this.attributesClicked = !clicked;
      this.membersClicked = !clicked;
      this.hierarchiesClicked = !clicked;
    }

/*hide show OPERATIONS*/

  batchManteClicked: boolean = false;
  batchExeClicked: boolean = false;
  batchMoniClicked: boolean = false;
  
  setAllOperations(){
    this.batchManteClicked = false;
    this.batchExeClicked = false;
    this.batchMoniClicked = false;
    
  }

  setBatchManteClicked(clicked: boolean) {
      this.batchManteClicked = clicked;
      this.panelMainClicked = clicked;
      /*ocultar*/
      this.setAllDataManagement();
      this.setAllMigration();
      this.batchExeClicked = !clicked;
      this.batchMoniClicked = !clicked;
  }

  setBatchExeClicked(clicked: boolean) {
      this.batchExeClicked = clicked;
      this.panelMainClicked = clicked;
      /*ocultar*/
      this.setAllDataManagement();
      this.setAllMigration();
      this.batchManteClicked = !clicked;
      this.batchMoniClicked = !clicked;
  }


  setBatchMoniClicked(clicked: boolean) {
      this.batchMoniClicked = clicked;
      this.panelMainClicked = clicked;
      /*ocultar*/
      this.setAllDataManagement();
      this.setAllMigration();
      this.batchExeClicked = !clicked;
      this.batchManteClicked = !clicked;
  }


  /*hide show MIGRATION*/

  importClicked: boolean = false;
  exportClicked: boolean = false;
  
  
  setAllMigration(){
    this.importClicked = false;
    this.exportClicked = false;
    
  }

  setImportClicked(clicked: boolean) {
      this.importClicked = clicked;
      this.panelMainClicked = clicked;
      /*ocultar*/
      this.setAllDataManagement();
      this.setAllOperations();
      this.exportClicked = !clicked;
      
  }

  setExportClicked(clicked: boolean) {
      this.exportClicked = clicked;
      this.panelMainClicked = clicked;
      /*ocultar*/
      this.setAllDataManagement();
      this.setAllOperations();
      this.importClicked = !clicked;
      
  }


   /*hide show PFT*/

  allocationClicked: boolean = false;
  allocationModelClicked: boolean = false;
  allocationHistoryClicked: boolean = false;
  
  
  setAllPFT(){
    this.allocationClicked = false;
    this.allocationModelClicked = false;
    this.allocationHistoryClicked = false;
  }

  setAllocationClicked(clicked: boolean) {
      /*ocultar*/
      this.setAllDataManagement();
      this.setAllOperations();
      this.setAllMigration();
      this.allocationModelClicked = !clicked;
      this.allocationHistoryClicked = !clicked;
      this.headerClicked = !clicked;
      this.menuClicked = !clicked;
      this.panelMainClicked = !clicked;
      /*mostrar*/
      this.allocationClicked = clicked;
      
  }

  setAllocationModelClicked(clicked: boolean) {
      this.allocationModelClicked = clicked;
      /*ocultar*/
      this.setAllDataManagement();
      this.setAllOperations();
      this.setAllMigration();
      this.allocationClicked = !clicked;
      this.allocationHistoryClicked = !clicked;
      
  }

    setAllocationHistoryClicked(clicked: boolean) {
      this.allocationHistoryClicked = clicked;
      /*ocultar*/
      this.setAllDataManagement();
      this.setAllOperations();
      this.setAllMigration();
      this.allocationClicked = !clicked;
      this.allocationModelClicked = !clicked;
      
  }
  ngOnInit() {
  }

}
