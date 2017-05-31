import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { HttpModule } from '@angular/http';

import { ProfitabilityRoutingModule } from './profitability-routing.module';
import { RulesComponent } from './rules.component';
import { RulesService } from './rules.service';
import { ProfitabilityService } from './profitability.service';
//import { CommonService } from '../services/common.service';

// Tabs Component
import { TabsModule } from 'ngx-bootstrap/tabs';

@NgModule({
  imports: [
    CommonModule,
    ProfitabilityRoutingModule,
    FormsModule,
    HttpModule,
    TabsModule,
  ],
  declarations: [ RulesComponent ],
  providers: [ RulesService, ProfitabilityService ],
})
export class ProfitabilityModule { }
