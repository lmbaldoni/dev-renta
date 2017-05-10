import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';

import {MaterialModule} from '@angular/material';
import {DialogsModule } from './main-comp/data-management-comp/dimensions-comp/members-comp/dialogs.module';
import { DialogComponent } from './main-comp/data-management-comp/dimensions-comp/members-comp/dialog.component';


import { AppComponent } from './app.component';
import { HeaderCompComponent } from './header-comp/header-comp.component';
import { MainCompComponent } from './main-comp/main-comp.component';
import { FootCompComponent } from './foot-comp/foot-comp.component';
import { MenuCompComponent } from './menu-comp/menu-comp.component';
import { DataManagementCompComponent } from './main-comp/data-management-comp/data-management-comp.component';
import { DimensionsCompComponent } from './main-comp/data-management-comp/dimensions-comp/dimensions-comp.component';
import { MembersCompComponent } from './main-comp/data-management-comp/dimensions-comp/members-comp/members-comp.component';
import { AttributesCompComponent } from './main-comp/data-management-comp/dimensions-comp/attributes-comp/attributes-comp.component';
import { HierarchiesCompComponent } from './main-comp/data-management-comp/dimensions-comp/hierarchies-comp/hierarchies-comp.component';
import { PftCompComponent } from './main-comp/pft-comp/pft-comp.component';
import { PftRuleCompComponent } from './main-comp/pft-comp/pft-rule-comp/pft-rule-comp.component';
import { OutputCompComponent } from './main-comp/pft-comp/pft-rule-comp/output-comp/output-comp.component';
import { SourceCompComponent } from './main-comp/pft-comp/pft-rule-comp/source-comp/source-comp.component';
import { DriverCompComponent } from './main-comp/pft-comp/pft-rule-comp/driver-comp/driver-comp.component';
import { OperatorCompComponent } from './main-comp/pft-comp/pft-rule-comp/operator-comp/operator-comp.component';
import { InitialRuleCompComponent } from './main-comp/pft-comp/pft-rule-comp/initial-rule-comp/initial-rule-comp.component';
import { FiltersCompComponent } from './main-comp/data-management-comp/filters-comp/filters-comp.component';
import { OperationsCompComponent } from './main-comp/operations-comp/operations-comp.component';
import { BatchMaintenanceCompComponent } from './main-comp/operations-comp/batch-maintenance-comp/batch-maintenance-comp.component';
import { BatchExecutionCompComponent } from './main-comp/operations-comp/batch-execution-comp/batch-execution-comp.component';
import { BatchMonitorCompComponent } from './main-comp/operations-comp/batch-monitor-comp/batch-monitor-comp.component';
import { MigrationCompComponent } from './main-comp/migration-comp/migration-comp.component';
import { ImportCompComponent } from './main-comp/migration-comp/import-comp/import-comp.component';
import { ExportCompComponent } from './main-comp/migration-comp/export-comp/export-comp.component';
import { ReportsCompComponent } from './main-comp/reports-comp/reports-comp.component';



/*Servicios*/
import { MembersService } from './main-comp/data-management-comp/dimensions-comp/members-comp/members.service';


@NgModule({
  declarations: [
    AppComponent,
    HeaderCompComponent,
    MainCompComponent,
    FootCompComponent,
    MenuCompComponent,
    DataManagementCompComponent,
    DimensionsCompComponent,
    MembersCompComponent,
    AttributesCompComponent,
    HierarchiesCompComponent,
    PftCompComponent,
    PftRuleCompComponent,
    OutputCompComponent,
    SourceCompComponent,
    DriverCompComponent,
    OperatorCompComponent,
    InitialRuleCompComponent,
    FiltersCompComponent,
    OperationsCompComponent,
    BatchMaintenanceCompComponent,
    BatchExecutionCompComponent,
    BatchMonitorCompComponent,
    MigrationCompComponent,
    ImportCompComponent,
    ExportCompComponent,
    ReportsCompComponent,
    DialogComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    NgbModule.forRoot(),
    MaterialModule.forRoot(),
    DialogsModule,
    BrowserModule
    ],
  providers: [MembersService],
  bootstrap: [AppComponent]
})
export class AppModule { }
