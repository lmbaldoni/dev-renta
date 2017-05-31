export class ObjectB {
	constructor( //null,'',null,null,'',null,'','','','',''
	public OBJECT_DEFINITION_ID: number,
    public OBJECT_ORIGIN_APP_CD: string,
    public LEAF_NUM_ID: number,
    public ID_TYPE: number,
    public TABLE_NAME: string,
    public FOLDER_ID: number,
    public FOLDER_NAME: string,
    public ACCESS_CD: string,
    public APPL_NAME: string,
    public DELETED_FLAG: string,
    public SOURCE_LANG: string    
    ){}
}

export class ObjectTL {
	constructor( //null,'','','',''
	public OBJECT_DEFINITION_ID: number,
    public SHORT_DESC: string,
    public LONG_DESC: string,
    public LANG_CD: string,
    public SOURCE_LANG: string  
    ){}
}

export class Folder {
	constructor( //'','','',''
	public V_DSNID: string,
	public V_SEGMENT_CODE: string,
	public V_SEGMENT_NAME: string,
	public V_SEGMENT_DESC: string 
    ){}
}

export class Table {
	constructor( //'',''
	public table_name: string,
	public display_name: string
    ){}
}