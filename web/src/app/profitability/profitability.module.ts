import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { HttpModule } from '@angular/http';

import { ProfitabilityRoutingModule } from './profitability-routing.module';
import { RulesComponent } from './rules.component';
import { RulesService } from './rules.service';
//import { DimensionsService } from './dimensions.service';

@NgModule({
  imports: [
    CommonModule,
    ProfitabilityRoutingModule,
    FormsModule,
    HttpModule,
  ],
  declarations: [ RulesComponent ],
  providers: [ RulesService, //DimensionsService 
  ],
})
export class ProfitabilityModule { }
