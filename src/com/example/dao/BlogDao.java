package com.example.dao;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Serializable;
import java.net.URL;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.example.pojos.*;

public class BlogDao extends HibernateDaoSupport {

	public void save(Blog blog) {
		this.getHibernateTemplate().save(blog);
		System.out.println("complete!");
	}

	public Blog getContent() {
		cet4();

		String hql = "from Blog b where b.content like '%pro%'";

		List<Blog> list = (List<Blog>) this.getHibernateTemplate().find("from Blog");
		Blog b = list.get(3);

		if (b != null) {
			System.out.println(b.getContent());
			System.out.println(b.getId());
			System.out.println(b.getDate());
		}
		return b;
	}

	public void cet4() {
		try {
			String s_url = "http://word.iciba.com/?action=words&class=14&course=";
			for (int numberOfWord = 1; numberOfWord <= 245; numberOfWord++) {
				URL url = new URL(s_url + numberOfWord);

				InputStream in = url.openStream();
				InputStreamReader isr = new InputStreamReader(in);
				BufferedReader bufr = new BufferedReader(isr);
				String str;
				String htmlContent = "";

				while ((str = bufr.readLine()) != null) {
					htmlContent += str + "\n";
				}

				String reg = "[\\s\\S]*<ul class=\"word_main_list\" p_id=\"1\" id=\"word_list_1\" >";
				Pattern p = Pattern.compile(reg);
				Matcher m = p.matcher(htmlContent);
				String result = m.replaceAll("");

				String ags_li[] = result.split("</li>");

				for (int i = 0; i < ags_li.length - 1; i++) {
					TOEFL word = new TOEFL();
					// get mp3.uri;
					String tag = "";
					String target = "";
					String arg_n[] = ags_li[i].split("\n");
					for (int j = 0; j < arg_n.length; j++) {
						if (arg_n[j].matches("[\\s\\S]*http[\\s\\S]*")) {
							tag = arg_n[j];
							target = tag.substring(tag.indexOf("http"), tag.indexOf(".mp3") + 4);
							break;
						}
					}

					// 过滤HTML标签；
					Matcher m1 = Pattern.compile("<[^>]+>").matcher(ags_li[i]);
					String result1 = m1.replaceAll("");
					// 将空白字符转化为“！”标志；
					Matcher m2 = Pattern.compile("\\s+").matcher(result1);
					String result2 = m2.replaceAll("!");

					String args[] = result2.split("!");
					word.setWord(args[1]);
					word.setSymbols(args[2]);
					String means = "";
					for (int ijk = 3; ijk < args.length; ijk++) {
						means += args[ijk];
					}
					word.setMeans(means);
					word.setPron(target);
					this.getHibernateTemplate().save(word);
				}
				System.out.println(numberOfWord);
				in.close();
				isr.close();
				bufr.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
