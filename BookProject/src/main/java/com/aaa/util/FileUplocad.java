package com.aaa.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.UUID;

import org.apache.struts2.ServletActionContext;

public class FileUplocad {
	/**
	 * 
	 * @param fileUplocad
	 *            上传的文件
	 * @param fileName
	 *            上传的文件原名称
	 * @param path
	 *            上传的路径
	 * @return
	 */
	@SuppressWarnings({ "resource", "unused" })
	public static String Uplocad(File[] fileUplocad, String[] fileName,
			String path, String[] newFileName) {
		StringBuffer filePaths = new StringBuffer();
		try {
			if (null != fileUplocad) {
				for (int i = 0; i < fileName.length; i++) {
					// 获取文件后缀名
					int index = fileName[i].lastIndexOf(".");
					UUID fileUUid = UUID.randomUUID();
					// 创建一个新的文件名
					if (null == newFileName[i]) {
						newFileName[i] = fileUUid.toString()
								+ fileName[i].substring(index);
					} else {
						newFileName[i] = newFileName[i]
								+ fileName[i].substring(index);
					}
					// 获取上传文件要保存的路径
					path = ServletActionContext.getServletContext()
							.getRealPath(path);
					File fileNew = new File(path + "\\" + newFileName);

					FileInputStream in = new FileInputStream(fileUplocad[i]);
					FileOutputStream out = new FileOutputStream(fileNew);

					byte[] byts = new byte[1024];
					int j = 0;

					while ((j = in.read(byts)) != -1) {
						out.write(byts);
					}
					out.flush();
					out.close();
					filePaths.append(path + "\\" + newFileName);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return filePaths.toString();
	}

	/**
	 * 单个文件上传
	 * 
	 * @param fileUplocad
	 *            上传的文件
	 * @param fileName
	 *            上传的文件名
	 * @param path
	 *            上传的路径
	 * @param newFileName
	 *            新的文件名，可以为空
	 * @return 返回新的文件名
	 */
	@SuppressWarnings({ "resource", "unused" })
	public static String Uplocad(File fileUplocad, String fileName,
			String path, String newFileName) {
		StringBuffer filePaths = new StringBuffer();
		try {
			if (null != fileUplocad) {
				// 获取文件后缀名
				int index = fileName.lastIndexOf(".");
				UUID fileUUid = UUID.randomUUID();
				// 创建一个新的文件名
				if (null == newFileName) {
					newFileName = fileUUid.toString()
							+ fileName.substring(index);
				} else {
					newFileName = newFileName + fileName.substring(index);
				}
				// 获取上传文件要保存的路径
				path = ServletActionContext.getServletContext().getRealPath(
						path);
				File fileNew = new File(path + "\\" + newFileName);
				FileInputStream in = new FileInputStream(fileUplocad);
				FileOutputStream out = new FileOutputStream(fileNew);
				byte[] byts = new byte[1024];
				int j = 0;
				while ((j = in.read(byts)) != -1) {
					out.write(byts);
				}
				out.flush();
				out.close();
				filePaths.append(path + "\\" + newFileName);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return newFileName;
	}
}
