import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';


import { RulesComponent } from './rules.component';

const routes: Routes = [
  {
    path: '',
    data: {
      title: 'Profitability'
    },
    children: [
      {
        path: 'rules',
        component: RulesComponent,
        data: {
          title: 'Rules'
        }
      }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ProfitabilityRoutingModule { }
