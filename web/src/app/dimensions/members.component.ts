import { Component } from '@angular/core';
import { Member , Attribute } from './member.model';

//importar libreria de servicios
import { Http } from '@angular/http';
import { MembersService } from './members.service';

@Component({
  templateUrl: 'members.component.html'
})
export class MembersComponent {

  public model = new Member(null,false,null, '', '', '',false,false,'lucas','lucas');

  constructor(private http: Http,private membersService: MembersService) { }

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

  //Recuperar dimensiones de procesamiento

  public dimensions = [];
  public urldimensions =  "http://localhost:8000/"+"dimensions/";

  private refreshDimensions() {
     
     this.dimensions.length = 0;

    this.http.get(this.urldimensions).subscribe(
      response => {
        let data = response.json();
        for (var i = 0; i < data.results.length; i++) {
          let id_alfa = data.results[i];
          this.dimensions.push(id_alfa);
        }
      },
      error => console.error(error)
    );


   }

}

