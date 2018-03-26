package cxc.project.net1.model.web;

import java.util.List;

public class TreeNode<T> {
	
	public TreeNode(String id, String text, String state, String iconCls,
			boolean checked) {
		super();


		this.id = id;
		this.text = text;
		this.state = state;
		this.iconCls = iconCls;
		this.checked = checked;
	}
	
	private String id;
	private String text;
	private String state;
	private String iconCls;
	private boolean checked;
	
	private List<T> children;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getIconCls() {
		return iconCls;
	}
	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	public List<T> getChildren() {
		return children;
	}
	public void setChildren(List<T> children) {
		this.children = children;
	}
}