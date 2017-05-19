import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';


import { DimensionsRoutingModule } from './dimensions-routing.module';
import { MembersComponent } from './members.component';

@NgModule({
  imports: [
    CommonModule,
    DimensionsRoutingModule,
    FormsModule,
  ],
  declarations: [ MembersComponent ]
})
export class DimensionsModule { }
