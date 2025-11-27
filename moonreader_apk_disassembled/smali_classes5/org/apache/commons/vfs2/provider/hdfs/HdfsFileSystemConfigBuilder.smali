.class public final Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;
.super Lorg/apache/commons/vfs2/FileSystemConfigBuilder;
.source "HdfsFileSystemConfigBuilder.java"


# static fields
.field private static final BUILDER:Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;

.field private static final KEY_CONFIG_CONF:Ljava/lang/String; = "configConf"

.field private static final KEY_CONFIG_NAMES:Ljava/lang/String; = "configNames"

.field private static final KEY_CONFIG_PATHS:Ljava/lang/String; = "configPaths"

.field private static final KEY_CONFIG_STREAM:Ljava/lang/String; = "configStream"

.field private static final KEY_CONFIG_URLS:Ljava/lang/String; = "configURLs"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 34
    new-instance v0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;-><init>()V

    sput-object v0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;->BUILDER:Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 42
    const-string v0, "hdfs."

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public static getInstance()Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;
    .locals 1

    .line 49
    sget-object v0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;->BUILDER:Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;

    return-object v0
.end method


# virtual methods
.method protected getConfigClass()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "+",
            "Lorg/apache/commons/vfs2/FileSystem;",
            ">;"
        }
    .end annotation

    .line 57
    const-class v0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystem;

    return-object v0
.end method

.method public getConfigConfiguration(Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/hadoop/conf/Configuration;
    .locals 1

    .line 250
    const-string v0, "configConf"

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;->getParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/hadoop/conf/Configuration;

    return-object p1
.end method

.method public getConfigInputStream(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/io/InputStream;
    .locals 1

    .line 220
    const-string v0, "configStream"

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;->getParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/io/InputStream;

    return-object p1
.end method

.method public getConfigNames(Lorg/apache/commons/vfs2/FileSystemOptions;)[Ljava/lang/String;
    .locals 1

    .line 68
    const-string v0, "configNames"

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;->getString(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 69
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, ","

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getConfigPaths(Lorg/apache/commons/vfs2/FileSystemOptions;)[Lorg/apache/hadoop/fs/Path;
    .locals 4

    .line 114
    const-string v0, "configPaths"

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;->getString(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 115
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 118
    :cond_0
    const-string v0, ","

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 119
    array-length v0, p1

    new-array v0, v0, [Lorg/apache/hadoop/fs/Path;

    const/4 v1, 0x0

    .line 120
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_1

    .line 121
    new-instance v2, Lorg/apache/hadoop/fs/Path;

    aget-object v3, p1, v1

    invoke-direct {v2, v3}, Lorg/apache/hadoop/fs/Path;-><init>(Ljava/lang/String;)V

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object v0

    :cond_2
    :goto_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public getConfigURLs(Lorg/apache/commons/vfs2/FileSystemOptions;)[Ljava/net/URL;
    .locals 5

    const/4 v0, 0x0

    .line 166
    :try_start_0
    const-string v1, "configURLs"

    invoke-virtual {p0, p1, v1}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;->getString(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 167
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 170
    :cond_0
    const-string v1, ","

    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 171
    array-length v1, p1

    new-array v1, v1, [Ljava/net/URL;

    const/4 v2, 0x0

    .line 172
    :goto_0
    array-length v3, p1

    if-ge v2, v3, :cond_1

    .line 173
    new-instance v3, Ljava/net/URL;

    aget-object v4, p1, v2

    invoke-direct {v3, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    aput-object v3, v1, v2
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v1

    :catch_0
    :cond_2
    :goto_1
    return-object v0
.end method

.method public setConfigConfiguration(Lorg/apache/commons/vfs2/FileSystemOptions;Lorg/apache/hadoop/conf/Configuration;)V
    .locals 1

    .line 269
    const-string v0, "configConf"

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setConfigInputStream(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/io/InputStream;)V
    .locals 1

    .line 239
    const-string v0, "configStream"

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setConfigName(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)V
    .locals 3

    .line 94
    const-string v0, "configNames"

    if-eqz p2, :cond_3

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 97
    :cond_0
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;->getString(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 98
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    .line 101
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    .line 99
    :cond_2
    :goto_0
    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :cond_3
    :goto_1
    const/4 p2, 0x0

    .line 95
    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setConfigPath(Lorg/apache/commons/vfs2/FileSystemOptions;Lorg/apache/hadoop/fs/Path;)V
    .locals 3

    .line 145
    const-string v0, "configPaths"

    if-nez p2, :cond_0

    const/4 p2, 0x0

    .line 146
    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    .line 148
    :cond_0
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;->getString(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 149
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    .line 152
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lorg/apache/hadoop/fs/Path;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    .line 150
    :cond_2
    :goto_0
    invoke-virtual {p2}, Lorg/apache/hadoop/fs/Path;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setConfigURL(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/net/URL;)V
    .locals 3

    .line 200
    const-string v0, "configURLs"

    if-nez p2, :cond_0

    const/4 p2, 0x0

    .line 201
    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    .line 203
    :cond_0
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;->getString(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 204
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    .line 207
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    .line 205
    :cond_2
    :goto_0
    invoke-virtual {p2}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method
