package hcmute.utils;

import java.io.BufferedReader;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;


public class HttpUtil {
	private String value;

	public HttpUtil(String value) {
		this.value = value;
	}

	public <T> T toModel(Class<T> tClass) {
		try {
			return new ObjectMapper().readValue(value, tClass);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public <T> List<T> toList(Class<T> tClass) {
		List<T> list = new ArrayList<T>();
		try {
			ObjectMapper objectMapper = new ObjectMapper();
	        list = objectMapper.readValue(value, objectMapper.getTypeFactory().constructCollectionType(List.class, tClass));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static HttpUtil of(BufferedReader reader) {
		StringBuilder sb = new StringBuilder();
		try {
			String line;
			while ((line = reader.readLine()) != null) {
				sb.append(line);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new HttpUtil(sb.toString());
	}
}
