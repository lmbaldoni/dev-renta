import { Component, OnInit, EventEmitter, Input, Output  } from '@angular/core';
import { MainCompComponent } from './main-comp/main-comp.component';
/*import { DialogsService } from './dialogs.service';
import {ConfirmDialog} from './confirm-dialog.component';*/

import {
    RouteConfig,
    ROUTER_DIRECTIVES,
    ROUTER_PROVIDERS,
    LocationStrategy,
    HashLocationStrategy
} from '@angular/router';



@Component({
  selector: 'app-root',
  moduleId: module.id,
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
    directives: [ROUTER_DIRECTIVES]
  
  })
export class AppComponent implements OnInit {
   
   showDialog = false;

  title = 'app works!';
  public result: any;

  constructor(/*private dialogsService: DialogsService*/) {
  

   }

   public openAppDialog() {
    /*this.dialogsService
      .confirm('Confirm', 'Are you sure you want to do this?')
      .subscribe(res => this.result = res);*/
      /*this.title = 'llego';*/
      this.showDialog = true;
  }

   @Output() appToMainDialog = new EventEmitter();

  /*appToMainMember(event){
      this.appToMainDialog.emit();
  }*/

    appAddMember(event) {
      this.appToMainDialog.emit();
      
  }

  ngOnInit() {
  
  }

  
}
