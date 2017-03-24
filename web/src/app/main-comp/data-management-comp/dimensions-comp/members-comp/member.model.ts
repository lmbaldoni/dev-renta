export class Member {
	/*id?: number;*/
	constructor(
    public id_code: number,
    public id_alfa: string,
    public name: string,
    public description: string,
    public enabled: boolean = false,
    public if_lead: boolean = false,
    public create_by: string,
    public modified_by: string
    ){}
}



