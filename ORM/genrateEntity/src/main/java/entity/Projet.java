package entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "projet")
public class Projet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "projet_id", nullable = false)
    private Integer id;

    @Column(name = "titre", nullable = false, length = 100)
    private String titre;

    @Lob
    @Column(name = "description")
    private String description;

}