import { Component } from '@angular/core';
import { MainCompComponent } from './main-comp/main-comp.component';
import { MenuCompComponent } from './menu-comp/menu-comp.component';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'app works!';
}
