package heritage.single_table;


import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "creditCard")
@Data
@PrimaryKeyJoinColumn(name = "idPayment")
public class CreditCardPayment1 extends Payment1 {


    private String cardNumber;

    private String expirationDate;


    @Override
    public String toString() {
        return "CreditCardPayment{" +
                "cardNumber='" + cardNumber + '\'' +
                ", expirationDate='" + expirationDate + '\'' +
                "} " + super.toString();
    }
}
