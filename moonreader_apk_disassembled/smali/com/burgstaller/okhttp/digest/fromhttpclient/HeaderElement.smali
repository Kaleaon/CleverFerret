.class public interface abstract Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderElement;
.super Ljava/lang/Object;
.source "HeaderElement.java"


# virtual methods
.method public abstract getName()Ljava/lang/String;
.end method

.method public abstract getParameter(I)Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;
.end method

.method public abstract getParameterByName(Ljava/lang/String;)Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;
.end method

.method public abstract getParameterCount()I
.end method

.method public abstract getParameters()[Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;
.end method

.method public abstract getValue()Ljava/lang/String;
.end method
