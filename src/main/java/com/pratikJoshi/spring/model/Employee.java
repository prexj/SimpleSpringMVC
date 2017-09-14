package com.pratikJoshi.spring.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.TableGenerator;
import javax.persistence.Transient;

@Entity
@Table(name="employeep")
public class Employee implements Serializable{
	
	@Id
	//@TableGenerator(name="TABLE_GEN",table="T_GENERATOR",pkColumnName="GEN_KEY",pkColumnValue="TEST",valueColumnName="GEN_VALUE",initialValue=1,allocationSize=1)
	//@GeneratedValue(strategy=GenerationType.TABLE, generator="TABLE_GEN")
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id")
	private int id;
	
	@Column(name="firstname")
	private String firstname;
	
	@Column(name ="lastname")
	private String lastname;
	
	@Column(name="address")
	private String address;
	
	/*@Column(name="skill")
	private String skill;*/
	@Column(name="gender")
	private String gender;
	
	//@Transient
	@Column(name="dflag")
	private int dflag;
	
	/*public Employee()*/
	
	public int getDflag() {
		return dflag;
	}
	public void setDflag(int dflag) {
		this.dflag = dflag;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	/*public String getSkill() {
		return skill;
	}
	public void setSkill(String skill) {
		this.skill = skill;
	}*/
	@Override
	public String toString() {
		return "Employee [id=" + id + ", firstname=" + firstname
				+ ", lastname=" + lastname + ", address=" + address
				+  ", dflag=" + dflag + "]";/*;, skill=" + skill +
*/	}
	
	

}

