package com.example;

import java.util.*;

public class Repository {
	private static List<Map<String, String>> dataList = new ArrayList<>();
	private static int sequence = 1;

	static {
		add("김준형", "신장", "010-1234-5678");
		add("홍길동", "간", "010-9876-5432");
	}

	public static void add(String name, String organ, String contact) {
		Map<String, String> map = new HashMap<>();
		map.put("id", String.valueOf(sequence++));
		map.put("name", name);
		map.put("organ", organ);
		map.put("contact", contact);
		map.put("date", new java.util.Date().toString());
		dataList.add(map);
	}

	public static List<Map<String, String>> getAll() {
		return dataList;
	}

	public static Map<String, String> getById(String id) {
		for (Map<String, String> m : dataList) {
			if (m.get("id").equals(id)) return m;
		}
		return null;
	}

	public static void delete(String id) {
		dataList.removeIf(m -> m.get("id").equals(id));
	}

	public static void update(String id, String name, String organ, String contact) {
		Map<String, String> m = getById(id);
		if (m != null) {
			m.put("name", name);
			m.put("organ", organ);
			m.put("contact", contact);
		}
	}
}