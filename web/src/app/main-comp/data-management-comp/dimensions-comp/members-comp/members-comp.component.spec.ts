/* tslint:disable:no-unused-variable */
import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { By } from '@angular/platform-browser';
import { DebugElement } from '@angular/core';

import { MembersCompComponent } from './members-comp.component';

describe('MembersCompComponent', () => {
  let component: MembersCompComponent;
  let fixture: ComponentFixture<MembersCompComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MembersCompComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MembersCompComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
