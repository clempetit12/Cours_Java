package heritage.single_table;


import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "payPal")
@PrimaryKeyJoinColumn(name = "idPayment")
@Data
public class PayPalPayment1 extends Payment1 {

    private String accountNumber;

    @Override
    public String toString() {
        return "PayPalPayment{" +
                "accountNumber='" + accountNumber + '\'' +
                "} " + super.toString();
    }
}
