package com.finance.model;

public class TCompany {
    private String tComId;

    private String tComPid;

    private String tComName;

    private String tOrgCode;

    private String tAddress;

    private String tZhuceriqi;

    private String tZhuciziben;

    private String tFaren;

    public String gettComId() {
        return tComId;
    }

    public void settComId(String tComId) {
        this.tComId = tComId == null ? null : tComId.trim();
    }

    public String gettComPid() {
        return tComPid;
    }

    public void settComPid(String tComPid) {
        this.tComPid = tComPid == null ? null : tComPid.trim();
    }

    public String gettComName() {
        return tComName;
    }

    public void settComName(String tComName) {
        this.tComName = tComName == null ? null : tComName.trim();
    }

    public String gettOrgCode() {
        return tOrgCode;
    }

    public void settOrgCode(String tOrgCode) {
        this.tOrgCode = tOrgCode == null ? null : tOrgCode.trim();
    }

    public String gettAddress() {
        return tAddress;
    }

    public void settAddress(String tAddress) {
        this.tAddress = tAddress == null ? null : tAddress.trim();
    }

    public String gettZhuceriqi() {
        return tZhuceriqi;
    }

    public void settZhuceriqi(String tZhuceriqi) {
        this.tZhuceriqi = tZhuceriqi == null ? null : tZhuceriqi.trim();
    }

    public String gettZhuciziben() {
        return tZhuciziben;
    }

    public void settZhuciziben(String tZhuciziben) {
        this.tZhuciziben = tZhuciziben == null ? null : tZhuciziben.trim();
    }

    public String gettFaren() {
        return tFaren;
    }

    public void settFaren(String tFaren) {
        this.tFaren = tFaren == null ? null : tFaren.trim();
    }
}