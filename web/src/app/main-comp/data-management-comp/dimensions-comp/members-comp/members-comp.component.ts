import { Component, OnInit, EventEmitter, Input, Output  } from '@angular/core';
import { Http } from '@angular/http';
import { Member,attribute } from './member.model';
import { MembersService } from './members.service';
import { NgForm, NgModel } from "@angular/forms";

/*inicio modal*/

/*import {DialogsService} from './dialogs.service';*/

/*fin modal*/


@Component({
  selector: 'app-members-comp',
  templateUrl: './members-comp.component.html',
  
  styleUrls: ['./members-comp.component.css']
  
})
export class MembersCompComponent implements OnInit {

  public result: any;

  public model = new Member(null,false,null, '', '', '',false,false,'lucas','lucas');

  public modelattr = new attribute(null,null, '', '', '');

  public url =  "http://localhost:8000/"+"members/"; 
  public urlattribute =  "http://localhost:8000/"+"attributes/"; 
     
   public members = [];
   public attributes = [];

   public membersDelete = [];

  @Output() addMemberDialog = new EventEmitter();
  
  constructor(private http: Http,private membersService: MembersService) {
  

   }
   /*modal inicio*/


   addMember(event) {
     this.addMemberDialog.emit();
    
  }

 
  /*modal fin*/
   
  ngOnInit() {
    this.refresh();
    this.refreshattribute();
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

   private refreshattribute() {
     
     this.attributes.length = 0;

    this.http.get(this.urlattribute).subscribe(
      response => {
        let data = response.json();
        for (var i = 0; i < data.results.length; i++) {
          let id_alfa = data.results[i];
          this.attributes.push(id_alfa);
        }
      },
      error => console.error(error)
    );


   }v

   private addItem() {
    if(confirm("Are you sure to delete this member?")) {
        let item =  this.model;

        this.http.post(this.url, item).subscribe(
          response => this.refresh()
        );

        this.resetmodel();
        this.setButtonClicked(false);
      }
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




 
