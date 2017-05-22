import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/Rx';

import { Dimension } from './dimension.model';

const BASE_URL = 'http://localhost:8000/dimensions/';

@Injectable()
export class DimensionsService {

	constructor(private http: Http) { }

	getDimensions() {
		return this.http.get(BASE_URL)
			.map(response => response.json().results)
			.catch(error => this.handleError(error));
	}

	private handleError(error: any) {
		console.error(error);
		return Observable.throw("Server error (" + error.status + "): " + error.text())
	}
}