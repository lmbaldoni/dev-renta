import { Component , OnInit } from '@angular/core';

//Modelos de datos
import { Rule } from './rules.model';
import { ObjectB , ObjectTL , Folder } from '../model/common.model';

//importar libreria de servicios
import { Http } from '@angular/http';
import { RulesService } from './rules.service';
//import { DimensionsService } from './app/dimensions/dimensions.service';

@Component({
  templateUrl: 'rules.component.html'  
})
export class RulesComponent implements OnInit  {

  public dimensions = [];
  public members = [];
  public folders = [];
  
  public modelRule = new Rule(null,null,null,'','','',null,null,'',null,null,'',null,'');
  public modelObecjtB = new ObjectB(null,'',null,null,'',null,'','','','','');
  public modelObecjtTL = new ObjectTL(null,'','','','');
  public modelFolder = new Folder('','','','');

  constructor() { 
     
  }

  
  ngOnInit() {
   
  }


 
}

