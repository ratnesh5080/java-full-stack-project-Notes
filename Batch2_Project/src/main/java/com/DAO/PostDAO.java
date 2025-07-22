package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import java.util.List;

import com.User.Post;

public class PostDAO {
	private Connection conn;
	
	public PostDAO(Connection conn) {
		super();
		this.conn=conn;
	}
	
	public boolean AddNotes(String ti,String co,int ui) {
		boolean f=false;
		try {
			String query ="insert into post (title,content,uid)values(?,?,?)";
			PreparedStatement pstmt=conn.prepareStatement(query);
			
			pstmt.setString(1, ti);
			pstmt.setString(2, co);
			pstmt.setInt(3,ui);
			
			int i=pstmt.executeUpdate();
			if(i==1) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	
	//To get all post from the post table;
	public List<Post> getData(int id) {
		List<Post> list=new ArrayList<Post>();
		Post po;
		try {
			String query ="select * from post where uid=?";
			PreparedStatement ps=conn.prepareStatement(query);
			
			ps.setInt(1, id);			
			ResultSet rs =ps.executeQuery();
			while(rs.next()) {
				po=new Post();
				po.setId(rs.getInt(1));
				po.setTitle(rs.getString(2));
				po.setContnent(rs.getString("content"));
				po.setPdate(new java.util.Date(rs.getLong(4)));
				
				list.add(po);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
   	}
	//Delete using the user_id code start here
	
	public boolean deleteNotes(int nid) {
		boolean f=false;
		try {
			String query="delete from post where id=?";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setInt(1, nid);
		    int i=ps.executeUpdate();
		    if(i==1) {
		    	f=true;
		    }
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	//Delete using the user_id code end here
	
	
	//Update data using id
	public Post getDataById(int nodeId) {
		Post p=null;
		try {
			Connection conn=this.conn;
			String query="select* from post where id=?";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setInt(1, nodeId);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				p=new Post();
				p.setId(rs.getInt(1));
				p.setTitle(rs.getString(2));
				p.setContnent(rs.getString(3));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return p;
		
	}
	
	public boolean UpdateNotes(int nid ,String ti,String co) {
		boolean f=false;
		try {
			String query="Update post set title=?, content=? where id=?";
			PreparedStatement ps=conn.prepareStatement(query);
			
			ps.setString(1, ti);
			ps.setString(2,co);
			ps.setInt(3, nid);
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
	