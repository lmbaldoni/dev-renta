import { Component , OnInit } from '@angular/core';
import { Rule } from './rules.model';

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
  public model = new Rule(null,false,null, '', '', '',false,false,'lucas','lucas');

  constructor() { 
     
  }

  
  ngOnInit() {
   
  }


 
}

