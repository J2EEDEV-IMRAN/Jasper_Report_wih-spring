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
import java.util.HashSet;
import java.util.List;
import java.util.Set;


@Entity
@Table(name="Post")
//@EqualsAndHashCode
//@ToString(exclude = {"shortTitleFootnoteList","actRoleFootnoteList","preambleFootnoteList","actScheduleList"})
//@EntityListeners(ActEntityListener.class)
public class Post implements Serializable{

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "id")
    @Getter
    @Setter
    @JsonView(DataTablesOutput.View.class)
    private Integer id;




   /* @Getter
    @Setter
    @JoinColumn(name="postCategoryId", referencedColumnName="id")
    @OneToOne(fetch = FetchType.LAZY)
    @JsonView(DataTablesOutput.View.class)
    @JsonBackReference
    private PostCategory postCategory;*/

    @Getter
    @Setter
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="postCategoryId", referencedColumnName="id")
    private PostCategory postCategory;


	/*@NotEmpty
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "POST_TAG_M",
			joinColumns = { @JoinColumn(name = "POST_ID") },
			inverseJoinColumns = { @JoinColumn(name = "TAG_ID") })
	private Set<PostTag> userProfiles = new HashSet<PostTag>();*/
/*
	@Getter
	@Setter
	@Fetch(FetchMode.SUBSELECT)
	//@JsonInclude(JsonInclude.Include.NON_EMPTY)
	//@JsonManagedReference
	//@OneToMany(fetch = FetchType.EAGER, mappedBy = "post", cascade = CascadeType.ALL)
	@JsonView(DataTablesOutput.View.class)
	private String[] postTags;*/

    @Getter
	@Setter
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="POST_TAG_MAP",joinColumns=@JoinColumn(name="POST_ID"),inverseJoinColumns=@JoinColumn(name="TAG_ID"))
	private Set<PostTag> postTags=new HashSet<PostTag>();


	@Getter
	@Setter
	@Column(name="number")
	@JsonView(DataTablesOutput.View.class)
	private String number;

	@Getter
	@Setter
	@Column(name="orderNo")
	@JsonView(DataTablesOutput.View.class)
	private Integer  orderNo;

	@Getter
	@Setter
	@Column(name="PostTitle")
	@JsonView(DataTablesOutput.View.class)
	private String postTitle;

	@Getter
	@Setter
	@Column(name="post")
	@JsonView(DataTablesOutput.View.class)
	private String post;

	@Getter
	@Setter
	@Column(name = "PostImage")
	@JsonView(DataTablesOutput.View.class)
	private String postImage;

	@Getter
	@Setter
	@Column(name="publishDate")
	@JsonView(DataTablesOutput.View.class)
	private String publishDate;

	@Getter
	@Setter
	@Column(name="Love")
	@JsonView(DataTablesOutput.View.class)
	private Integer love;

	@Getter
	@Setter
	@Column(name="isBanglaPost")
	@JsonView(DataTablesOutput.View.class)
	private Boolean isBanglaPost;

	@Getter
	@Setter
	@Column(name="status")
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

    public Post() {
        super();
    }


}