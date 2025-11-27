.class public Lorg/apache/tools/zip/ExtraFieldUtils;
.super Ljava/lang/Object;
.source "ExtraFieldUtils.java"


# static fields
.field static synthetic class$org$apache$tools$zip$AsiExtraField:Ljava/lang/Class;

.field private static implementations:Ljava/util/Hashtable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 77
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    sput-object v0, Lorg/apache/tools/zip/ExtraFieldUtils;->implementations:Ljava/util/Hashtable;

    .line 78
    sget-object v0, Lorg/apache/tools/zip/ExtraFieldUtils;->class$org$apache$tools$zip$AsiExtraField:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-string v0, "org.apache.tools.zip.AsiExtraField"

    invoke-static {v0}, Lorg/apache/tools/zip/ExtraFieldUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/zip/ExtraFieldUtils;->class$org$apache$tools$zip$AsiExtraField:Ljava/lang/Class;

    :cond_0
    invoke-static {v0}, Lorg/apache/tools/zip/ExtraFieldUtils;->register(Ljava/lang/Class;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 1

    .line 78
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    new-instance v0, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static createExtraField(Lorg/apache/tools/zip/ZipShort;)Lorg/apache/tools/zip/ZipExtraField;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InstantiationException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .line 110
    sget-object v0, Lorg/apache/tools/zip/ExtraFieldUtils;->implementations:Ljava/util/Hashtable;

    invoke-virtual {v0, p0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    if-eqz v0, :cond_0

    .line 112
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/apache/tools/zip/ZipExtraField;

    return-object p0

    .line 114
    :cond_0
    new-instance v0, Lorg/apache/tools/zip/UnrecognizedExtraField;

    invoke-direct {v0}, Lorg/apache/tools/zip/UnrecognizedExtraField;-><init>()V

    .line 115
    invoke-virtual {v0, p0}, Lorg/apache/tools/zip/UnrecognizedExtraField;->setHeaderId(Lorg/apache/tools/zip/ZipShort;)V

    return-object v0
.end method

.method public static mergeCentralDirectoryData([Lorg/apache/tools/zip/ZipExtraField;)[B
    .locals 7

    .line 186
    array-length v0, p0

    mul-int/lit8 v0, v0, 0x4

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 187
    :goto_0
    array-length v3, p0

    if-lt v2, v3, :cond_1

    .line 190
    new-array v3, v0, [B

    const/4 v0, 0x0

    const/4 v2, 0x0

    .line 192
    :goto_1
    array-length v4, p0

    if-lt v0, v4, :cond_0

    return-object v3

    .line 193
    :cond_0
    aget-object v4, p0, v0

    invoke-interface {v4}, Lorg/apache/tools/zip/ZipExtraField;->getHeaderId()Lorg/apache/tools/zip/ZipShort;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/tools/zip/ZipShort;->getBytes()[B

    move-result-object v4

    const/4 v5, 0x2

    invoke-static {v4, v1, v3, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 195
    aget-object v4, p0, v0

    invoke-interface {v4}, Lorg/apache/tools/zip/ZipExtraField;->getCentralDirectoryLength()Lorg/apache/tools/zip/ZipShort;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/tools/zip/ZipShort;->getBytes()[B

    move-result-object v4

    add-int/lit8 v6, v2, 0x2

    invoke-static {v4, v1, v3, v6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 197
    aget-object v4, p0, v0

    invoke-interface {v4}, Lorg/apache/tools/zip/ZipExtraField;->getCentralDirectoryData()[B

    move-result-object v4

    add-int/lit8 v5, v2, 0x4

    .line 198
    array-length v6, v4

    invoke-static {v4, v1, v3, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 199
    array-length v4, v4

    add-int/lit8 v4, v4, 0x4

    add-int/2addr v2, v4

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 188
    :cond_1
    aget-object v3, p0, v2

    invoke-interface {v3}, Lorg/apache/tools/zip/ZipExtraField;->getCentralDirectoryLength()Lorg/apache/tools/zip/ZipShort;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/tools/zip/ZipShort;->getValue()I

    move-result v3

    add-int/2addr v0, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public static mergeLocalFileDataData([Lorg/apache/tools/zip/ZipExtraField;)[B
    .locals 7

    .line 162
    array-length v0, p0

    mul-int/lit8 v0, v0, 0x4

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 163
    :goto_0
    array-length v3, p0

    if-lt v2, v3, :cond_1

    .line 166
    new-array v3, v0, [B

    const/4 v0, 0x0

    const/4 v2, 0x0

    .line 168
    :goto_1
    array-length v4, p0

    if-lt v0, v4, :cond_0

    return-object v3

    .line 169
    :cond_0
    aget-object v4, p0, v0

    invoke-interface {v4}, Lorg/apache/tools/zip/ZipExtraField;->getHeaderId()Lorg/apache/tools/zip/ZipShort;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/tools/zip/ZipShort;->getBytes()[B

    move-result-object v4

    const/4 v5, 0x2

    invoke-static {v4, v1, v3, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 171
    aget-object v4, p0, v0

    invoke-interface {v4}, Lorg/apache/tools/zip/ZipExtraField;->getLocalFileDataLength()Lorg/apache/tools/zip/ZipShort;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/tools/zip/ZipShort;->getBytes()[B

    move-result-object v4

    add-int/lit8 v6, v2, 0x2

    invoke-static {v4, v1, v3, v6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 173
    aget-object v4, p0, v0

    invoke-interface {v4}, Lorg/apache/tools/zip/ZipExtraField;->getLocalFileDataData()[B

    move-result-object v4

    add-int/lit8 v5, v2, 0x4

    .line 174
    array-length v6, v4

    invoke-static {v4, v1, v3, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 175
    array-length v4, v4

    add-int/lit8 v4, v4, 0x4

    add-int/2addr v2, v4

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 164
    :cond_1
    aget-object v3, p0, v2

    invoke-interface {v3}, Lorg/apache/tools/zip/ZipExtraField;->getLocalFileDataLength()Lorg/apache/tools/zip/ZipShort;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/tools/zip/ZipShort;->getValue()I

    move-result v3

    add-int/2addr v0, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public static parse([B)[Lorg/apache/tools/zip/ZipExtraField;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .line 126
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    const/4 v1, 0x0

    .line 128
    :goto_0
    array-length v2, p0

    add-int/lit8 v2, v2, -0x4

    const-string v3, " is in unknown format"

    const-string v4, "data starting at "

    if-le v1, v2, :cond_1

    .line 146
    array-length p0, p0

    if-ne v1, p0, :cond_0

    .line 151
    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result p0

    new-array p0, p0, [Lorg/apache/tools/zip/ZipExtraField;

    .line 152
    invoke-virtual {v0, p0}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    return-object p0

    .line 147
    :cond_0
    new-instance p0, Ljava/util/zip/ZipException;

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0, v4}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 129
    :cond_1
    new-instance v2, Lorg/apache/tools/zip/ZipShort;

    invoke-direct {v2, p0, v1}, Lorg/apache/tools/zip/ZipShort;-><init>([BI)V

    .line 130
    new-instance v5, Lorg/apache/tools/zip/ZipShort;

    add-int/lit8 v6, v1, 0x2

    invoke-direct {v5, p0, v6}, Lorg/apache/tools/zip/ZipShort;-><init>([BI)V

    invoke-virtual {v5}, Lorg/apache/tools/zip/ZipShort;->getValue()I

    move-result v5

    add-int/lit8 v6, v1, 0x4

    add-int v7, v6, v5

    .line 131
    array-length v8, p0

    if-gt v7, v8, :cond_2

    .line 136
    :try_start_0
    invoke-static {v2}, Lorg/apache/tools/zip/ExtraFieldUtils;->createExtraField(Lorg/apache/tools/zip/ZipShort;)Lorg/apache/tools/zip/ZipExtraField;

    move-result-object v2

    .line 137
    invoke-interface {v2, p0, v6, v5}, Lorg/apache/tools/zip/ZipExtraField;->parseFromLocalFileData([BII)V

    .line 138
    invoke-virtual {v0, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v5, v5, 0x4

    add-int/2addr v1, v5

    goto :goto_0

    :catch_0
    move-exception p0

    .line 142
    new-instance v0, Ljava/util/zip/ZipException;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    :catch_1
    move-exception p0

    .line 140
    new-instance v0, Ljava/util/zip/ZipException;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 132
    :cond_2
    new-instance p0, Ljava/util/zip/ZipException;

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0, v4}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static register(Ljava/lang/Class;)V
    .locals 2

    .line 91
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/zip/ZipExtraField;

    .line 92
    sget-object v1, Lorg/apache/tools/zip/ExtraFieldUtils;->implementations:Ljava/util/Hashtable;

    invoke-interface {v0}, Lorg/apache/tools/zip/ZipExtraField;->getHeaderId()Lorg/apache/tools/zip/ZipShort;

    move-result-object v0

    invoke-virtual {v1, v0, p0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .line 98
    :catch_0
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object p0

    const-string v1, "\'s no-arg constructor is not public"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 96
    :catch_1
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object p0

    const-string v1, " is not a concrete class"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 94
    :catch_2
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object p0

    const-string v1, " doesn\'t implement ZipExtraField"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
