import { Component , OnInit } from '@angular/core';

//Modelos de datos
import { Rule  } from './rules.model';
import { Folder , ObjectB , ObjectTL , Table } from '../services/common.model';

//importar libreria de servicios
import { Http } from '@angular/http';
import { RulesService } from './rules.service';
import { ProfitabilityService } from './profitability.service';


@Component({
  templateUrl: 'rules.component.html'  
})
export class RulesComponent implements OnInit  {

  public dimensions = [];
  public members = [];
  public folders = [];
  public tables = [];
  public columns = [];
  
  public modelRule = new Rule(null,null,null,'','','',null,null,'',null,null,'',null,'');
  public modelObecjtB = new ObjectB(null,'',null,null,'',null,'','','','','');
  public modelObecjtTL = new ObjectTL(null,'','','','');
  public modelFolder = new Folder('','','','');
  public modelTable = new Table('','');

  ColumnExpresionSelect: boolean = true;
  
  constructor(private http: Http,private rulesService: RulesService,private profitabilityService: ProfitabilityService) { 
    
  }

  
  ngOnInit() {
  //servicio que recupera las carpetas
      this.profitabilityService.getFolders().subscribe(
                    folders => this.folders = folders,
                    error => console.error(`Error: ${error}`)
                  );
  
  //servicio que recupera las tablas de PFT
       this.profitabilityService.getTables().subscribe(
                    tables => this.tables = tables,
                    error => console.error(`Error: ${error}`)
                  );
  
  //servicio que recupera las dimensiones
       this.profitabilityService.getDimensions().subscribe(
                    dimensions => this.dimensions = dimensions,
                    error => console.error(`Error: ${error}`)
                  );
    
  //servicio que recupera las dimensiones
       this.profitabilityService.getColumn().subscribe(
                    columns => this.columns = columns,
                    error => console.error(`Error: ${error}`)
                  );
  }

  setColumnExpresion( clicked: boolean ){
    this.ColumnExpresionSelect = clicked;
  }


 
}

