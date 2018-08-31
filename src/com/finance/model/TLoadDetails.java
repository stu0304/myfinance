package com.finance.model;

public class TLoadDetails {
    private String tLoanId;

    private String tLoanoutComid;

    private String tLoaninComid;

    private String tLoanPreTime;

    private String tLoanStartTime;

    private String tLoanNum;

    private String tLoanEndTime;

    private String tWarnDays;

    private String tWeiyueNum;

    private String tLixi;

    private String tChanghuanTotal;

    private String tStatus;
    
    private String isWarn;

    
    
    public String getIsWarn() {
		return isWarn;
	}

	public void setIsWarn(String isWarn) {
		this.isWarn = isWarn;
	}

	public String gettLoanId() {
        return tLoanId;
    }

    public void settLoanId(String tLoanId) {
        this.tLoanId = tLoanId == null ? null : tLoanId.trim();
    }

    public String gettLoanoutComid() {
        return tLoanoutComid;
    }

    public void settLoanoutComid(String tLoanoutComid) {
        this.tLoanoutComid = tLoanoutComid == null ? null : tLoanoutComid.trim();
    }

    public String gettLoaninComid() {
        return tLoaninComid;
    }

    public void settLoaninComid(String tLoaninComid) {
        this.tLoaninComid = tLoaninComid == null ? null : tLoaninComid.trim();
    }

    public String gettLoanPreTime() {
        return tLoanPreTime;
    }

    public void settLoanPreTime(String tLoanPreTime) {
        this.tLoanPreTime = tLoanPreTime == null ? null : tLoanPreTime.trim();
    }

    public String gettLoanStartTime() {
        return tLoanStartTime;
    }

    public void settLoanStartTime(String tLoanStartTime) {
        this.tLoanStartTime = tLoanStartTime == null ? null : tLoanStartTime.trim();
    }

    public String gettLoanNum() {
        return tLoanNum;
    }

    public void settLoanNum(String tLoanNum) {
        this.tLoanNum = tLoanNum == null ? null : tLoanNum.trim();
    }

    public String gettLoanEndTime() {
        return tLoanEndTime;
    }

    public void settLoanEndTime(String tLoanEndTime) {
        this.tLoanEndTime = tLoanEndTime == null ? null : tLoanEndTime.trim();
    }

    public String gettWarnDays() {
        return tWarnDays;
    }

    public void settWarnDays(String tWarnDays) {
        this.tWarnDays = tWarnDays == null ? null : tWarnDays.trim();
    }

    public String gettWeiyueNum() {
        return tWeiyueNum;
    }

    public void settWeiyueNum(String tWeiyueNum) {
        this.tWeiyueNum = tWeiyueNum == null ? null : tWeiyueNum.trim();
    }

    public String gettLixi() {
        return tLixi;
    }

    public void settLixi(String tLixi) {
        this.tLixi = tLixi == null ? null : tLixi.trim();
    }

    public String gettChanghuanTotal() {
        return tChanghuanTotal;
    }

    public void settChanghuanTotal(String tChanghuanTotal) {
        this.tChanghuanTotal = tChanghuanTotal == null ? null : tChanghuanTotal.trim();
    }

    public String gettStatus() {
        return tStatus;
    }

    public void settStatus(String tStatus) {
        this.tStatus = tStatus == null ? null : tStatus.trim();
    }
}