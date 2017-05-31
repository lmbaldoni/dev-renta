import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/Rx';

//const BASE_URL_FOLDER = 'http://localhost:8000/folders/';
const BASE_URL = 'http://localhost:8000/';

import { Folder } from './common.model';

@Injectable()
export class CommonService {

	constructor(private http: Http) { }

	getFolders() {
		return this.http.get(BASE_URL+'folders/')
			.map(response => response.json().result)
			.catch(error => this.handleError(error));
	}

	getDimensions() {
		return this.http.get(BASE_URL+'dimensions/')
			.map(response => response.json().result)
			.catch(error => this.handleError(error));
	}

	getTables() {
		return this.http.get(BASE_URL+'tables/')
			.map(response => response.json().result)
			.catch(error => this.handleError(error));
	}

	private handleError(error: any) {
		console.error(error);
		return Observable.throw("Server error (" + error.status + "): " + error.text())
	}
}