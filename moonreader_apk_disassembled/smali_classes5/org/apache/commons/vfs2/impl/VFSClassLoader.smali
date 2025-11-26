.class public Lorg/apache/commons/vfs2/impl/VFSClassLoader;
.super Ljava/security/SecureClassLoader;
.source "VFSClassLoader.java"


# instance fields
.field private final resources:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lorg/apache/commons/vfs2/FileObject;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemManager;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 61
    new-array v0, v0, [Lorg/apache/commons/vfs2/FileObject;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 p1, 0x0

    invoke-direct {p0, v0, p2, p1}, Lorg/apache/commons/vfs2/impl/VFSClassLoader;-><init>([Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemManager;Ljava/lang/ClassLoader;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemManager;Ljava/lang/ClassLoader;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 74
    new-array v0, v0, [Lorg/apache/commons/vfs2/FileObject;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-direct {p0, v0, p2, p3}, Lorg/apache/commons/vfs2/impl/VFSClassLoader;-><init>([Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemManager;Ljava/lang/ClassLoader;)V

    return-void
.end method

.method public constructor <init>([Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemManager;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 85
    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/vfs2/impl/VFSClassLoader;-><init>([Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemManager;Ljava/lang/ClassLoader;)V

    return-void
.end method

.method public constructor <init>([Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemManager;Ljava/lang/ClassLoader;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 99
    invoke-direct {p0, p3}, Ljava/security/SecureClassLoader;-><init>(Ljava/lang/ClassLoader;)V

    .line 51
    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    iput-object p3, p0, Lorg/apache/commons/vfs2/impl/VFSClassLoader;->resources:Ljava/util/ArrayList;

    .line 100
    invoke-direct {p0, p2, p1}, Lorg/apache/commons/vfs2/impl/VFSClassLoader;->addFileObjects(Lorg/apache/commons/vfs2/FileSystemManager;[Lorg/apache/commons/vfs2/FileObject;)V

    return-void
.end method

.method private addFileObjects(Lorg/apache/commons/vfs2/FileSystemManager;[Lorg/apache/commons/vfs2/FileObject;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 121
    array-length v0, p2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    aget-object v2, p2, v1

    .line 122
    invoke-interface {v2}, Lorg/apache/commons/vfs2/FileObject;->exists()Z

    move-result v3

    if-nez v3, :cond_0

    goto :goto_1

    .line 128
    :cond_0
    invoke-interface {p1, v2}, Lorg/apache/commons/vfs2/FileSystemManager;->canCreateFileSystem(Lorg/apache/commons/vfs2/FileObject;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 130
    invoke-interface {p1, v2}, Lorg/apache/commons/vfs2/FileSystemManager;->createFileSystem(Lorg/apache/commons/vfs2/FileObject;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v2

    .line 133
    :cond_1
    iget-object v3, p0, Lorg/apache/commons/vfs2/impl/VFSClassLoader;->resources:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method private defineClass(Ljava/lang/String;Lorg/apache/commons/vfs2/impl/Resource;)Ljava/lang/Class;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/apache/commons/vfs2/impl/Resource;",
            ")",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 160
    invoke-virtual {p2}, Lorg/apache/commons/vfs2/impl/Resource;->getCodeSourceURL()Ljava/net/URL;

    move-result-object v0

    .line 161
    invoke-virtual {p2}, Lorg/apache/commons/vfs2/impl/Resource;->getPackageName()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 163
    invoke-virtual {p0, v1}, Lorg/apache/commons/vfs2/impl/VFSClassLoader;->getPackage(Ljava/lang/String;)Ljava/lang/Package;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 165
    invoke-virtual {v2}, Ljava/lang/Package;->isSealed()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 166
    invoke-virtual {v2, v0}, Ljava/lang/Package;->isSealed(Ljava/net/URL;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    .line 167
    :cond_0
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string p2, "vfs.impl/pkg-sealed-other-url"

    invoke-direct {p1, p2, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p1

    .line 170
    :cond_1
    invoke-direct {p0, p2}, Lorg/apache/commons/vfs2/impl/VFSClassLoader;->isSealed(Lorg/apache/commons/vfs2/impl/Resource;)Z

    move-result v2

    if-nez v2, :cond_2

    goto :goto_0

    .line 171
    :cond_2
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string p2, "vfs.impl/pkg-sealing-unsealed"

    invoke-direct {p1, p2, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p1

    .line 175
    :cond_3
    invoke-direct {p0, v1, p2}, Lorg/apache/commons/vfs2/impl/VFSClassLoader;->definePackage(Ljava/lang/String;Lorg/apache/commons/vfs2/impl/Resource;)Ljava/lang/Package;

    .line 179
    :cond_4
    :goto_0
    invoke-virtual {p2}, Lorg/apache/commons/vfs2/impl/Resource;->getBytes()[B

    move-result-object v4

    .line 180
    invoke-virtual {p2}, Lorg/apache/commons/vfs2/impl/Resource;->getFileObject()Lorg/apache/commons/vfs2/FileObject;

    move-result-object p2

    invoke-interface {p2}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object p2

    invoke-interface {p2}, Lorg/apache/commons/vfs2/FileContent;->getCertificates()[Ljava/security/cert/Certificate;

    move-result-object p2

    .line 181
    new-instance v7, Ljava/security/CodeSource;

    invoke-direct {v7, v0, p2}, Ljava/security/CodeSource;-><init>(Ljava/net/URL;[Ljava/security/cert/Certificate;)V

    const/4 v5, 0x0

    .line 182
    array-length v6, v4

    move-object v2, p0

    move-object v3, p1

    invoke-virtual/range {v2 .. v7}, Lorg/apache/commons/vfs2/impl/VFSClassLoader;->defineClass(Ljava/lang/String;[BIILjava/security/CodeSource;)Ljava/lang/Class;

    move-result-object p1

    return-object p1
.end method

.method private definePackage(Ljava/lang/String;Lorg/apache/commons/vfs2/impl/Resource;)Ljava/lang/Package;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 198
    sget-object v0, Ljava/util/jar/Attributes$Name;->SPECIFICATION_TITLE:Ljava/util/jar/Attributes$Name;

    invoke-virtual {p2, v0}, Lorg/apache/commons/vfs2/impl/Resource;->getPackageAttribute(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;

    move-result-object v3

    .line 199
    sget-object v0, Ljava/util/jar/Attributes$Name;->SPECIFICATION_VENDOR:Ljava/util/jar/Attributes$Name;

    invoke-virtual {p2, v0}, Lorg/apache/commons/vfs2/impl/Resource;->getPackageAttribute(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;

    move-result-object v5

    .line 200
    sget-object v0, Ljava/util/jar/Attributes$Name;->SPECIFICATION_VERSION:Ljava/util/jar/Attributes$Name;

    invoke-virtual {p2, v0}, Lorg/apache/commons/vfs2/impl/Resource;->getPackageAttribute(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;

    move-result-object v4

    .line 201
    sget-object v0, Ljava/util/jar/Attributes$Name;->IMPLEMENTATION_TITLE:Ljava/util/jar/Attributes$Name;

    invoke-virtual {p2, v0}, Lorg/apache/commons/vfs2/impl/Resource;->getPackageAttribute(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;

    move-result-object v6

    .line 202
    sget-object v0, Ljava/util/jar/Attributes$Name;->IMPLEMENTATION_VENDOR:Ljava/util/jar/Attributes$Name;

    invoke-virtual {p2, v0}, Lorg/apache/commons/vfs2/impl/Resource;->getPackageAttribute(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;

    move-result-object v8

    .line 203
    sget-object v0, Ljava/util/jar/Attributes$Name;->IMPLEMENTATION_VERSION:Ljava/util/jar/Attributes$Name;

    invoke-virtual {p2, v0}, Lorg/apache/commons/vfs2/impl/Resource;->getPackageAttribute(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;

    move-result-object v7

    .line 206
    invoke-direct {p0, p2}, Lorg/apache/commons/vfs2/impl/VFSClassLoader;->isSealed(Lorg/apache/commons/vfs2/impl/Resource;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 207
    invoke-virtual {p2}, Lorg/apache/commons/vfs2/impl/Resource;->getCodeSourceURL()Ljava/net/URL;

    move-result-object p2

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    move-object v1, p0

    move-object v2, p1

    move-object v9, p2

    .line 212
    invoke-virtual/range {v1 .. v9}, Lorg/apache/commons/vfs2/impl/VFSClassLoader;->definePackage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/net/URL;)Ljava/lang/Package;

    move-result-object p1

    return-object p1
.end method

.method private isSealed(Lorg/apache/commons/vfs2/impl/Resource;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 189
    sget-object v0, Ljava/util/jar/Attributes$Name;->SEALED:Ljava/util/jar/Attributes$Name;

    invoke-virtual {p1, v0}, Lorg/apache/commons/vfs2/impl/Resource;->getPackageAttribute(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;

    move-result-object p1

    .line 190
    const-string v0, "true"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method private loadResource(Ljava/lang/String;)Lorg/apache/commons/vfs2/impl/Resource;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 328
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/VFSClassLoader;->resources:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/FileObject;

    .line 329
    sget-object v2, Lorg/apache/commons/vfs2/NameScope;->DESCENDENT_OR_SELF:Lorg/apache/commons/vfs2/NameScope;

    invoke-interface {v1, p1, v2}, Lorg/apache/commons/vfs2/FileObject;->resolveFile(Ljava/lang/String;Lorg/apache/commons/vfs2/NameScope;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v2

    .line 330
    invoke-interface {v2}, Lorg/apache/commons/vfs2/FileObject;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 331
    new-instance v0, Lorg/apache/commons/vfs2/impl/Resource;

    invoke-direct {v0, p1, v1, v2}, Lorg/apache/commons/vfs2/impl/Resource;-><init>(Ljava/lang/String;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileObject;)V

    return-object v0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private lookupFileObject(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;
    .locals 3

    .line 268
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/VFSClassLoader;->resources:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 269
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 270
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/FileObject;

    .line 271
    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/commons/vfs2/FileName;->getURI()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method


# virtual methods
.method protected copyPermissions(Ljava/security/PermissionCollection;Ljava/security/PermissionCollection;)V
    .locals 1

    .line 258
    invoke-virtual {p1}, Ljava/security/PermissionCollection;->elements()Ljava/util/Enumeration;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 259
    invoke-interface {p1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/security/Permission;

    .line 260
    invoke-virtual {p2, v0}, Ljava/security/PermissionCollection;->add(Ljava/security/Permission;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method protected findClass(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    const/16 v0, 0x2e

    const/16 v1, 0x2f

    .line 145
    :try_start_0
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    const-string v1, ".class"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 146
    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/impl/VFSClassLoader;->loadResource(Ljava/lang/String;)Lorg/apache/commons/vfs2/impl/Resource;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 150
    invoke-direct {p0, p1, v0}, Lorg/apache/commons/vfs2/impl/VFSClassLoader;->defineClass(Ljava/lang/String;Lorg/apache/commons/vfs2/impl/Resource;)Ljava/lang/Class;

    move-result-object p1

    return-object p1

    .line 148
    :cond_0
    new-instance v0, Ljava/lang/ClassNotFoundException;

    invoke-direct {v0, p1}, Ljava/lang/ClassNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    .line 152
    new-instance v1, Ljava/lang/ClassNotFoundException;

    invoke-direct {v1, p1, v0}, Ljava/lang/ClassNotFoundException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected findResource(Ljava/lang/String;)Ljava/net/URL;
    .locals 1

    const/4 v0, 0x0

    .line 287
    :try_start_0
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/impl/VFSClassLoader;->loadResource(Ljava/lang/String;)Lorg/apache/commons/vfs2/impl/Resource;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 289
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/impl/Resource;->getURL()Ljava/net/URL;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    :cond_0
    return-object v0
.end method

.method protected findResources(Ljava/lang/String;)Ljava/util/Enumeration;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Enumeration<",
            "Ljava/net/URL;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 308
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 310
    iget-object v1, p0, Lorg/apache/commons/vfs2/impl/VFSClassLoader;->resources:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/vfs2/FileObject;

    .line 311
    sget-object v3, Lorg/apache/commons/vfs2/NameScope;->DESCENDENT_OR_SELF:Lorg/apache/commons/vfs2/NameScope;

    invoke-interface {v2, p1, v3}, Lorg/apache/commons/vfs2/FileObject;->resolveFile(Ljava/lang/String;Lorg/apache/commons/vfs2/NameScope;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v3

    .line 312
    invoke-interface {v3}, Lorg/apache/commons/vfs2/FileObject;->exists()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 313
    new-instance v4, Lorg/apache/commons/vfs2/impl/Resource;

    invoke-direct {v4, p1, v2, v3}, Lorg/apache/commons/vfs2/impl/Resource;-><init>(Ljava/lang/String;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileObject;)V

    invoke-virtual {v4}, Lorg/apache/commons/vfs2/impl/Resource;->getURL()Ljava/net/URL;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 317
    :cond_1
    invoke-static {v0}, Ljava/util/Collections;->enumeration(Ljava/util/Collection;)Ljava/util/Enumeration;

    move-result-object p1

    return-object p1
.end method

.method public getFileObjects()[Lorg/apache/commons/vfs2/FileObject;
    .locals 2

    .line 110
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/VFSClassLoader;->resources:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Lorg/apache/commons/vfs2/FileObject;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/commons/vfs2/FileObject;

    return-object v0
.end method

.method protected getPermissions(Ljava/security/CodeSource;)Ljava/security/PermissionCollection;
    .locals 4

    .line 224
    :try_start_0
    invoke-virtual {p1}, Ljava/security/CodeSource;->getLocation()Ljava/net/URL;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v0

    .line 225
    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/impl/VFSClassLoader;->lookupFileObject(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    if-nez v0, :cond_0

    .line 227
    invoke-super {p0, p1}, Ljava/security/SecureClassLoader;->getPermissions(Ljava/security/CodeSource;)Ljava/security/PermissionCollection;

    move-result-object p1

    return-object p1

    .line 230
    :cond_0
    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileSystem;->getParentLayer()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    if-nez v0, :cond_1

    .line 232
    invoke-super {p0, p1}, Ljava/security/SecureClassLoader;->getPermissions(Ljava/security/CodeSource;)Ljava/security/PermissionCollection;

    move-result-object p1

    return-object p1

    .line 235
    :cond_1
    new-instance v1, Ljava/security/Permissions;

    invoke-direct {v1}, Ljava/security/Permissions;-><init>()V

    .line 236
    invoke-super {p0, p1}, Ljava/security/SecureClassLoader;->getPermissions(Ljava/security/CodeSource;)Ljava/security/PermissionCollection;

    move-result-object p1

    .line 237
    invoke-virtual {p0, p1, v1}, Lorg/apache/commons/vfs2/impl/VFSClassLoader;->copyPermissions(Ljava/security/PermissionCollection;Ljava/security/PermissionCollection;)V

    :goto_0
    if-eqz v0, :cond_2

    .line 240
    new-instance p1, Ljava/security/CodeSource;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getURL()Ljava/net/URL;

    move-result-object v2

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/commons/vfs2/FileContent;->getCertificates()[Ljava/security/cert/Certificate;

    move-result-object v3

    invoke-direct {p1, v2, v3}, Ljava/security/CodeSource;-><init>(Ljava/net/URL;[Ljava/security/cert/Certificate;)V

    .line 241
    invoke-super {p0, p1}, Ljava/security/SecureClassLoader;->getPermissions(Ljava/security/CodeSource;)Ljava/security/PermissionCollection;

    move-result-object p1

    .line 242
    invoke-virtual {p0, p1, v1}, Lorg/apache/commons/vfs2/impl/VFSClassLoader;->copyPermissions(Ljava/security/PermissionCollection;Ljava/security/PermissionCollection;)V

    .line 239
    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileSystem;->getParentLayer()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :cond_2
    return-object v1

    :catch_0
    move-exception p1

    .line 247
    new-instance v0, Ljava/lang/SecurityException;

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/FileSystemException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
