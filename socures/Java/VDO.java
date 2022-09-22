package bean;

import java.sql.Date;

import javax.persistence.*;
import java.time.LocalDateTime;


public class VDO {
	
	private int videoid;
	private String filename;
	private String sentdate;
	private String status;
	private int Company_companyid;

	public VDO() {
		// TODO Auto-generated constructor stub
	}

	public VDO(int videoid, String filename, String sentdate, String status, int company_companyid) {
		super();
		this.videoid = videoid;
		this.filename = filename;
		this.sentdate = sentdate;
		this.status = status;
		Company_companyid = company_companyid;
	}

	public int getVideoid() {
		return videoid;
	}

	public String getFilename() {
		return filename;
	}

	public String getSentdate() {
		return sentdate;
	}

	public String getStatus() {
		return status;
	}

	public int getCompany_companyid() {
		return Company_companyid;
	}

	public void setVideoid(int videoid) {
		this.videoid = videoid;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public void setSentdate(String sentdate) {
		this.sentdate = sentdate;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setCompany_companyid(int company_companyid) {
		Company_companyid = company_companyid;
	}

	
	
	
}
