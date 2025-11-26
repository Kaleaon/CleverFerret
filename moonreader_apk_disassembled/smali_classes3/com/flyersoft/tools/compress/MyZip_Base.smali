.class public abstract Lcom/flyersoft/tools/compress/MyZip_Base;
.super Ljava/lang/Object;
.source "MyZip_Base.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;,
        Lcom/flyersoft/tools/compress/MyZip_Base$ZipDone;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createZipper(Ljava/lang/String;)Lcom/flyersoft/tools/compress/MyZip_Base;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x0

    .line 46
    invoke-static {p0, v0}, Lcom/flyersoft/tools/compress/MyZip_Base;->createZipper(Ljava/lang/String;Z)Lcom/flyersoft/tools/compress/MyZip_Base;

    move-result-object p0

    return-object p0
.end method

.method public static createZipper(Ljava/lang/String;Z)Lcom/flyersoft/tools/compress/MyZip_Base;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 51
    invoke-static {p0}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->isMobiExt(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 52
    new-instance v0, Lcom/flyersoft/tools/compress/MyZip_Mobi;

    invoke-direct {v0, p0, p1}, Lcom/flyersoft/tools/compress/MyZip_Mobi;-><init>(Ljava/lang/String;Z)V

    return-object v0

    .line 54
    :cond_0
    :try_start_0
    new-instance p1, Lcom/flyersoft/tools/compress/MyZip_Java;

    invoke-direct {p1, p0}, Lcom/flyersoft/tools/compress/MyZip_Java;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 57
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 59
    :try_start_1
    new-instance v0, Lcom/flyersoft/tools/compress/MyZip_Apache;

    invoke-direct {v0, p0}, Lcom/flyersoft/tools/compress/MyZip_Apache;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    return-object v0

    .line 61
    :catch_1
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 62
    new-instance p0, Ljava/lang/Exception;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static createZipper2(Ljava/lang/String;)Lcom/flyersoft/tools/compress/MyZip_Base;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x0

    .line 69
    invoke-static {p0, v0}, Lcom/flyersoft/tools/compress/MyZip_Base;->createZipper2(Ljava/lang/String;Ljava/lang/String;)Lcom/flyersoft/tools/compress/MyZip_Base;

    move-result-object p0

    return-object p0
.end method

.method public static createZipper2(Ljava/lang/String;Ljava/lang/String;)Lcom/flyersoft/tools/compress/MyZip_Base;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 74
    invoke-static {p0}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->isMobiExt(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 75
    new-instance p1, Lcom/flyersoft/tools/compress/MyZip_Mobi;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/flyersoft/tools/compress/MyZip_Mobi;-><init>(Ljava/lang/String;Z)V

    return-object p1

    :cond_0
    if-eqz p1, :cond_1

    .line 77
    :try_start_0
    new-instance v0, Lcom/flyersoft/tools/compress/MyZip_Apache;

    invoke-direct {v0, p0, p1}, Lcom/flyersoft/tools/compress/MyZip_Apache;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :cond_1
    new-instance p1, Lcom/flyersoft/tools/compress/MyZip_Apache;

    invoke-direct {p1, p0}, Lcom/flyersoft/tools/compress/MyZip_Apache;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 80
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 82
    :try_start_1
    new-instance v0, Lcom/flyersoft/tools/compress/MyZip_Java;

    invoke-direct {v0, p0}, Lcom/flyersoft/tools/compress/MyZip_Java;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    return-object v0

    .line 84
    :catch_1
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 85
    new-instance p0, Ljava/lang/Exception;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public abstract clear()V
.end method

.method public abstract free()V
.end method

.method public abstract getFileInfoOfZip()Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getFileListOfZip()Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getFileStreamFromZip(Ljava/lang/String;)Ljava/io/InputStream;
.end method
