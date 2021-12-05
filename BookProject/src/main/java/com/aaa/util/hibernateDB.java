package com.aaa.util;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * DB类 数据库操作
 * 
 * @author 范博源
 * 
 */
@Component
@SuppressWarnings({ "unchecked" })
public class hibernateDB {
	@Autowired
	public SessionFactory sf;
	public Session session = null;

	public void getSession() {
		// 使用getCurrentSession()获取的session对象会自动绑定当前线程
		this.session = sf.getCurrentSession();
	}

	/**
	 * 给参数赋值
	 * 
	 * @param query
	 * @param params
	 * @return
	 */
	public Query setParams(Query query, Map<String, Object> map,
			Object... params) {
		if (null != query) {
			// 启用查询缓存
			query.setCacheable(true);
		}
		if (null != params) {
			for (int i = 0; i < params.length; i++) {
				query.setParameter("" + i + "", params[i]);
			}
		}
		if (null != map) {
			query.setProperties(map);
		}
		return query;
	}

	/**
	 * 使用hql语句查询数据
	 * 
	 * @param hql
	 * @param params
	 *            使用?占位符时对应的参数
	 * @param map
	 *            使用名称占位符时对应的参数
	 * @return
	 */
	public <T> List<T> HqlQueryAll(String hql, Map<String, Object> map,
			Object... params) {
		getSession();
		List<T> list = setParams(session.createQuery(hql), map, params).list();
		return list;
	}

	/**
	 * 使用HQL语句分页查询
	 * 
	 * @param hql
	 * @param pageSize
	 *            每页显示的个数
	 * @param page
	 *            页数
	 * @param map
	 *            使用名称占位符时对应的参数
	 * @param params
	 *            使用?占位符时对应的参数
	 * @return
	 */
	public <T> List<T> HqlQueryAll(String hql, int pageSize, int page,
			Map<String, Object> map, Object... params) {
		getSession();
		List<T> list = setParams(session.createQuery(hql), map, params)
				.setFirstResult(pageSize * (page - 1)).setMaxResults(pageSize)
				.list();
		return list;
	}

	/**
	 * 使用hql分页查询，并保存总页数
	 * 
	 * @param hql
	 * @param pageSize
	 *            每页显示的个数
	 * @param page
	 *            当前页
	 * @param map
	 * @param params
	 * @return
	 */
	public <T> Paging HqlPagingQuery(String hql, int pageSize, int page,
			Map<String, Object> map, Object... params) {
		int count = HqlQueryAll(hql, map, params).size();
		List<T> pagingList = HqlQueryAll(hql, pageSize, page, map, params);
		if (page < 1) {
			page = 1;
		}
		Paging paging = new Paging(page, pageSize, pagingList);
		paging.setTotalPages(paging.getTotalPage(count, pageSize));
		return paging;
	}

	/**
	 * 使用SQL语句分页查询
	 * 
	 * @param Sql
	 * @param pageSize
	 *            每页显示的个数
	 * @param page
	 *            页数
	 * @param map
	 *            使用名称占位符时对应的参数
	 * @param params
	 *            使用?占位符时对应的参数
	 * @return
	 */
	public <T> List<T> SqlQueryAll(String sql, int pageSize, int page,
			Map<String, Object> map, Object... params) {
		getSession();
		List<T> list = setParams(session.createSQLQuery(sql), map, params)
				.setFirstResult(pageSize * (page - 1)).setMaxResults(pageSize)
				.list();
		return list;
	}

	/**
	 * 使用sql语句查询数据
	 * 
	 * @param sql
	 * @param params
	 *            使用?占位符时对应的参数
	 * @param map
	 *            使用名称占位符时对应的参数
	 * @return
	 */
	public <T> List<T> SqlQueryAll(String sql, Map<String, Object> map,
			Object... params) {
		getSession();
		List<T> list = setParams(session.createSQLQuery(sql), map, params)
				.list();
		return list;
	}

	/**
	 * 使用HQL语句对数据进行删除和修改
	 * 
	 * @param hql
	 * @param map
	 *            用名称占位符时对应的参数
	 * @param params
	 *            使用?占位符时对应的参数
	 * @return 受影响的行数
	 */
	public boolean HqlExecQuery(String hql, Map<String, Object> map,
			Object... params) {
		getSession();
		int querys = setParams(session.createQuery(hql), map, params)
				.executeUpdate();
		if (querys > 0) {
			return true;
		}
		return false;
	}

	/**
	 * 使用SQL语句对数据进行删除,修改和添加
	 * 
	 * @param Sql
	 * @param map
	 *            用名称占位符时对应的参数
	 * @param params
	 *            使用?占位符时对应的参数
	 * @return 受影响的行数
	 */
	public int SqlExecQuery(String sql, Map<String, Object> map,
			Object... params) {
		getSession();
		int querys = setParams(session.createSQLQuery(sql), map, params)
				.executeUpdate();
		return querys;
	}

	/**
	 * 使用session对象 添加数据
	 * 
	 * @param obj
	 * @return
	 */
	public boolean saveObj(Object obj) {
		getSession();
		session.save(obj);
		return true;
	}

	/**
	 * 使用session对象 修改数据
	 * 
	 * @param obj
	 * @return
	 */
	public boolean updateObj(Object obj) {
		getSession();
		session.update(obj);
		return true;
	}

	/**
	 * 根据主键获取对应的对象
	 * 
	 * @param clazz
	 * @param id
	 * @return
	 */
	public <T> T getObject(Class<T> clazz, Serializable id) {
		getSession();
		T obj = (T) session.get(clazz, id);
		return obj;
	}

	/**
	 * 使用session对象 删除
	 * 
	 * @param obj
	 *            要删除的对象
	 * @return
	 */
	public boolean delObj(Object obj) {
		getSession();
		session.delete(obj);
		return true;
	}
}
