.class public interface abstract Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderValueParser;
.super Ljava/lang/Object;
.source "HeaderValueParser.java"


# virtual methods
.method public abstract parseElements(Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;)[Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderElement;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/burgstaller/okhttp/digest/fromhttpclient/ParseException;
        }
    .end annotation
.end method

.method public abstract parseHeaderElement(Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;)Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderElement;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/burgstaller/okhttp/digest/fromhttpclient/ParseException;
        }
    .end annotation
.end method

.method public abstract parseNameValuePair(Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;)Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/burgstaller/okhttp/digest/fromhttpclient/ParseException;
        }
    .end annotation
.end method

.method public abstract parseParameters(Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;)[Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/burgstaller/okhttp/digest/fromhttpclient/ParseException;
        }
    .end annotation
.end method
