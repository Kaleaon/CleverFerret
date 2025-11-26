.class public Lcom/rtfparserkit/converter/text/StreamTextConverter;
.super Lcom/rtfparserkit/converter/text/AbstractTextConverter;
.source "StreamTextConverter.java"


# instance fields
.field private charset:Ljava/nio/charset/Charset;

.field private os:Ljava/io/OutputStream;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Lcom/rtfparserkit/converter/text/AbstractTextConverter;-><init>()V

    return-void
.end method


# virtual methods
.method public convert(Lcom/rtfparserkit/parser/IRtfSource;Ljava/io/OutputStream;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 33
    iput-object p2, p0, Lcom/rtfparserkit/converter/text/StreamTextConverter;->os:Ljava/io/OutputStream;

    .line 34
    invoke-static {p3}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object p2

    iput-object p2, p0, Lcom/rtfparserkit/converter/text/StreamTextConverter;->charset:Ljava/nio/charset/Charset;

    .line 35
    invoke-virtual {p0, p1}, Lcom/rtfparserkit/converter/text/StreamTextConverter;->convert(Lcom/rtfparserkit/parser/IRtfSource;)V

    return-void
.end method

.method public processExtractedText(Ljava/lang/String;)V
    .locals 2

    .line 43
    :try_start_0
    iget-object v0, p0, Lcom/rtfparserkit/converter/text/StreamTextConverter;->os:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/rtfparserkit/converter/text/StreamTextConverter;->charset:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 48
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method
