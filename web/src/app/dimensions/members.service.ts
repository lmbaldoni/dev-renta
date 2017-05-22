import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/Rx';

import { Member } from './member.model';

const BASE_URL = 'http://localhost:8000/members/';

@Injectable()
export class MembersService {

	constructor(private http: Http) { }

	getMembers() {
		return this.http.get(BASE_URL)
			.map(response => response.json().result)
			.catch(error => this.handleError(error));
	}

	addMember(member: Member) {
		return this.http.post(BASE_URL, member)
			.map(response => response.json())
			.catch(error => this.handleError(error));
	}

	removeMember(member: Member) {
		return this.http.delete(BASE_URL + member.id_code)
			.map(response => response.json())
			.catch(error => this.handleError(error));
	}

	updateMember(member: Member) {
		return this.http.put(BASE_URL + member.id_code, member)
			.map(response => response.json())
			.catch(error => this.handleError(error));
	}

	private handleError(error: any) {
		console.error(error);
		return Observable.throw("Server error (" + error.status + "): " + error.text())
	}
}