.class public Lcom/rtfparserkit/utils/RtfDump;
.super Ljava/lang/Object;
.source "RtfDump.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 3

    .line 19
    :try_start_0
    new-instance v0, Ljava/io/FileInputStream;

    const/4 v1, 0x0

    aget-object v1, p0, v1

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 20
    new-instance v1, Ljava/io/FileOutputStream;

    const/4 v2, 0x1

    aget-object p0, p0, v2

    invoke-direct {v1, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 21
    new-instance p0, Lcom/rtfparserkit/parser/standard/StandardRtfParser;

    invoke-direct {p0}, Lcom/rtfparserkit/parser/standard/StandardRtfParser;-><init>()V

    .line 22
    new-instance v2, Lcom/rtfparserkit/parser/RtfStreamSource;

    invoke-direct {v2, v0}, Lcom/rtfparserkit/parser/RtfStreamSource;-><init>(Ljava/io/InputStream;)V

    new-instance v0, Lcom/rtfparserkit/utils/RtfDumpListener;

    invoke-direct {v0, v1}, Lcom/rtfparserkit/utils/RtfDumpListener;-><init>(Ljava/io/OutputStream;)V

    invoke-interface {p0, v2, v0}, Lcom/rtfparserkit/parser/IRtfParser;->parse(Lcom/rtfparserkit/parser/IRtfSource;Lcom/rtfparserkit/parser/IRtfListener;)V

    .line 23
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 28
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    return-void
.end method
