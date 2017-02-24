package testing;

import com.example.pojos.LearnWords;
import com.google.gson.*;

public class testGson {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String s = "\"word\":\"expire\", \"means\":\"vi. 满期，到期；断气\", \"symbols\":\"[iksˈpaiə]\"";
		Gson gson = new Gson();
		String name = gson.toJson(s);
		System.out.println(name);
	}

}
