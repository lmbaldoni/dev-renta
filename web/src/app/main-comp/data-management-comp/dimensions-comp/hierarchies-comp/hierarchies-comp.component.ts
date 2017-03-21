import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';

@Component({
  selector: 'app-hierarchies-comp',
  templateUrl: './hierarchies-comp.component.html',
  styleUrls: ['./hierarchies-comp.component.css']
})


export class HierarchiesCompComponent implements OnInit {

   private members: any[] = [];

  constructor(private http: Http) {
     
    let url = "http://localhost:8000/"+"members/"; 

    this.http.get(url).subscribe(
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

  CreateMemderbuttonWasClicked: boolean = false;
   SearchMemderbuttonWasClicked: boolean = true;

  setButtonClicked(clicked: boolean) {
      this.CreateMemderbuttonWasClicked = clicked;
      this.SearchMemderbuttonWasClicked = !clicked;
  }

  ngOnInit() {
  }

}
