/* tslint:disable:no-unused-variable */
import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { By } from '@angular/platform-browser';
import { DebugElement } from '@angular/core';

import { PftComponent } from './pft.component';

describe('PftComponent', () => {
  let component: PftComponent;
  let fixture: ComponentFixture<PftComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PftComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PftComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
