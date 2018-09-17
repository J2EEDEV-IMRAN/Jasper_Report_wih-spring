package me.imran.personalblog.admin.model;
/**
 * @author Imran Hossain
 */

import com.fasterxml.jackson.annotation.JsonView;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;


@Entity
@Table(name="PostCategory")
//@EqualsAndHashCode
//@ToString
//@EntityListeners(VolumeEntityListener.class)
public class PostCategory implements Serializable{

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "id")
    @Getter
    @Setter
    @JsonView(DataTablesOutput.View.class)
    private Integer id;

    @Getter
    @Setter
    @Fetch(FetchMode.SUBSELECT)
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "postCategory", cascade = CascadeType.ALL)
    @JsonView(DataTablesOutput.View.class)
    private List<Post> postList;


	@Getter
	@Setter
	@Column(name="CategoryName",unique=true)
	@JsonView(DataTablesOutput.View.class)
	private String  categoryName;


	@Getter
	@Setter
	@Column(name="Description")
	@JsonView(DataTablesOutput.View.class)
	private String description;

    @Getter
    @Setter
    @Column(name = "CatImage")
    @JsonView(DataTablesOutput.View.class)
    private String catImage;


    @Getter
    @Setter
    @Column(name="orderNo")
    @JsonView(DataTablesOutput.View.class)
    private Integer  orderNo;

	@Getter
	@Setter
	@Column(name="Status")
	@JsonView(DataTablesOutput.View.class)
	private Boolean status;



    @Getter
    @Setter
    @Column(name="CreatedBy")
    @JsonView(DataTablesOutput.View.class)
    private String  createdBy;

    @Getter
    @Setter
    @Column(name="CreatedAt")
    @DateTimeFormat(pattern = "dd/MM/yyyy HH:mm:ss")
    @JsonView(DataTablesOutput.View.class)
    private Date createdAt;

    @Getter
    @Setter
    @Column(name="UpdatedBy")
    @JsonView(DataTablesOutput.View.class)
    private String  updatedBy;

    @Getter
    @Setter
    @Column(name="UpdatedAt")
    @DateTimeFormat(pattern = "dd/MM/yyyy HH:mm:ss")
    @JsonView(DataTablesOutput.View.class)
    private Date updatedAt;

    public PostCategory() {
        super();
    }


}