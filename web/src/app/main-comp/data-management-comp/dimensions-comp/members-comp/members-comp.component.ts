import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Member } from './member.model';
import { MembersService } from './members.service';
import { NgForm }    from '@angular/forms';

@Component({
  selector: 'app-members-comp',
  templateUrl: './members-comp.component.html',
  styleUrls: ['./members-comp.component.css']
  /*template: `<div *ng-for="let member of membersArray">{{member.id_alfa}}</div>`*/
})
export class MembersCompComponent implements OnInit {

  public model = new Member(false,null, '', '', '',false,false,'lucas','lucas');

  public url =  "http://localhost:8000/"+"members/"; 
     
   public members = [];

   public membersDelete = [];

  constructor(private http: Http,private membersService: MembersService) {
  

   }
   
  ngOnInit() {
    this.refresh();
  }

  private resetmodel() {

    this.model = new Member(false,null, '', '', '',false,false,'lucas','lucas');

  } 
		
   private refresh() {
     
     this.members = [];

    this.http.get(this.url).subscribe(
      response => {
        let data = response.json();
        for (var i = 0; i < data.results.length; i++) {
          let id_alfa = data.results[i];
          this.members.push(id_alfa);
        }
      },
      error => console.error(error)
    );


   }

   private addItem() {

		let item =  this.model;

		this.http.post(this.url, item).subscribe(
			response => this.refresh()
		);

    this.resetmodel();
    this.setButtonClicked(false);
	}

  removeItem(item: Number) {

		this.http.delete(this.url + item).subscribe(
			response => this.refresh(),
			error => this.handleError(error)
		);
	}

  private handleError(error: any) {
		console.error(error);
	}

     




  CreateMemderbuttonWasClicked: boolean = false;
   SearchMemderbuttonWasClicked: boolean = true;

  setButtonClicked(clicked: boolean) {
      this.CreateMemderbuttonWasClicked = clicked;
      this.SearchMemderbuttonWasClicked = !clicked;
  }



}




 
