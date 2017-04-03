import { Component, OnInit, EventEmitter, Input, Output  } from '@angular/core';
import { MainCompComponent } from './main-comp/main-comp.component';
import { DialogsService } from './dialogs.service';
import {ConfirmDialog} from './confirm-dialog.component';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
  })
export class AppComponent implements OnInit {
   
   showDialog = false;

  title = 'app works!';
  public result: any;

  constructor(private dialogsService: DialogsService) {
  

   }

   public openAppDialog() {
    /*this.dialogsService
      .confirm('Confirm', 'Are you sure you want to do this?')
      .subscribe(res => this.result = res);*/
      /*this.title = 'llego';*/
      this.showDialog = true;
  }

   @Output() appMemberDialog = new EventEmitter();

  appAddMember(event){
      this.appMemberDialog.emit();
  }

    

  ngOnInit() {
  }

  
}
