import { Component } from '@angular/core';
import { Member , Attribute } from './member.model';

@Component({
  templateUrl: 'members.component.html'
})
export class MembersComponent {

  public model = new Member(null,false,null, '', '', '',false,false,'lucas','lucas');

  constructor() { }

  CreateMemderbuttonWasClicked: boolean = false;
  SearchMemderbuttonWasClicked: boolean = true;

  setButtonClicked(clicked: boolean) {
      this.resetmodel();
      this.CreateMemderbuttonWasClicked = clicked;
      this.SearchMemderbuttonWasClicked = !clicked;
  }
  
  RefreshMember(){
      this.resetmodel();
  }

  private resetmodel() {

    this.model = new Member(null,false,null, '', '', '',false,false,'lucas','lucas');

  } 

}

