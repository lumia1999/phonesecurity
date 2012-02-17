package com.herry.zip;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.zip.ZipEntry;
import java.util.zip.ZipException;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;

public class ZipUtils {
	/**
	 * 
	 * @param zipFilePath
	 *            将要解压的zip文件的路径
	 * @return
	 */
	public static void unzip(String zipFilePath) throws ZipException,
			IOException {
		File f = new File(zipFilePath);
		String fName = getzipFileName(f);
		ZipFile zipFile = new ZipFile(f);
		File decompressFileDir = new File(f.getParentFile(), fName);
		decompressFileDir.mkdirs();
		Enumeration<? extends ZipEntry> entries = zipFile.entries();
		ZipEntry entry = null;
		String entryName = null;
		File entryDest = null;
		while (entries.hasMoreElements()) {
			entry = entries.nextElement();
			entryName = entry.getName();
			// System.out.println(entryName);
			entryDest = new File(decompressFileDir, entryName);
			System.out.println(entryDest.getAbsolutePath());
			if (entry.isDirectory()) {
				System.out.println("make dir");
				entryDest.mkdirs();
			} else {
				entryDest.getParentFile().mkdirs();
				getFile(entryDest, entry, zipFile);
			}
		}
	}

	private static String getzipFileName(File zipFile) {
		String fName = zipFile.getName();
		int index = -1;
		index = fName.lastIndexOf(".");
		if (index == -1) {
			return null;
		}
		return fName.substring(0, index);
	}

	private static void getFile(File dest, ZipEntry entry, ZipFile owner)
			throws IOException {
		InputStream is = null;
		OutputStream os = null;
		try {
			InputStream rawIs = owner.getInputStream(entry);
			is = new BufferedInputStream(rawIs);
			FileOutputStream rawOs = new FileOutputStream(dest);
			os = new BufferedOutputStream(rawOs);
			byte[] buf = new byte[8192];
			int len;
			while ((len = is.read(buf)) != -1) {
				os.write(buf, 0, len);
			}
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (IOException e) {

				}
			}
			if (os != null) {
				try {
					os.close();
				} catch (IOException e) {
					//
				}
			}
		}
	}

	/**
	 * 
	 * @param folder
	 *            必须为文件夹
	 */

	public static void zip(String folder) throws IOException {
		File f = new File(folder);
		if (!f.isDirectory()) {
			System.out.println("folder must be a directory");
			return;
		}
		String zipFilePath = f.getAbsolutePath() + ".zip";
		ZipOutputStream zos = new ZipOutputStream(new FileOutputStream(
				zipFilePath));
		String baseDir = "";
		File[] lists = f.listFiles();
		int length = lists.length;
		for (int i = 0; i < length; i++) {
			baseDir = "";
			compress(lists[i], zos, baseDir);
		}
		zos.close();
	}

	private static void compress(File file, ZipOutputStream zos, String baseDir)
			throws IOException {
		if (file.isDirectory()) {
			compressDirectory(file, zos, baseDir);
		} else {
			compressFile(file, zos, baseDir);
		}
	}

	private static void compressDirectory(File dir, ZipOutputStream zos,
			String baseDir) throws IOException {
		if (!dir.exists()) {
			return;
		}

		File[] files = dir.listFiles();
		int length = files.length;
		if (length == 0) {
			// empty folder TODO
			ZipEntry entry = new ZipEntry(baseDir + dir.getName()
					+ File.separator);
			zos.putNextEntry(entry);
			zos.closeEntry();
		} else {
			for (int i = 0; i < length; i++) {
				compress(files[i], zos, baseDir + dir.getName()
						+ File.separator);
			}
		}
	}

	private static void compressFile(File file, ZipOutputStream zos,
			String baseDir) throws IOException {
		if (!file.exists()) {
			return;
		}
		System.out.println("file path : " + file.getAbsolutePath());
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(
				file));
		ZipEntry entry = new ZipEntry(baseDir + file.getName());
		zos.putNextEntry(entry);
		int count;
		byte[] buf = new byte[8192];
		while ((count = bis.read(buf)) != -1) {
			zos.write(buf, 0, count);
		}
		bis.close();
	}

	public static void main(String[] args) {
		String dir = System.getProperty("user.dir");
		System.out.println(dir);
		System.out.println(File.separator);
		try {
			unzip(dir + File.separator + "ttt.zip");
			zip(dir + File.separator + "test" + File.separator);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
