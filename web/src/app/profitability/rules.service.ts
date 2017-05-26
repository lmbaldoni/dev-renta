import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/Rx';

import { Rule } from './rules.model';

const BASE_URL = 'http://localhost:8000/';

@Injectable()
export class RulesService {

	constructor(private http: Http) { }

	getRules() {
		return this.http.get(BASE_URL)
			.map(response => response.json().result)
			.catch(error => this.handleError(error));
	}

	addRule(rule: Rule) {
		return this.http.post(BASE_URL, rule)
			.map(response => response.json())
			.catch(error => this.handleError(error));
	}

	removeRule(rule: Rule) {
		return this.http.delete(BASE_URL + rule.RULE_SYS_ID)
			.map(response => response.json())
			.catch(error => this.handleError(error));
	}

	updateRule(rule: Rule) {
		return this.http.put(BASE_URL + rule.RULE_SYS_ID, rule)
			.map(response => response.json())
			.catch(error => this.handleError(error));
	}

	private handleError(error: any) {
		console.error(error);
		return Observable.throw("Server error (" + error.status + "): " + error.text())
	}
}