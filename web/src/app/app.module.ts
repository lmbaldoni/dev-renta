import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';

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
import { LoginComponent } from './login/login.component';
import { PftCompComponent } from './main-comp/pft-comp/pft-comp.component';
import { PftRuleCompComponent } from './main-comp/pft-comp/pft-rule-comp/pft-rule-comp.component';
import { OutputCompComponent } from './main-comp/pft-comp/pft-rule-comp/output-comp/output-comp.component';
import { SourceCompComponent } from './main-comp/pft-comp/pft-rule-comp/source-comp/source-comp.component';
import { DriverCompComponent } from './main-comp/pft-comp/pft-rule-comp/driver-comp/driver-comp.component';
import { OperatorCompComponent } from './main-comp/pft-comp/pft-rule-comp/operator-comp/operator-comp.component';
import { InitialRuleCompComponent } from './main-comp/pft-comp/pft-rule-comp/initial-rule-comp/initial-rule-comp.component';
import { FiltersCompComponent } from './main-comp/data-management-comp/filters-comp/filters-comp.component';

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
    LoginComponent,
    PftCompComponent,
    PftRuleCompComponent,
    OutputCompComponent,
    SourceCompComponent,
    DriverCompComponent,
    OperatorCompComponent,
    InitialRuleCompComponent,
    FiltersCompComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    NgbModule.forRoot()
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
