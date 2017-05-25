import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/Rx';

const BASE_URL = 'http://localhost:8000/';

@Injectable()
export class CommonService {

	constructor(private http: Http) { }

	getFolders() {
		return this.http.get('http://localhost:8000/folders/')
			.map(response => response.json().result)
			.catch(error => this.handleError(error));
	}

	getDimensions() {
		return this.http.get(BASE_URL+'dimensions/')
			.map(response => response.json().result)
			.catch(error => this.handleError(error));
	}

	private handleError(error: any) {
		console.error(error);
		return Observable.throw("Server error (" + error.status + "): " + error.text())
	}
}