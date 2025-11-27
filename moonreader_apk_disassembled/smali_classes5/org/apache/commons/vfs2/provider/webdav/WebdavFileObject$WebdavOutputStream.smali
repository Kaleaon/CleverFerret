.class Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;
.super Lorg/apache/commons/vfs2/util/MonitorOutputStream;
.source "WebdavFileObject.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WebdavOutputStream"
.end annotation


# instance fields
.field private final file:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;

.field final synthetic this$0:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;


# direct methods
.method public constructor <init>(Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;)V
    .locals 0

    .line 89
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;->this$0:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;

    .line 90
    new-instance p1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {p1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/util/MonitorOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 91
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;->file:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;

    return-void
.end method

.method private createVersion(Ljava/lang/String;)Z
    .locals 1

    .line 96
    :try_start_0
    new-instance v0, Lorg/apache/jackrabbit/webdav/client/methods/VersionControlMethod;

    invoke-direct {v0, p1}, Lorg/apache/jackrabbit/webdav/client/methods/VersionControlMethod;-><init>(Ljava/lang/String;)V

    .line 97
    iget-object p1, p0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;->this$0:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;

    invoke-virtual {p1, v0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->setupMethod(Lorg/apache/commons/httpclient/HttpMethod;)V

    .line 98
    iget-object p1, p0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;->this$0:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;

    invoke-static {p1, v0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->access$000(Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;Lorg/apache/jackrabbit/webdav/client/methods/DavMethod;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p1, 0x1

    return p1

    :catch_0
    const/4 p1, 0x0

    return p1
.end method

.method private setUserName(Lorg/apache/commons/vfs2/provider/URLFileName;Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 194
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 195
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;->this$0:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;

    invoke-static {v1}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->access$200(Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;)Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystemConfigBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;->this$0:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;

    invoke-virtual {v2}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/commons/vfs2/FileSystem;->getFileSystemOptions()Lorg/apache/commons/vfs2/FileSystemOptions;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystemConfigBuilder;->getCreatorName(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;

    move-result-object v1

    .line 196
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/URLFileName;->getUserName()Ljava/lang/String;

    move-result-object p1

    if-nez v1, :cond_0

    move-object v1, p1

    goto :goto_0

    :cond_0
    if-eqz p1, :cond_1

    .line 201
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Modified by user "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 202
    new-instance v2, Lorg/apache/jackrabbit/webdav/property/DefaultDavProperty;

    sget-object v3, Lorg/apache/jackrabbit/webdav/version/DeltaVConstants;->COMMENT:Lorg/apache/jackrabbit/webdav/property/DavPropertyName;

    invoke-direct {v2, v3, p1}, Lorg/apache/jackrabbit/webdav/property/DefaultDavProperty;-><init>(Lorg/apache/jackrabbit/webdav/property/DavPropertyName;Ljava/lang/Object;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 205
    :cond_1
    :goto_0
    new-instance p1, Lorg/apache/jackrabbit/webdav/property/DefaultDavProperty;

    sget-object v2, Lorg/apache/jackrabbit/webdav/version/DeltaVConstants;->CREATOR_DISPLAYNAME:Lorg/apache/jackrabbit/webdav/property/DavPropertyName;

    invoke-direct {p1, v2, v1}, Lorg/apache/jackrabbit/webdav/property/DefaultDavProperty;-><init>(Lorg/apache/jackrabbit/webdav/property/DavPropertyName;Ljava/lang/Object;)V

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 206
    new-instance p1, Lorg/apache/jackrabbit/webdav/client/methods/PropPatchMethod;

    invoke-direct {p1, p2, v0}, Lorg/apache/jackrabbit/webdav/client/methods/PropPatchMethod;-><init>(Ljava/lang/String;Ljava/util/List;)V

    .line 207
    iget-object p2, p0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;->this$0:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;

    invoke-virtual {p2, p1}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->setupMethod(Lorg/apache/commons/httpclient/HttpMethod;)V

    .line 208
    iget-object p2, p0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;->this$0:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;

    invoke-static {p2, p1}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->access$000(Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;Lorg/apache/jackrabbit/webdav/client/methods/DavMethod;)V

    return-void
.end method


# virtual methods
.method protected onClose()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 110
    new-instance v0, Lorg/apache/commons/httpclient/methods/ByteArrayRequestEntity;

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;->out:Ljava/io/OutputStream;

    check-cast v1, Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/commons/httpclient/methods/ByteArrayRequestEntity;-><init>([B)V

    .line 111
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;->this$0:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;

    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/URLFileName;

    .line 112
    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;->this$0:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;

    invoke-static {v2, v1}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->access$100(Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;Lorg/apache/commons/vfs2/provider/URLFileName;)Ljava/lang/String;

    move-result-object v2

    .line 113
    iget-object v3, p0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;->this$0:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;

    invoke-static {v3}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->access$200(Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;)Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystemConfigBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;->this$0:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;

    invoke-virtual {v4}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/commons/vfs2/FileSystem;->getFileSystemOptions()Lorg/apache/commons/vfs2/FileSystemOptions;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystemConfigBuilder;->isVersioning(Lorg/apache/commons/vfs2/FileSystemOptions;)Z

    move-result v3

    if-eqz v3, :cond_5

    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 118
    :try_start_0
    iget-object v5, p0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;->this$0:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;

    invoke-virtual {v5, v1}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getPropertyNames(Lorg/apache/commons/vfs2/provider/URLFileName;)Lorg/apache/jackrabbit/webdav/property/DavPropertySet;

    move-result-object v5
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v6, 0x1

    goto :goto_0

    :catch_0
    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_0
    if-eqz v6, :cond_1

    if-eqz v5, :cond_1

    .line 123
    sget-object v7, Lorg/apache/jackrabbit/webdav/version/VersionControlledResource;->CHECKED_OUT:Lorg/apache/jackrabbit/webdav/property/DavPropertyName;

    invoke-virtual {v5, v7}, Lorg/apache/jackrabbit/webdav/property/DavPropertySet;->contains(Lorg/apache/jackrabbit/webdav/property/DavPropertyName;)Z

    move-result v7

    if-eqz v7, :cond_0

    const/4 v5, 0x0

    goto :goto_1

    .line 125
    :cond_0
    sget-object v7, Lorg/apache/jackrabbit/webdav/version/VersionControlledResource;->CHECKED_IN:Lorg/apache/jackrabbit/webdav/property/DavPropertyName;

    invoke-virtual {v5, v7}, Lorg/apache/jackrabbit/webdav/property/DavPropertySet;->contains(Lorg/apache/jackrabbit/webdav/property/DavPropertyName;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 126
    sget-object v7, Lorg/apache/jackrabbit/webdav/version/VersionControlledResource;->AUTO_VERSION:Lorg/apache/jackrabbit/webdav/property/DavPropertyName;

    invoke-virtual {v5, v7}, Lorg/apache/jackrabbit/webdav/property/DavPropertySet;->get(Lorg/apache/jackrabbit/webdav/property/DavPropertyName;)Lorg/apache/jackrabbit/webdav/property/DavProperty;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 128
    iget-object v5, p0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;->this$0:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;

    sget-object v7, Lorg/apache/jackrabbit/webdav/version/VersionControlledResource;->AUTO_VERSION:Lorg/apache/jackrabbit/webdav/property/DavPropertyName;

    invoke-virtual {v5, v1, v7}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getProperty(Lorg/apache/commons/vfs2/provider/URLFileName;Lorg/apache/jackrabbit/webdav/property/DavPropertyName;)Lorg/apache/jackrabbit/webdav/property/DavProperty;

    move-result-object v5

    .line 129
    const-string v7, "checkout-checkin"

    invoke-interface {v5}, Lorg/apache/jackrabbit/webdav/property/DavProperty;->getValue()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 130
    invoke-direct {p0, v2}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;->createVersion(Ljava/lang/String;)Z

    :cond_1
    const/4 v5, 0x1

    :goto_1
    if-eqz v6, :cond_2

    if-eqz v5, :cond_2

    .line 137
    :try_start_1
    new-instance v7, Lorg/apache/jackrabbit/webdav/client/methods/CheckoutMethod;

    invoke-direct {v7, v2}, Lorg/apache/jackrabbit/webdav/client/methods/CheckoutMethod;-><init>(Ljava/lang/String;)V

    .line 138
    iget-object v8, p0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;->this$0:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;

    invoke-virtual {v8, v7}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->setupMethod(Lorg/apache/commons/httpclient/HttpMethod;)V

    .line 139
    iget-object v8, p0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;->this$0:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;

    invoke-static {v8, v7}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->access$000(Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;Lorg/apache/jackrabbit/webdav/client/methods/DavMethod;)V
    :try_end_1
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    :catch_1
    :cond_2
    move v3, v5

    .line 147
    :goto_2
    :try_start_2
    new-instance v5, Lorg/apache/jackrabbit/webdav/client/methods/PutMethod;

    invoke-direct {v5, v2}, Lorg/apache/jackrabbit/webdav/client/methods/PutMethod;-><init>(Ljava/lang/String;)V

    .line 148
    invoke-virtual {v5, v0}, Lorg/apache/jackrabbit/webdav/client/methods/PutMethod;->setRequestEntity(Lorg/apache/commons/httpclient/methods/RequestEntity;)V

    .line 149
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;->this$0:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;

    invoke-virtual {v0, v5}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->setupMethod(Lorg/apache/commons/httpclient/HttpMethod;)V

    .line 150
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;->this$0:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;

    invoke-static {v0, v5}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->access$000(Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;Lorg/apache/jackrabbit/webdav/client/methods/DavMethod;)V

    .line 151
    invoke-direct {p0, v1, v2}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;->setUserName(Lorg/apache/commons/vfs2/provider/URLFileName;Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_3

    :catch_2
    move-exception v0

    if-eqz v3, :cond_4

    :goto_3
    if-nez v6, :cond_3

    .line 166
    invoke-direct {p0, v2}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;->createVersion(Ljava/lang/String;)Z

    .line 168
    :try_start_3
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;->this$0:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;

    invoke-virtual {v0, v1}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getPropertyNames(Lorg/apache/commons/vfs2/provider/URLFileName;)Lorg/apache/jackrabbit/webdav/property/DavPropertySet;

    move-result-object v0

    .line 169
    sget-object v1, Lorg/apache/jackrabbit/webdav/version/VersionControlledResource;->CHECKED_OUT:Lorg/apache/jackrabbit/webdav/property/DavPropertyName;

    invoke-virtual {v0, v1}, Lorg/apache/jackrabbit/webdav/property/DavPropertySet;->contains(Lorg/apache/jackrabbit/webdav/property/DavPropertyName;)Z

    move-result v0
    :try_end_3
    .catch Lorg/apache/commons/vfs2/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_3

    xor-int/lit8 v3, v0, 0x1

    goto :goto_4

    :catch_3
    nop

    :cond_3
    :goto_4
    if-nez v3, :cond_6

    .line 175
    new-instance v0, Lorg/apache/jackrabbit/webdav/client/methods/CheckinMethod;

    invoke-direct {v0, v2}, Lorg/apache/jackrabbit/webdav/client/methods/CheckinMethod;-><init>(Ljava/lang/String;)V

    .line 176
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;->this$0:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;

    invoke-virtual {v1, v0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->setupMethod(Lorg/apache/commons/httpclient/HttpMethod;)V

    .line 177
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;->this$0:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;

    invoke-static {v1, v0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->access$000(Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;Lorg/apache/jackrabbit/webdav/client/methods/DavMethod;)V

    goto :goto_5

    .line 155
    :cond_4
    :try_start_4
    new-instance v1, Lorg/apache/jackrabbit/webdav/client/methods/UncheckoutMethod;

    invoke-direct {v1, v2}, Lorg/apache/jackrabbit/webdav/client/methods/UncheckoutMethod;-><init>(Ljava/lang/String;)V

    .line 156
    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;->this$0:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;

    invoke-virtual {v2, v1}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->setupMethod(Lorg/apache/commons/httpclient/HttpMethod;)V

    .line 157
    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;->this$0:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;

    invoke-static {v2, v1}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->access$000(Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;Lorg/apache/jackrabbit/webdav/client/methods/DavMethod;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    .line 162
    :catch_4
    throw v0

    .line 180
    :cond_5
    new-instance v3, Lorg/apache/jackrabbit/webdav/client/methods/PutMethod;

    invoke-direct {v3, v2}, Lorg/apache/jackrabbit/webdav/client/methods/PutMethod;-><init>(Ljava/lang/String;)V

    .line 181
    invoke-virtual {v3, v0}, Lorg/apache/jackrabbit/webdav/client/methods/PutMethod;->setRequestEntity(Lorg/apache/commons/httpclient/methods/RequestEntity;)V

    .line 182
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;->this$0:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;

    invoke-virtual {v0, v3}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->setupMethod(Lorg/apache/commons/httpclient/HttpMethod;)V

    .line 183
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;->this$0:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;

    invoke-static {v0, v3}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->access$000(Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;Lorg/apache/jackrabbit/webdav/client/methods/DavMethod;)V

    .line 185
    :try_start_5
    invoke-direct {p0, v1, v2}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;->setUserName(Lorg/apache/commons/vfs2/provider/URLFileName;Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_5

    .line 190
    :catch_5
    :cond_6
    :goto_5
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;->file:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->resetAttributes()V

    return-void
.end method
