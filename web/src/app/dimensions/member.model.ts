export class Member {
	constructor(
	public id: number,
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

export class Attribute{
    constructor(
	public id: number,
    public id_code: number,
    public id_alfa: string,
    public name: string,
    public value: string
    ){}
}