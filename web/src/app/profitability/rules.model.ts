export class Rule {
	constructor( //null,null,null,'','','',null,null,'',null,null,'',null,''
	public RULE_SYS_ID: number,
    public RULE_TYPE_CD: number,
    public SOURCE_SYS_ID: number,
    public FACTOR_OPERATOR_TYPE: string,
    public FACTOR_OPERATOR_ACCR_BASIS: string,
    public FACTOR_OPERATOR_CONSTANT: string,
    public FACTOR_CONSTANT: number,
    public FACTOR_ACCRUAL_BASIS_CD: number,
    public RULE_OPERATOR: string,
    public DRIVER_SYS_ID: number,
    public ASSIGNMENT_SYS_ID: number,
    public NO_OFFSET_FLAG: string,
    public OFFSET_SYS_ID: number,
    public OUTPUT_OPTION_CD: string
    ){}
}