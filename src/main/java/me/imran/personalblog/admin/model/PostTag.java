package me.imran.personalblog.admin.model;

/**
 * @author Imran Hossain
 */

import com.fasterxml.jackson.annotation.JsonView;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;


@Entity
@Table(name="PostTag")
//@EqualsAndHashCode
//@ToString
//@EntityListeners(VolumeEntityListener.class)
public class PostTag implements Serializable{

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "id")
    @Getter
    @Setter
    @JsonView(DataTablesOutput.View.class)
    private Integer id;

    /*@Getter
    @Setter
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="postId", referencedColumnName="id")
    @JsonBackReference
    @JsonView(DataTablesOutput.View.class)
    private Post  post;*/

    @Getter
    @Setter
    @ManyToMany(mappedBy="postTags",fetch = FetchType.EAGER,cascade = CascadeType.MERGE)
    private Set<Post> postList=new HashSet<Post>();


	@Getter
	@Setter
	@Column(name="tagName", length=15, unique=true, nullable=false)
	@JsonView(DataTablesOutput.View.class)
	private String  tagName;


	@Getter
	@Setter
	@Column(name="description")
	@JsonView(DataTablesOutput.View.class)
	private String description;


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

    public PostTag() {
        super();
    }


}