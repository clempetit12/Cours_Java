package demo;

import entity.oneToOne.Adress;
import entity.oneToOne.House;
import entity.oneToOne.Type;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class Demo4 {

private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("demo_jpa");

    public static void main() {
        EntityManager em = emf.createEntityManager();

        em.getTransaction().begin();
        Adress adress = new Adress();
        adress.setCity("lille");
        adress.setPostalCode("59800");
        adress.setStreetName("rue des lilas");
        adress.setNumber(12);

        House house = new House();
        house.setSize(500);

        house.setType(Type.RENOVATED);
        house.setAdress(adress);


        em.persist(house);
        em.getTransaction().commit();
        House house1 = em.find(House.class,house.getId());
        System.out.println("house : " + house1);
        em.close();
        emf.close();
    }




}
