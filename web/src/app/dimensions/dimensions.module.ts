import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { DimensionsRoutingModule } from './dimensions-routing.module';
import { DimensionsComponent } from './dimensions.component';

@NgModule({
  imports: [
    CommonModule,
    DimensionsRoutingModule
  ],
  declarations: [ DimensionsComponent ]
})
export class DimensionsModule { }
