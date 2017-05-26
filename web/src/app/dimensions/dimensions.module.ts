import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { HttpModule } from '@angular/http';

import { DimensionsRoutingModule } from './dimensions-routing.module';
import { MembersComponent } from './members.component';
import { MembersService } from './members.service';
import { DimensionsService } from './dimensions.service';


@NgModule({
  imports: [
    CommonModule,
    DimensionsRoutingModule,
    FormsModule,
    HttpModule,
  ],
  declarations: [ MembersComponent ],
  providers: [ MembersService, DimensionsService ],
})
export class DimensionsModule { }
