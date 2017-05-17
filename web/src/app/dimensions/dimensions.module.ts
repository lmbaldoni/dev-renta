import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { DimensionsRoutingModule } from './dimensions-routing.module';
import { MembersComponent } from './members.component';

@NgModule({
  imports: [
    CommonModule,
    DimensionsRoutingModule
  ],
  declarations: [ MembersComponent ]
})
export class DimensionsModule { }
