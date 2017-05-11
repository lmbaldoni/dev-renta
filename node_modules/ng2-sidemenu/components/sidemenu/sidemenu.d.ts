import { EventEmitter, ElementRef, OnInit } from 'angular2/core';
export declare class SideMenuComponent implements OnInit {
    data: {
        [category: string]: any[];
    };
    selected: EventEmitter<any>;
    element: ElementRef;
    categories: string[];
    categoryStateMap: {
        [category: string]: boolean;
    };
    constructor(element: ElementRef);
    ngOnInit(): any;
    onCategoryBtnClick(category: string): void;
}
