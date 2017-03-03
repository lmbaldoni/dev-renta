/* tslint:disable:no-unused-variable */
import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { By } from '@angular/platform-browser';
import { DebugElement } from '@angular/core';

import { PftRuleCompComponent } from './pft-rule-comp.component';

describe('PftRuleCompComponent', () => {
  let component: PftRuleCompComponent;
  let fixture: ComponentFixture<PftRuleCompComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PftRuleCompComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PftRuleCompComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
