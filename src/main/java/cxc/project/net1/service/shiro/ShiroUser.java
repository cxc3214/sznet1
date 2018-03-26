package cxc.project.net1.service.shiro;

import java.io.Serializable;
import java.util.List;

public class ShiroUser implements  Serializable {

	public  ShiroUser() {
		
	}
	private static final long serialVersionUID = 1L;	 
	 private int id ;
	 private String name;
	 private String password ;
	 private String comment;
	 private int type ;
	 private int permission ;
	 private List<String> role;
	 private String indexurl;

	public String getIndexurl() {
		return indexurl;
	}
	public void setIndexurl(String indexurl) {
		this.indexurl = indexurl;
	}
	public List<String> getRole() {
		return role;
	}
	public void setRole(List<String> role) {
		this.role = role;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getPermission() {
		return permission;
	}
	public void setPermission(int permission) {
		this.permission = permission;
	}
	
	public ShiroUser(ShiroUser user) {
		this.id =user.getId();
		this.name =user.getName();
		this.password = user.getPassword();
		this.comment = user.getComment();
		this.type = user.getType();
		this.permission = user.getPermission();
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * 本函数输出将作为默认的<shiro:principal/>输出.
	 */
	@Override
	public String toString() {
		return this.name;
	}

	/**
	 * 重载equals,只计算account;
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ShiroUser other = (ShiroUser) obj;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		return true;
	}
}
