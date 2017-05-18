import { Component } from '@angular/core';
import { Member , Attribute } from './member.model';

@Component({
  templateUrl: 'members.component.html'
})
export class MembersComponent {

  public model = new Member(null,false,null, '', '', '',false,false,'lucas','lucas');

  constructor() { }

}

