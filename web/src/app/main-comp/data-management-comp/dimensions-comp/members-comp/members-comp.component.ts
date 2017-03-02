import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
/*import {Member} from './model/member';*/

@Component({
  selector: 'app-members-comp',
  templateUrl: './members-comp.component.html',
  styleUrls: ['./members-comp.component.css']
})
export class MembersCompComponent implements OnInit {


  private users: string[] = [];

  constructor(private http: Http) {
       

    let url = "http://localhost:8000/"+"users/"; 

    this.http.get(url).subscribe(
      response => {
        let data = response.json();
        for (var i = 0; i < data.results.length; i++) {
          let name = data.results[i].username;
          this.users.push(name);
        }
      },
      error => console.error(error)
    );


   }

   CreateMemderbuttonWasClicked: boolean = false;
   SearchMemderbuttonWasClicked: boolean = true;

  setButtonClicked(clicked: boolean) {
      this.CreateMemderbuttonWasClicked = clicked;
      this.SearchMemderbuttonWasClicked = !clicked;
  }

  ngOnInit() {
  }

}




 
