import { Component, OnInit, EventEmitter, Input, Output  } from '@angular/core';
import { OutputCompComponent } from './output-comp/output-comp.component';
import { InitialRuleCompComponent } from './initial-rule-comp/initial-rule-comp.component';
import { OperatorCompComponent } from './operator-comp/operator-comp.component';
import { DriverCompComponent } from './driver-comp/driver-comp.component';
import { SourceCompComponent } from './source-comp/source-comp.component';



@Component({
  selector: 'app-pft-rule-comp',
  templateUrl: './pft-rule-comp.component.html',
  styleUrls: ['./pft-rule-comp.component.css']
})
export class PftRuleCompComponent implements OnInit {

 @Output() closerule = new EventEmitter();
  
 public hiderule:boolean;

  constructor() { }
  
  lanzarclose(event){
        this.hiderule = false;
        // Usamos el método emit
        this.closerule.emit({hiderule: this.hiderule});
  }

  ngOnInit() {
  }

 /* selectTab(tab: any){
      this.selectTab(tab);
  }*/

}
