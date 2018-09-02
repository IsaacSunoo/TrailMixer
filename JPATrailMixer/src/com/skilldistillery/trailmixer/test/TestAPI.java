package com.skilldistillery.trailmixer.test;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.google.gson.Gson;
import com.mysql.jdbc.PreparedStatement;
import com.skilldistillery.trailmixer.entities.Trail;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;
import java.sql.Connection;
import java.sql.DriverManager;


class TestAPI {
//	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("TrailMixer");
//	private static EntityManager em = emf.createEntityManager();
	
	public static void main(String[] args) throws Exception {
		Response response;
		
		String json = "";

		try {

			OkHttpClient client = new OkHttpClient();

			Request request = new Request.Builder().url(
					"https://www.hikingproject.com/data/get-trails?lat=39.7392&lon=-104.9903&maxDistance=50&key=200347795-ecda7b9eb2dfd76c87e6ec49c60f4b2c")
					.get().addHeader("Cache-Control", "no-cache")
					.addHeader("Postman-Token", "39e09bb9-29f4-4370-840a-52c5ef3d323e").build();

			response = client.newCall(request).execute();
			
			json = response.body().string();

		} catch (Exception e) {

			if (e.getCause() != null) {
				throw new Exception("Account Aggregation Failed: " + e.getCause());
			} else {
				throw new Exception("Account Aggregation Failed: " + e.getMessage());
			}
		}
		
		System.out.println("response body:[" + json + "]");
		
		Gson gson = new Gson();
		
		TrailsPopulateTestTest tp = gson.fromJson(json, TrailsPopulateTestTest.class);
		System.out.println("tp:[" + tp + "]");
		
		List<TrailsPopulateTest> trails = (List<TrailsPopulateTest>)tp.getTrails();
		
		if (trails != null) {
			for (TrailsPopulateTest trailsPopulateTest : trails) {
				try {
					String myDriver = "com.mysql.jdbc.Driver";
				      Class.forName(myDriver);
				      Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/trailmixer?useSSL=false;user=trailuser;password=trailuser"); 
					
					 String query = "INSERT INTO trailmixer (NAME, DESCRIPTION, ALTITUDE, ADDRESS, DIFFICULTY, DISTANCE) VALUES(?,?,?,?,?,?)";

				      // create the mysql insert preparedstatement
				      PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(query);
				      preparedStmt.setString (1, trailsPopulateTest.getName());
				      preparedStmt.setString (2, trailsPopulateTest.getSummary());
				      preparedStmt.setInt (3, trailsPopulateTest.getHigh());
				      preparedStmt.setString (4, trailsPopulateTest.getLocation());
				      preparedStmt.setInt (5, Integer.parseInt(trailsPopulateTest.getDifficulty()));
				      preparedStmt.setDouble (6, trailsPopulateTest.getLength());

				      // execute the preparedstatement
				      preparedStmt.execute();
				      
				      conn.close();
				} catch (Exception e) {
					System.out.println(e);
				    }
				}

			} 
		}
	}

