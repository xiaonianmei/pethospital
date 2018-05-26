package com.erdong.warehouse.Test;

import java.util.ArrayList;
import java.util.List;

public class Test {
    public static void main(String args[]){
        Person person=new Person();
        person.setId(1);
        person.setName("qiumei1");
        Person person1=new Person();
        person1.setId(2);
        person1.setName("qiumei2");
        Person person2=new Person();
        person2.setId(3);
        person2.setName("qiumei3");
        List<Person> persons =new ArrayList<>();
        persons.add(person);
        persons.add(person1);
        persons.add(person2);
        persons.stream().filter(person3 -> person3.getId()==1).forEach(person3 -> {
            System.out.println(person3.getId()+"-----"+person3.getName());
            System.out.println(person3.getId());
        });
       persons.stream().filter(per -> per.getId()==1);
       for(Person p:persons){
           System.out.println(p.getName());
       }
       persons.forEach(person3 -> {
           System.out.println(person3.getName());
       });
    }

}
