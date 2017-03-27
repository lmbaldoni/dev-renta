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

  public model = new Member(null,false,null, '', '', '',false,false,'lucas','lucas');

  public url =  "http://localhost:8000/"+"members/"; 
     
   public members = [];

   public membersDelete = [];

  constructor(private http: Http,private membersService: MembersService) {
  

   }
   
  ngOnInit() {
    this.refresh();
  }

  private resetmodel() {

    this.model = new Member(null,false,null, '', '', '',false,false,'lucas','lucas');

  } 
		
   private refresh() {
     
     this.members.length = 0;

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

 
   checkbox(recipient) {
        recipient.selected = (recipient.selected) ? false : true;
    }

  removeMember() {
     
     /*for (var i = 0; i < this.members.length; i++) {
          let row = this.members.get[i];
          
          if(row.checked = true){
                    this.http.delete(this.url + this.members.findIndex[i]).subscribe(
                      response => this.refresh(),
                      error => this.handleError(error)
                    );
          }

  
        }*/
        this.membersDelete.length = 0;
        this.membersDelete = this.members.filter((x) => x.checked)
        console.log(this.membersDelete);

        /*Member item =  this.model;*/

        for (var i = 0; i < this.membersDelete.length; i++) {
              let item = this.membersDelete[i] as Member;
            this.http.delete(this.url + item.id + '/').subscribe(
                      response => this.refresh(),
                      error => this.handleError(error)
                    );
        }
        
        /*this.refresh();
*/
		
	}

  private handleError(error: any) {
		console.error(error);
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



}




 
