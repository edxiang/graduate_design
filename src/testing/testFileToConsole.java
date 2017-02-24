package testing;

import java.io.*;

import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.example.pojos.CET_6;

public class testFileToConsole extends HibernateDaoSupport {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new testFileToConsole().toConsole();
	}

	public void toConsole() {
		try {
			File file = new File("F:\\dispatcher.txt");
			InputStream is = new FileInputStream(file);
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			String s;
			int i = 0;

			while ((s = br.readLine()) != null) {
				CET_6 word = new CET_6();
				String[] ags = s.split("  -  ");
				String means = "";
				for (int j = 0; j < ags.length; j++) {
					String temp = null;
					if (j == 0) {
						temp = ags[j].substring(3);
						word.setWord(temp);
					}
					if (j == 1) {
						temp = ags[j].substring(3);
						word.setSymbols(temp);
					}
					if (j == ags.length - 1) {
						temp = ags[j].substring(9, ags[j].length());
						word.setPron(temp);
					}
					if (j > 1 && j < ags.length - 1) {
						temp = ags[j].substring(3);
						means += temp + " ";
					}
				}
				word.setMeans(means);
				System.out.println(word.getMeans() + word.getPron() + word.getSymbols() + word.getWord());
				// this.getHibernateTemplate().save(word);
				// System.out.print("complete");
				i++;
				if (i == 13)
					break;
			}
			is.close();
			isr.close();
			br.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
