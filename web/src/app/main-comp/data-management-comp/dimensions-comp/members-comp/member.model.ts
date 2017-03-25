export class Member {
	constructor(
	public checked: boolean = false,
    public id_code: number,
    public id_alfa: string,
    public name: string,
    public description: string,
    public enabled: boolean = false,
    public if_leaf: boolean = false,
    public create_by: string,
    public modified_by: string
    ){}
}



