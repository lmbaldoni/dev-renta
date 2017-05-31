import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/Rx';

//import { Dimension } from './dimension.model';

const BASE_URL = 'http://localhost:8000/';

@Injectable()
export class ProfitabilityService {

	constructor(private http: Http) { }

	getDimensions() {
		return this.http.get(BASE_URL+'dimensions/')
			.map(response => response.json().results)
			.catch(error => this.handleError(error));
	}

	getFolders() {
		return this.http.get(BASE_URL+'folders/')
			.map(response => response.json().results)
			.catch(error => this.handleError(error));
	}

	getTables() {
		return this.http.get(BASE_URL+'tables/')
			.map(response => response.json().results)
			.catch(error => this.handleError(error));
	}

	getColumn() {
		return this.http.get(BASE_URL+'columns/')
			.map(response => response.json().results)
			.catch(error => this.handleError(error));
	}

	private handleError(error: any) {
		console.error(error);
		return Observable.throw("Server error (" + error.status + "): " + error.text())
	}
}