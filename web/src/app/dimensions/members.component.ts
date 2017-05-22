import { Component , OnInit } from '@angular/core';
import { Member , Attribute } from './member.model';

//importar libreria de servicios
import { Http } from '@angular/http';
import { MembersService } from './members.service';
import { DimensionsService } from './dimensions.service';

@Component({
  templateUrl: 'members.component.html'  
})
export class MembersComponent implements OnInit  {

  public model = new Member(null,false,null, '', '', '',false,false,'lucas','lucas');

  constructor(private http: Http,private membersService: MembersService, private dimensionsService: DimensionsService) { 
     
  }

  public dimensions = [];
  public members = [];

  ngOnInit() {
    //servicio que recupera las dimensiones
      this.dimensionsService.getDimensions().subscribe(
                    dimensions => this.dimensions = dimensions,
                    error => console.error(`Error: ${error}`)
                  );
    //servicio que recupera las dimensiones
      this.membersService.getMembers().subscribe(
                    members => this.members = members,
                    error => console.error(`Error: ${error}`)
                  );
  }


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

